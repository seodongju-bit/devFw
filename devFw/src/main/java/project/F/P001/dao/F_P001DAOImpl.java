package project.F.P001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.F.P001.vo.F_P001VO;

@Repository("F_P001DAO")
public class F_P001DAOImpl implements F_P001DAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List F_P001Result05() throws DataAccessException {
		List<F_P001VO> list = null;	
	    list = sqlSession.selectList("F.P001.F_P001Result05");
		return list;
	}

}
