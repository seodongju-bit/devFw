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
	public List noticeItem2() throws DataAccessException {
		List noticelist2 = null;                                                                                                                                                                                                                                         
		System.out.println("dao실행");
		noticelist2=sqlSession.selectList("mapper.notice.noticeItem2");
		System.out.println(noticelist2);
		return noticelist2;
	}


	

	
	
	@Override
	public int countBoard() {
		return sqlSession.selectOne("mapper.notice.countBoard");
	}
	@Override
	public List noticeDetail(Map<String, Object> dataMap) throws DataAccessException {
		List noticelist3 = null;
		noticelist3 = sqlSession.selectList("mapper.notice.noticeDetail", dataMap);
		System.out.println("dao실행"+noticelist3);
		return noticelist3;
	}

	@Override
	public List noticeDetail2(Map<String, Object> dataMap2) throws DataAccessException {
		List noticelist4 = null;
		noticelist4 = sqlSession.selectList("mapper.notice.noticeDetail2", dataMap2);
		System.out.println("dao실행"+noticelist4);
		return noticelist4;
	}




	

}
