package project.D.P001.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.D.P001.dao.D_P001DAO;




@Service("reviewitem")
@Transactional(propagation = Propagation.REQUIRED)
public class D_P001ServiceImpl implements D_P001Service {
	@Autowired
	private D_P001DAO D_P001DAO ;
	
	
	@Override
	public List reviewItem() throws DataAccessException {
		
		List reviewlist = null;
	    System.out.println("service 실행");
	    reviewlist=D_P001DAO.reviewItem();
	    return reviewlist;
	
	}
	

	
	
	
}
