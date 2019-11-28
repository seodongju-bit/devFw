package project.C.P003.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


@Repository("C_P003DAO")
public class C_P003DAOImpl implements C_P003DAO{
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List noticeItem() throws DataAccessException {
		List noticelist = null;
		System.out.println("dao실행");
		noticelist=sqlSession.selectList("mapper.notice.noticeItem");
		System.out.println(noticelist);
		return noticelist;
	}
	@Override
	public int countBoard() {
		return sqlSession.selectOne("mapper.notice.countBoard");
	}
	

}
