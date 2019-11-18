package project.F.P001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface F_P001DAO {

	public List selectItem() throws DataAccessException;
	public List selectItem1() throws DataAccessException;
	public List selectItem2() throws DataAccessException;
	public List selectItem5() throws DataAccessException;

}