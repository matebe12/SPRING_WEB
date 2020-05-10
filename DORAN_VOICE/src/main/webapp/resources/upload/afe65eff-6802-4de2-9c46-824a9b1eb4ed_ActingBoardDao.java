package com.ex.dao;

import java.util.List;

import com.ex.dto.BoardVO;
import com.ex.dto.CategoryBoardVO;
import com.ex.dto.Criteria;
import com.ex.dto.SearchCriteria;

public interface ActingBoardDao {

	
	 // 작성
	 public void write(CategoryBoardVO vo) throws Exception;
	 
	 // 조회
	 public CategoryBoardVO read(int bno) throws Exception;
	 
	 // 수정
	 public void update(CategoryBoardVO vo) throws Exception;
	 
	 void updateViewCnt(int bno) throws Exception;

	 
	 // 삭제
	 public void delete(int bno) throws Exception;
	 
	 //개인연기목록
	 public List<CategoryBoardVO> listindividual() throws Exception;
	 
	//팀연기 목록
	 public List<CategoryBoardVO> listteam() throws Exception;
	//팀연기 목록
	 public List<CategoryBoardVO> listmonitor() throws Exception;
	 

	public List<CategoryBoardVO> listPage(int page) throws Exception;

	public List<CategoryBoardVO> teamlistCriteria(Criteria cri) throws Exception;

	public int teamcountPaging(Criteria cri) throws Exception;

	public List<CategoryBoardVO> individuallistCriteria(Criteria cri) throws Exception;

	public int individualcountPaging(Criteria cri) throws Exception;
	
	public List<CategoryBoardVO> monitorlistCriteria(Criteria cri) throws Exception;

	public int monitorcountPaging(Criteria cri) throws Exception;
	
	public List<CategoryBoardVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

}
