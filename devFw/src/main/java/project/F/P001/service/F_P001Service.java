package project.F.P001.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import project.F.P001.vo.F_P001VO;

public interface F_P001Service {

	public List listproduct() throws DataAccessException;
	
}
