package com.ex.dto;

import java.io.UnsupportedEncodingException;

import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

//페이징 계산용 클래스
public class PageMaker {

	private Criteria cri; // page, perPageNum 를 가짐

	private int totalCount;// 전체 게시글 수
	private int startPage; // 게시글 번호에 따른 페이지의 시작 번호
	private int endPage; // 게시글 번호에 따른 페이지 마지막 번호
	private boolean prev; // 이전버튼을 누를 수 있는/없는 경우 를 나눔
	private boolean next; // 게시글 다음
	private int displayPageNum = 5; // 페이징 5개단위로 자름

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	private void calcData() { // 페이징 값 계산해주는 메서드

		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		startPage = (endPage - displayPageNum) + 1;
		if (startPage <= 0)
			startPage = 1;

		prev = startPage == 1 ? false : true; // 1페이지 일때 이전 누를 수 없게 false 값 주기
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;

	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	// Param 작성
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum()).build();
		return uriComponents.toUriString();

	}

	// 클래스 PageMaker에서 URI를 만드는 메서드 makeQuery는 page와 perPageNum을 조합했는데
	// 검색 기능이 생기며 추가된 searchType과 keyword를 추가되었으므로
	// 메서드 makeSearch를 추가로 작성
	public String makeSearch(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("searchType", ((SearchCriteria) cri).getSearchType())
				.queryParam("keyword", encoding(((SearchCriteria) cri).getKeyword())).build();
		return uriComponents.toUriString();
	}

	// 검색 칸에 아무것도 입력하지않았을 때의 인코딩 처리
	private String encoding(String keyword) {
		if (keyword == null || keyword.trim().length() == 0) {
			return "";
		}
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}

}