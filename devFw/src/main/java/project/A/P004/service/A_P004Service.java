package project.A.P004.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.A.P004.vo.A_P004VO;



public interface A_P004Service {
	 public List listCoupon(String p_id) throws DataAccessException;
	 public List<A_P004VO> listPoint(Map<String, Object> searchMap) throws DataAccessException;
	public List<Map<String, Object>> orderList(Map<String, Object> searchMap);
}
