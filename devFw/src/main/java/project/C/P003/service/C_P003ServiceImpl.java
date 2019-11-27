package project.C.P003.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.C.P003.dao.C_P003DAO;
import project.C.P003.vo.C_P003VO;

@Service("noticeitem")
@Transactional(propagation = Propagation.REQUIRED)
public class C_P003ServiceImpl implements C_P003Service {

	@Autowired
	private C_P003DAO C_P003DAO;
	@Autowired
	private C_P003VO C_P003VO;
	
	
	@Override
	public List searchnotice() throws DataAccessException {
		List noticelist = null;
		System.out.println("service실행");
		noticelist=C_P003DAO.noticeItem();
		return noticelist;
		
	}

	@Override
	public int countBoard() {
		return C_P003DAO.countBoard();
		
	}
	
}
