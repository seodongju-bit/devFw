package project.B.P002.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.B.P002.vo.B_P002VO;


@Repository("B_P002DAO") 
public class B_P002DAOImpl implements B_P002DAO {
	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public void addSell(B_P002VO b_P002VO) throws DataAccessException {
		System.out.println("dao 실행");
		sqlSession.insert("B.P002.addSell", b_P002VO);
	}

	@Override
	public List<B_P002VO> selectItem(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("dao 실행");
		return sqlSession.selectList("B.P002.searchNum", searchMap);
				
	}
}
