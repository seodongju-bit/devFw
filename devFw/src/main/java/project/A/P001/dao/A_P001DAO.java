package project.A.P001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import project.A.P001.vo.A_P001VO;

public interface A_P001DAO {
	public A_P001VO login(Map loginMap) throws DataAccessException;
	public String selectOverlappedID(String mem_id) throws DataAccessException;
}




