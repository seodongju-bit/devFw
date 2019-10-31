package project.A.P005.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.A.P005.dao.A_P001DAO;


@Service("basketService")
@Transactional(propagation = Propagation.REQUIRED)
public class A_P001ServiceImpl implements A_P001Service {
	@Autowired
	private A_P001DAO basketDAO;

	@Override
	public List listBasket() throws DataAccessException {
		List basketList = null;
		basketList = basketDAO.selectAllBasketList();
		return basketList;
	}

}
