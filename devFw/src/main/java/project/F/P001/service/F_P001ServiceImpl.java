package project.F.P001.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;



import  project.F.P001.dao.F_P001DAO;
import  project.F.P001.vo.F_P001VO;
             
@Service("F_P001Service")
@Transactional(propagation = Propagation.REQUIRED)
public class F_P001ServiceImpl implements F_P001Service{
	@Autowired
	private F_P001DAO F_P001DAO ;
	
	@Override
	public List listproduct() throws DataAccessException {
		List productList = null;
		productList = F_P001DAO.F_P001Result05();
		return productList;
	}

}
