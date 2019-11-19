package project.A.P002.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.A.P002.vo.A_P002VO;


@Repository("a_p002DAO") 
public class A_P002DAOImpl implements A_P002DAO {
	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public void insertNewMember(A_P002VO A_P002VO) throws DataAccessException{
		sqlSession.insert("A.A_P002.insertNewMember",A_P002VO);
	}

	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result =  sqlSession.selectOne("A.A_P002.selectOverlappedID",id);
		return result;
	}
	
	public void verifyMember(A_P002VO A_P002VO){
		sqlSession.update("A.A_P002A.verifyMember",A_P002VO);
	}
	
}