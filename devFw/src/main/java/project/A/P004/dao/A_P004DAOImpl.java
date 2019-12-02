package project.A.P004.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.A.P004.vo.A_P004VO;



@Repository("ActiveDAO")
public class A_P004DAOImpl implements A_P004DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllCouponList(String p_id) throws DataAccessException {
		List<A_P004VO> couponList = null;
		couponList = sqlSession.selectList("mapper.active.selectAllCouponList", p_id);
		System.out.println(couponList);
		return couponList;
	}
	
	@Override
	public List<A_P004VO> selectAllPointList(Map<String, Object> searchMap) throws DataAccessException {
	List<A_P004VO> list =  sqlSession.selectList("mapper.active.selectAllPointlist", searchMap);
		return list;
		
	}

	@Override
	public List<Map<String, Object>> orderList(Map<String, Object> searchMap) {
		System.out.println("mypage dao도착"+searchMap);
		//orders 테이블 정리되면 수정,  일단 orderdetail 다 뽑아서 감
		return sqlSession.selectList("mapper.active.orderList",searchMap);
	}
	
	@Override
	public int takecoupon(Map<String, Object> dataMap) throws DataAccessException {
	int result =  sqlSession.insert("mapper.active.takecoupon", dataMap);
		return result;
		
	}
	
	@Override
	public List givecoupon() throws DataAccessException {
		List<A_P004VO> couponList = null;
		couponList = sqlSession.selectList("mapper.active.givecoupon");
		System.out.println(couponList);
		return couponList;
	}

	@Override
	public int couponcheck(String co_number) {
		return sqlSession.selectOne("mapper.active.countcoupon", co_number);
	}
}
