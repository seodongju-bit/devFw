package project.A.P002.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import project.A.P002.vo.A_P002VO;

public interface A_P002DAO {
	
	public void insertNewMember(A_P002VO A_P002VO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	public String selectOverlappedEMAIL(Map emailMap) throws DataAccessException;
	public void verifyMember(A_P002VO A_P002VO) throws DataAccessException;

}




