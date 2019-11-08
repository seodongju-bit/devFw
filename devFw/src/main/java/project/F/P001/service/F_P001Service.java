package project.F.P001.service;

import java.util.List;

import org.springframework.dao.DataAccessException;


public interface F_P001Service {

	 public List searchItem() throws DataAccessException;

	public List searchItem1() throws DataAccessException;
     
	public List searchItem2() throws DataAccessException;

}
