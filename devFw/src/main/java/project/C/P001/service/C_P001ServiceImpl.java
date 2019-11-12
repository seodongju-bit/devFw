package project.C.P001.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import project.C.P001.dao.C_P001DAO;
import project.C.P001.vo.C_P001VO;
import project.F.P002.vo.F_P002VO;


@Service("eventService")
@Transactional(propagation = Propagation.REQUIRED)
public class C_P001ServiceImpl implements C_P001Service {
	@Autowired
	private C_P001DAO eventDAO;

	@Override
	public List listEvent() throws DataAccessException {
		List eventList = null;
		eventList = eventDAO.selectAllEventList();
		return eventList;
	}		
	
	public List selectBoardDetail(Map<String, Object> dataMap) throws DataAccessException {
		
		eventDAO.updateCNT(dataMap);
		
//		eventDAO.updateViewCnt(param); //게시글 조횟수 늘리기가 선행되어야 한다. 
		List dataList = null;
		dataList=eventDAO.selectBoardDetail(dataMap); 
		System.out.println("service22222222222222222222222222"+dataMap);
		return dataList; 
	}
		
}
