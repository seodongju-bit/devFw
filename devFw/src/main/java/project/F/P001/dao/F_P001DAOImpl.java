package project.F.P001.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.F.P001.vo.F_P001VO;
import project.F.P001.vo.F_P001VO;

@Repository("F_P001DAO")
public class F_P001DAOImpl implements F_P001DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectItem() throws DataAccessException {
		List<F_P001VO> productlist = null;
		System.out.println("dao½ÇÇà");
		productlist = sqlSession.selectList("mapper.product.selectItem");
		System.out.println(productlist);
		return productlist;
	}
	
	
}
