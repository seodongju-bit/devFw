package project.A.P003.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import project.A.P003.vo.A_P003VO;

public interface A_P003DAO {
	
	public void updateMyInfo(Map memberMap) throws DataAccessException;
	public A_P003VO selectMyDetailInfo(String mem_id) throws DataAccessException;

}




