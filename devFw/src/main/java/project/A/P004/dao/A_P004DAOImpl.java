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
	public List<Map<String, Object>> orderList2(Map<String, Object> searchMap) {
		System.out.println("mypage dao도착"+searchMap);
		//orders 테이블 정리되면 수정,  일단 orderdetail 다 뽑아서 감
		return sqlSession.selectList("mapper.active.orderList2",searchMap);
	}
	
	@Override
	public List<Map<String, Object>> orderList3(Map<String, Object> searchMap) {
		System.out.println("mypage dao도착"+searchMap);
		//orders 테이블 정리되면 수정,  일단 orderdetail 다 뽑아서 감
		List<Map<String, Object>> list =sqlSession.selectList("mapper.active.orderList3",searchMap);
		System.out.println(">>>"+ list);
		return list;
	}
	
	@Override
	public List<Map<String, Object>> quList(Map<String, Object> searchMap) {
		System.out.println("mypage dao도착"+searchMap);
		//orders 테이블 정리되면 수정,  일단 orderdetail 다 뽑아서 감
		List<Map<String, Object>> list =sqlSession.selectList("mapper.active.quList",searchMap);
		System.out.println(">>>"+ list);
		return list;
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
	public int couponcheck(Map<String, Object> check) throws DataAccessException {
		return sqlSession.selectOne("mapper.active.countcoupon", check);
	}

	@Override
	public int coulist(String p_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.active.coulist", p_id);
	}
	@Override
	public int baslist(String p_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.active.baslist", p_id);
	}
	@Override
	public int mempoint(String p_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.active.mempoint", p_id);
	}
	@Override
	public int delcount(String p_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.active.delcount", p_id);
	}
	
	@Override
	public int question(String p_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.active.question", p_id);
	}

	@Override
	public List<Map<String,Object>> listquestion(Map<String, Object> searchMap) {
		List list =sqlSession.selectList("mapper.active.listquestion",searchMap);
		System.out.println(">>>"+ list);
		return list;
	}
	@Override
	public List alert(String p_id) throws DataAccessException {
		List alertList = null;
		alertList = sqlSession.selectList("mapper.active.alert", p_id);
		System.out.println(alertList);
		return alertList;
	}
	@Override
	public int pointSearch(Map<String, Object> searchMap) {
		int point = sqlSession.selectOne("mapper.active.pointSearch", searchMap);
		return point;
	}

	@Override
	public boolean passCheck(String id, String password) {
		String check_id = sqlSession.selectOne("mapper.active.passCheck", id );
		return password.equals(check_id);
	}

	@Override
	public void withdrawSave(Map<String, String> withdrawMap) {
		// TODO Auto-generated method stub
		sqlSession.insert("mapper.active.withdrawSave", withdrawMap);
		sqlSession.update("mapper.active.pointDeduction", withdrawMap);
		sqlSession.insert("mapper.active.pointUseRecord", withdrawMap);

	}
}
