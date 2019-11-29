package project.C.P003.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.C.P001.vo.PagingVO;

public interface C_P003Service {

	
	public List searchnotice() throws DataAccessException;
	public List searchnotice2() throws DataAccessException;
	
	public List<Map<String,Object>> noticeDetail(Map<String, Object> dataMap) throws DataAccessException;
	public List<Map<String,Object>> noticeDetail2(Map<String, Object> dataMap2) throws DataAccessException;

	 public List total(PagingVO vo) throws DataAccessException;
	
	public int countBoard();
}