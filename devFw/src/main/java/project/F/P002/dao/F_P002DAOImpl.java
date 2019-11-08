package project.F.P002.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.F.P002.vo.F_P002VO;


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
	public List<F_P002VO> mainList() throws DataAccessException {
		List<F_P002VO> mainList = sqlSession.selectList("F.P002.mainList");
	   return mainList;	
     
	}
	
	@Override
	public List<String> predictive(String keyword) throws DataAccessException {
	   List<String> list=(ArrayList)sqlSession.selectList("F.P002.searchKeyword",keyword);
	   System.out.println(list);
	   return list;
	}
	
	@Override
	public ArrayList searchProd(String searchWord) throws DataAccessException{
		ArrayList list=(ArrayList)sqlSession.selectList("F.P002.searchWord",searchWord);
		System.out.println(list);
		return list;
	}

	@Override
	public void addBasket(Map<String, Object> searchMap) throws DataAccessException { //상품 옵션검색
		System.out.println("addDao실행"+searchMap);
		sqlSession.insert("F.P002.addBasket", searchMap);
	}

}
