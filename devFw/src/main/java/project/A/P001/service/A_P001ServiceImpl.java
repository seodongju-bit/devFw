package project.A.P001.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.A.P001.dao.A_P001DAO;
import project.A.P001.vo.A_P001VO;


@Service("a_p001Service")
@Transactional(propagation = Propagation.REQUIRED)
public class A_P001ServiceImpl implements A_P001Service {
	@Autowired
	A_P001DAO a_p001DAO;
	
	@Autowired
	private SqlSession sqlSession;	
	
	
	@Override
	public A_P001VO login(Map  loginMap) throws Exception{
		return a_p001DAO.login(loginMap);
	}
	
	
	public String get_searchId(Map sidMap)throws Exception {

		a_p001DAO = sqlSession.getMapper(A_P001DAO.class);
	
		System.out.println("서비스 확인" + a_p001DAO.searchId(sidMap));
		String result = "";

		try {
			result = a_p001DAO.searchId(sidMap);
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("서비스 확인 :" + a_p001DAO);
		return result;
	}

}