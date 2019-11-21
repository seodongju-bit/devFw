package project.F.P001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.F.P001.vo.F_P001VO;
import project.F.P001.vo.PagingVO;


public interface F_P001DAO {

	public List selectItem() throws DataAccessException;
	public List selectItem1() throws DataAccessException;
	public List selectItem2() throws DataAccessException;
	public List selectItem5() throws DataAccessException;
	public List memberReviewList(PagingVO vo) throws DataAccessException;
	public int countBoard();
    List<F_P001VO> searchoption(Map<String, Object> searchMap) throws DataAccessException;
 
    

    

}