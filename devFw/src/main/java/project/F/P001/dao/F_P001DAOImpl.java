package project.F.P001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.F.P001.vo.PagingVO;
import project.F.P001.vo.F_P001VO;


@Repository("F_P001DAO")
public class F_P001DAOImpl implements F_P001DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectItem() throws DataAccessException {
		List<F_P001VO> productlist = null;
		System.out.println("dao����");
		productlist = sqlSession.selectList("mapper.product.selectItem");
		System.out.println(productlist);
		return productlist;
	}

	@Override
	public List<F_P001VO> searchoption(Map<String, Object> searchMap) throws DataAccessException { 
		List<F_P001VO> productlist = sqlSession.selectList("F.P001.searchoption", searchMap);
		System.out.println("dao실행"); 
		return productlist;
	}

	

	@Override
	public List selectItem1() throws DataAccessException {
		List<F_P001VO> productlist1 = null;
		System.out.println("dao����");        
		productlist1 = sqlSession.selectList("mapper.product.selectItem1");
		System.out.println(productlist1);
		return productlist1;
	}

	
	@Override
	public List selectItem2() throws DataAccessException {
		List<F_P001VO> productlist2 = null;
		System.out.println("dao����");    
		productlist2 = sqlSession.selectList("mapper.product.selectItem2");
		System.out.println(productlist2);
		return productlist2;
	}




	@Override
	public List selectItem5() throws DataAccessException {
		List<F_P001VO> productlist5 = null;
		System.out.println("dao실행");    
		productlist5 = sqlSession.selectList("mapper.product.selectItem5");
		System.out.println(productlist5);
		return productlist5;
	}
	
	
	
	@Override
	public List memberReviewList(PagingVO vo) throws DataAccessException {
		List<F_P001VO> reviewList = null;
		reviewList = sqlSession.selectList("mapper.product.memberReviewList", vo);
		System.out.println("reviewList"+reviewList);
		return reviewList;
	}


	@Override
	public int countBoard() {
		return sqlSession.selectOne("mapper.product.countBoard");
	}





}
   