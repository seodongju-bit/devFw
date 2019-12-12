package project.F.P001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.F.P001.vo.PagingVO;


public interface F_P001Service {

	 public List searchItem(Map<String, Object> searchMap) throws DataAccessException;

	public List searchItem1() throws DataAccessException;
     
	public List searchItem2() throws DataAccessException;

	public List searchItem5() throws DataAccessException;
	
	public List listEvent(PagingVO vo) throws DataAccessException;

	public int countBoard();

	public List searchoption(Map<String, Object> searchMap) throws DataAccessException;
	

	public List bannerList() throws DataAccessException;
	

	




                                                                


}