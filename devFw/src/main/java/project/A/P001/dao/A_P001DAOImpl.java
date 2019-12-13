package project.A.P001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.A.P001.vo.A_P001VO;


@Repository("a_p001DAO") 
public class A_P001DAOImpl implements A_P001DAO {
	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public A_P001VO login(Map loginMap) throws DataAccessException{
		A_P001VO A_P001VO=(A_P001VO)sqlSession.selectOne("A.A_P001.login",loginMap);
	   return A_P001VO;
	
	}
	
	@Override
	public String searchId(Map sidMap)throws DataAccessException {
		String result = sqlSession.selectOne("A.A_P001.idsearch",sidMap);
		return result;
	}

	

}