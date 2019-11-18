package project.F.P001.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;



import  project.F.P001.dao.F_P001DAO;


             
@Service("productitem")
@Transactional(propagation = Propagation.REQUIRED)
public class F_P001ServiceImpl implements F_P001Service{
	@Autowired
	private F_P001DAO f_P001DAO ;
	
	@Override
	public List searchItem() throws DataAccessException {
		List productlist = null; 
		System.out.println("���񽺽���");
		productlist=f_P001DAO.selectItem();
		return productlist;
	}
	
	@Autowired
	private F_P001DAO f_P001_D04DAO ;           
	
	@Override
	public List searchItem1() throws DataAccessException {
		List productlist1 = null; 
		System.out.println("���񽺽���");
		productlist1=f_P001_D04DAO.selectItem1();
		return productlist1;
	}
	
	
	@Autowired
	private F_P001DAO f_P001_D03DAO ;           
	
	@Override
	public List searchItem2() throws DataAccessException {
		List productlist2 = null; 
		System.out.println("���񽺽���");
		productlist2=f_P001_D03DAO.selectItem2();
		return productlist2;
	}


	@Autowired
	private F_P001DAO f_P001_D01DAO ;  
	@Override
	public List searchItem5() throws DataAccessException {
		List productlist5 = null; 
		System.out.println("service실행");
		productlist5=f_P001_D01DAO.selectItem5();
		return productlist5;
	}

	

}