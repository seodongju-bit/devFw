package project.A.P004.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import project.A.P004.dao.A_P004DAO;
import project.A.P004.vo.A_P004VO;


@Service("activeService")
@Transactional(propagation = Propagation.REQUIRED)
public class A_P004ServiceImpl implements A_P004Service {
	@Autowired
	private A_P004DAO activeDAO;

	@Override
	public List listCoupon(String p_id) throws DataAccessException {
		List couponList = null;
		couponList = activeDAO.selectAllCouponList(p_id);
		return couponList;
	}	
	@Override
	public int couponcheck(Map<String, Object> check) {
		return activeDAO.couponcheck(check);
		
		
	}	
	@Override
	public List<A_P004VO> listPoint(Map<String, Object> searchMap) throws DataAccessException{
		List<A_P004VO> list = activeDAO.selectAllPointList(searchMap);
		System.out.println("22222222222222222222222222"+list);
		return list;
	}
	
	@Override
	public List<Map<String, Object>> orderList(Map<String, Object> searchMap) {
		List<Map<String, Object>> list= activeDAO.orderList(searchMap);	
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		
		for(int i=0; i<list.size();i++) {
			System.out.println(list.get(i).get("ROWNUMS").getClass().getName());
			BigDecimal big = (BigDecimal)list.get(i).get("ROWNUMS");
			int val = big.intValue();
			if(val > 2 ){ break;}
			result.add(list.get(i));
		}
		return result;
		
	}
	
	@Override
	public List<Map<String, Object>> orderList2(Map<String, Object> searchMap) {
		List<Map<String, Object>> list= activeDAO.orderList(searchMap);	
		
		return list;
		
	}
	
	@Override
	public List<Map<String, Object>> orderList3(Map<String, Object> searchMap) {
		List<Map<String, Object>> list= activeDAO.orderList3(searchMap);	
		
		return list;
		
	}
	
	@Override
	public List<Map<String, Object>> quList(Map<String, Object> searchMap) {
		List<Map<String, Object>> list= activeDAO.quList(searchMap);	
		
		return list;
		
	}
	
	@Override
	public void takecoupon(Map<String, Object> dataMap) throws DataAccessException{
		activeDAO.takecoupon(dataMap);
	}
	
	@Override
	public List givecoupon() throws DataAccessException {
		List couponList = null;
		couponList = activeDAO.givecoupon();
		return couponList;
	}
	@Override
	public int coulist(String p_id) throws DataAccessException{
		return activeDAO.coulist(p_id);
	}
	@Override
	public int baslist(String p_id) throws DataAccessException{
		return activeDAO.baslist(p_id);
	}
	@Override
	public int mempoint(String p_id) throws DataAccessException{
		return activeDAO.mempoint(p_id);
		
	}
	@Override
	public int delcount(String p_id) throws DataAccessException{
		return activeDAO.delcount(p_id);
	}
	@Override
	public int pointSearch(Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return activeDAO.pointSearch(searchMap);
	}
	@Override
	public boolean passCheck(String id, String password) {
		// TODO Auto-generated method stub
		return activeDAO.passCheck(id, password);
	}
	@Override
	public void withdrawSave(Map<String, String> withdrawMap) {
		// TODO Auto-generated method stub
		activeDAO.withdrawSave(withdrawMap);
		
	}
	
}
