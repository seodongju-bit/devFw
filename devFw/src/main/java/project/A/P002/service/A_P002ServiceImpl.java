package project.A.P002.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.A.P002.dao.A_P002DAO;
import project.A.P002.vo.A_P002VO;


@Service("a_p002Service")
@Transactional(propagation = Propagation.REQUIRED)
public class A_P002ServiceImpl implements A_P002Service {
	@Autowired
	A_P002DAO a_p002DAO;
	
	
	@Override
	public void addMember(A_P002VO A_P002VO) throws Exception{
		a_p002DAO.insertNewMember(A_P002VO);
	}
	
	@Override
	public String overlapped(String id) throws Exception{
		return a_p002DAO.selectOverlappedID(id);
	}
}