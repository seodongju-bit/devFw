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
import project.C.P003.vo.PageVO;

@Service("noticeitem")
@Transactional(propagation = Propagation.REQUIRED)
public class C_P003ServiceImpl implements C_P003Service {

	@Autowired
	private C_P003DAO C_P003DAO;

	
	
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

	@Override           
	public List<Map<String, Object>> questionDetail(Map<String, Object> dataMap3) throws DataAccessException {
		// C_P003DAO.updateCNT(dataMaps);

		List noticeList5 = null;
		noticeList5=C_P003DAO.questionDetail(dataMap3); 
		System.out.println("service"+dataMap3);
		return noticeList5; 
	}
	@Override           
	public List<Map<String, Object>> questionDetail1(Map<String, Object> dataMap4) throws DataAccessException {
		// C_P003DAO.updateCNT(dataMaps);

		List noticeList6 = null;
		noticeList6=C_P003DAO.questionDetail1(dataMap4); 
		System.out.println("service"+dataMap4);
		return noticeList6; 
	}

	@Override
	public List listquestion(PageVO vo1) throws DataAccessException {
		List questionList = null;
		questionList = C_P003DAO.Allquestions(vo1);
		return questionList;  
	}     
           
   
	@Override
	public List listquestion1(PageVO vo1) throws DataAccessException {
		List questionList1 = null;
		questionList1 = C_P003DAO.Allquestions1(vo1);
		return questionList1;  
	}






}
