package project.C.P003.dao;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.servlet.ModelAndView;

import project.C.P001.vo.PagingVO;


public interface C_P003DAO {

	public List noticeItem() throws DataAccessException;
	
	public List noticeItem2() throws DataAccessException;
	
	public List noticeDetail(Map<String, Object> dataMap) throws DataAccessException;

	public List noticeDetail2(Map<String, Object> dataMap2) throws DataAccessException;
	
	public List totalnoticeList(PagingVO vo) throws DataAccessException;
	
	public int countBoard();
	
	

	
  
}
