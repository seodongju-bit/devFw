package project.A.P004.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.A.P004.dao.A_P004DAO;
import project.A.P004.vo.A_P004VO;


@Service("activeService")
@Transactional(propagation = Propagation.REQUIRED)
public class A_P004ServiceImpl implements A_P004Service {
	@Autowired
	private A_P004DAO activeDAO;

	@Override
	public List listCoupon() throws DataAccessException {
		List couponList = null;
		couponList = activeDAO.selectAllCouponList();
		return couponList;
	}	
	@Override
	public List<A_P004VO> listPoint(Map<String, Object> searchMap) throws DataAccessException{
		List<A_P004VO> list = activeDAO.selectAllPointList(searchMap);
		System.out.println("22222222222222222222222222"+list);
		return list;
	}
}
