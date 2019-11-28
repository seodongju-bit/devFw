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
	public List searchnotice2() throws DataAccessException {
		List noticelist2 = null;
		System.out.println("service실행");
		noticelist2=C_P003DAO.noticeItem2();
		return noticelist2;
	}




	@Override
	public int countBoard() {
		return C_P003DAO.countBoard();
		
	}

	@Override           
	public List<Map<String, Object>> noticeDetail(Map<String, Object> dataMap) throws DataAccessException {
		// C_P003DAO.updateCNT(dataMaps);

		List noticeList3 = null;
		noticeList3=C_P003DAO.noticeDetail(dataMap); 
		System.out.println("service"+dataMap);
		return noticeList3; 
	}

	@Override           
	public List<Map<String, Object>> noticeDetail2(Map<String, Object> dataMap2) throws DataAccessException {
		// C_P003DAO.updateCNT(dataMaps);

		List noticeList4 = null;
		noticeList4=C_P003DAO.noticeDetail2(dataMap2); 
		System.out.println("service"+dataMap2);
		return noticeList4; 
	}





}
