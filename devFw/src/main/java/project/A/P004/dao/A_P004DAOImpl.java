package project.A.P004.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.A.P004.vo.A_P004VO;



@Repository("CouponDAO")
public class A_P004DAOImpl implements A_P004DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllCouponList() throws DataAccessException {
		List<A_P004VO> couponList = null;
		couponList = sqlSession.selectList("mapper.coupon.selectAllCouponList");
		System.out.println(couponList);
		return couponList;
	}
}
