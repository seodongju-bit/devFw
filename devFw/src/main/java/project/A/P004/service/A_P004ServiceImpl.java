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


@Service("couponService")
@Transactional(propagation = Propagation.REQUIRED)
public class A_P004ServiceImpl implements A_P004Service {
	@Autowired
	private A_P004DAO couponDAO;

	@Override
	public List listCoupon() throws DataAccessException {
		List couponList = null;
		couponList = couponDAO.selectAllCouponList();
		return couponList;
	}	
}
