package project.E.P001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.E.P001.vo.E_P001VO;


@Repository("E_P001DAO") 
public class E_P001DAOImpl implements E_P001DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<E_P001VO> selectItem(Map<String, Object> searchMap) throws DataAccessException {
		List<E_P001VO> list = sqlSession.selectList("E.P001.searchItem", searchMap);
		//System.out.println("dao:"+list);
		return list;
	}
	
	


}
