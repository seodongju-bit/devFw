	package project.A.P003.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.A.P003.dao.A_P003DAO;
import project.A.P003.vo.A_P003VO;


@Service("a_p003Service")
@Transactional(propagation = Propagation.REQUIRED)
public class A_P003ServiceImpl implements A_P003Service {
	@Autowired
	A_P003DAO a_p003DAO;
	
	
	public A_P003VO  modifyMyInfo(Map memberMap) throws Exception{
		 String mem_id=(String)memberMap.get("mem_id");
		 a_p003DAO.updateMyInfo(memberMap);
		 return a_p003DAO.selectMyDetailInfo(mem_id);
	}
	
	public A_P003VO myDetailInfo(String mem_id) throws Exception{
		return a_p003DAO.selectMyDetailInfo(mem_id);
	}

}