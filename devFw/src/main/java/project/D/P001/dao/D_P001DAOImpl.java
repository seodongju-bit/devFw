package project.D.P001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.D.P001.vo.D_P001VO;

@Repository("D_P001DAO")
public class D_P001DAOImpl implements D_P001DAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List reviewItem() throws DataAccessException {
		List<D_P001VO> reviewlist= null;
		System.out.println("dao실행");
		reviewlist = sqlSession.selectList("mapper.review.reviewItem");
		System.out.println(reviewlist);
		return reviewlist;
	}

	@Override
	public List reviewItem2() throws DataAccessException {
	   List<D_P001VO> reviewlist2 = null;
	   System.out.println("dao실행");
	   reviewlist2 = sqlSession.selectList("mapper.review.reviewItem2");
	   System.out.println(reviewlist2);
	   return reviewlist2;
	   
		
	}
	

}
