package project.A.P003.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.aspectj.ajde.internal.LstBuildConfigFileParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.A.P002.vo.A_P002VO;
import project.A.P003.vo.A_P003VO;


@Repository("a_p003DAO") 
public class A_P003DAOImpl implements A_P003DAO {
	@Autowired
	private SqlSession sqlSession;	
	
	public void updateMyInfo(Map memberMap) throws DataAccessException{
		sqlSession.update("A.A_P003.updateMyInfo",memberMap);
	}
	
	public A_P003VO selectMyDetailInfo(String mem_id) throws DataAccessException{
		A_P003VO A_P003VO=(A_P003VO)sqlSession.selectOne("A.A_P003.selectMyDetailInfo",mem_id);
		return A_P003VO;
		
	}
	
	
	public void Secessionmember(A_P003VO A_P003VO) throws DataAccessException {
		sqlSession.update("A.A_P003.Secessionmember",A_P003VO);
	}
	
}