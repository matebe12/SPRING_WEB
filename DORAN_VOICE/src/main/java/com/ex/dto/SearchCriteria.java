package com.ex.dto;

public class SearchCriteria extends Criteria {// 검색처리 구현 이전의 코드와 차이점을 주기위해서
												// SearchCriteria클래스를 작성.
												// 기존의 코드를 구분하고, 코드수정을 최소화 할 수 있음.
	private String searchType; // 검색 조건
	private String keyword; // 검색 키워드

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return super.toString() + " SearchCriteria " + "[searchType=" + searchType + ", keyword=" + keyword + "]";
	}

}