package project.A.P005.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.A.P005.vo.A_P005VO;



@Repository("BasketDAO")
public class A_P005DAOImpl implements A_P005DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllBasketList() throws DataAccessException {
		List<A_P005VO> basketList = null;
		basketList = sqlSession.selectList("mapper.basket.selectAllBasketList");
		System.out.println(basketList);
		return basketList;
	}

}
