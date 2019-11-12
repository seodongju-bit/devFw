package project.C.P001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.C.P001.vo.C_P001VO;
import project.F.P002.vo.F_P002VO;



public interface C_P001DAO {
	 public List selectAllEventList() throws DataAccessException;
	 public List selectBoardDetail(Map<String, Object> dataMap) throws DataAccessException;
	 public void updateCNT(Map<String, Object> dataMap) throws DataAccessException;
}
