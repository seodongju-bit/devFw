package project.B.P002.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.B.P002.vo.B_P002VO;


public interface B_P002DAO {

	void addSell(B_P002VO b_P002VO) throws DataAccessException;

	List<B_P002VO> selectItem(Map<String, Object> searchMap) throws DataAccessException;


	 
	 
}
