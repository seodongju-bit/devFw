package project.C.P003.dao;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;


public interface C_P003DAO {

	public List noticeItem() throws DataAccessException;
	public int countBoard();
	
}
