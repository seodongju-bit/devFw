package project.B.P001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import project.B.P001.vo.B_P001VO;

public interface B_P001DAO {
	 public List<B_P001VO> selectItem(Map<String, Object> searchMap) throws DataAccessException;


	 
	 
}
