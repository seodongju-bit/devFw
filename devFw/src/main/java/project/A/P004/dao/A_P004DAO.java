package project.A.P004.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.A.P004.vo.A_P004VO;



public interface A_P004DAO {
	 public List selectAllCouponList(String p_id) throws DataAccessException;
	 public List<A_P004VO> selectAllPointList(Map<String, Object> searchMap) throws DataAccessException;
}

