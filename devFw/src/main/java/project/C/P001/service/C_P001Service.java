package project.C.P001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.C.P001.vo.C_P001VO;
import project.F.P002.vo.F_P002VO;



public interface C_P001Service {
	 public List listEvent() throws DataAccessException;
	 public List<Map<String,Object>> selectBoardDetail(Map<String, Object> dataMap) throws DataAccessException;
}
