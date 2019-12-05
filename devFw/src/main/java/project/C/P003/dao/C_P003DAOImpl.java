package project.C.P003.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;


import project.C.P003.vo.C_P003VO;
import project.C.P003.vo.PageVO;


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
	
	@Override
	public List questionDetail(Map<String, Object> dataMap3) throws DataAccessException {
		List noticelist5 = null;
		noticelist5 = sqlSession.selectList("mapper.notice.questionDetail", dataMap3);
		System.out.println("dao실행"+noticelist5);
		return noticelist5;
	}
	
	@Override
	public List questionDetail1(Map<String, Object> dataMap4) throws DataAccessException {
		List noticelist6 = null;
		noticelist6 = sqlSession.selectList("mapper.notice.questionDetail1", dataMap4);
		System.out.println("dao실행"+noticelist6);
		return noticelist6;
	}

	@Override
	public List Allquestions(PageVO vo1) throws DataAccessException {
		List<C_P003VO> questionList = null;
		questionList = sqlSession.selectList("mapper.notice.Allquestions", vo1);
		System.out.println("dao실행"+questionList);
		return questionList;
	}
                         
	@Override
	public List Allquestions1(PageVO vo1) throws DataAccessException {
		List<C_P003VO> questionList1 = null;
		questionList1 = sqlSession.selectList("mapper.notice.Allquestions1", vo1);
		System.out.println("dao실행"+questionList1);
		return questionList1;
	}

	
	@Override
	public void writes(Map<String, Object> dataMap5) throws DataAccessException {
		sqlSession.insert("mapper.notice.questionwrite", dataMap5);
	}
	
		
	}


