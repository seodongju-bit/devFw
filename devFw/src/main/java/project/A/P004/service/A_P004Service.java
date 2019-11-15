package project.A.P004.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.A.P004.vo.A_P004VO;



public interface A_P004Service {
	 public List listCoupon() throws DataAccessException;
}
