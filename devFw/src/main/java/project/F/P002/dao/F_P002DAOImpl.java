package project.F.P002.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.F.P001.vo.F_P001VO;
import project.F.P002.vo.F_P002VO;
import project.main.paging.MainPagingVO;
import project.search.paging.SearchPagingVO;
import project.search.vo.SearchVO;


@Repository("F_P002DAO") 
public class F_P002DAOImpl implements F_P002DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<F_P002VO> selectItem(Map<String, Object> searchMap) throws DataAccessException { //상품검색해서 상세페이지로
		List<F_P002VO> list = sqlSession.selectList("F.P002.searchItem", searchMap);
		System.out.println(list);
		return list;
	}
	
	@Override
	public List<F_P002VO> searchOption(Map<String, Object> searchMap) throws DataAccessException { //상품 옵션검색
		List<F_P002VO> list = sqlSession.selectList("F.P002.searchOption", searchMap);
		return list;
	}
	@Override
	public List<String> predictive(String keyword) throws DataAccessException {
	   List<String> list=(ArrayList)sqlSession.selectList("F.P002.searchKeyword",keyword);
	   System.out.println(list);
	   return list;
	}
	@Override
	public List<F_P002VO> mainList(MainPagingVO mainpagingVO) throws Exception {
		return sqlSession.selectList("F.P002.mainList", mainpagingVO);	
	}
	@Override
	public int countList() throws Exception {
		return sqlSession.selectOne("F.P002.countList");
	}
	
	@Override
	public List<F_P002VO> searchList(SearchVO searchVO) throws Exception {
		return sqlSession.selectList("F.P002.searchWord", searchVO);
	}
	
	public int countSearch(SearchVO searchVO) throws Exception {
		return sqlSession.selectOne("F.P002.countSearch", searchVO);
	}
	
	@Override
	public void addBasket(Map<String, Object> searchMap) throws DataAccessException { //상품 옵션검색
		sqlSession.insert("F.P002.addBasket", searchMap);
	}

	@Override
	public List<Map<String, Object>> searchReview(Map<String, Object> searchMap) {
		return sqlSession.selectList("F.P002.searchReview", searchMap);
	}

}
