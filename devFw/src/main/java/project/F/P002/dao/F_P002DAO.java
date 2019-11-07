package project.F.P002.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import project.F.P002.vo.F_P002VO;

public interface F_P002DAO {
	 public List<F_P002VO> selectItem(Map<String, Object> searchMap) throws DataAccessException;

	List<F_P002VO> searchOption(Map<String, Object> searchMap) throws DataAccessException;

	void addBasket(Map<String, Object> searchMap) throws DataAccessException;


	 
	 
}
