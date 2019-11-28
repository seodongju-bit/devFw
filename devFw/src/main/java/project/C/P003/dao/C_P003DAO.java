package project.C.P003.dao;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;


public interface C_P003DAO {

	public List noticeItem() throws DataAccessException;
	
	public List noticeItem2() throws DataAccessException;
	
	public List noticeDetail(Map<String, Object> dataMap) throws DataAccessException;

	public List noticeDetail2(Map<String, Object> dataMap2) throws DataAccessException;
	
	public int countBoard();
	
}
