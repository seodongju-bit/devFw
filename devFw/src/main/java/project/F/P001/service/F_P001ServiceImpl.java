package project.F.P001.service;

import java.util.List;

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
		List list = null; 
		System.out.println("서비스실행");
         list=f_P001DAO.selectItem();
		return list;
	}
	
	@Autowired
	private F_P001DAO f_P001_D04DAO ;           
	
	@Override
	public List searchItem1() throws DataAccessException {
		List list1 = null; 
		System.out.println("서비스실행");
         list1=f_P001_D04DAO.selectItem1();
		return list1;
	}
	
	
	@Autowired
	private F_P001DAO f_P001_D03DAO ;           
	
	@Override
	public List searchItem2() throws DataAccessException {
		List list2 = null; 
		System.out.println("서비스실행");
         list2=f_P001_D03DAO.selectItem2();
		return list2;
	}
	
          

}
