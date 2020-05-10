package com.ex.dto;

//페이징
public class Criteria { // 페이징 기준을 정의하는 클래스
	private int page; // 보여줄 현재 페이지
	private int perPageNum; // 페이지 당 보여줄 페이지 수

	// limit 구문에서 시작 부분에 필요한 값 반환(mybatis)
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	public Criteria() {
		this.page = 1; // 기본으로 1페이지 부터 보여줌
		this.perPageNum = 10; // 페이지당 10개씩 출력
	}

	// getter/setter 작성
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0) { // 무조건 1페이지부터 보여주게 설정
			this.page = 1;
		} else {
			this.page = page;
		}
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if (pageCount != cnt) {
			this.perPageNum = cnt;
		} else {
			this.perPageNum = pageCount;
		}
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}

}