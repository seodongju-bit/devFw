package project.C.P001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.C.P001.vo.C_P001VO;
import project.F.P002.vo.F_P002VO;



@Repository("EventDAO")
public class C_P001DAOImpl implements C_P001DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllEventList() throws DataAccessException {
		List<C_P001VO> eventList = null;
		eventList = sqlSession.selectList("mapper.event.selectAllEventList");
		System.out.println("eventList"+eventList);
		return eventList;
	}
	
	@Override
	public void updateCNT(Map<String, Object>dataMap) {
		sqlSession.update("mapper.event.updateCnt", dataMap);
	}
	
	@Override
	public List selectBoardDetail(Map<String, Object> dataMap) {
		List dataList = null;
		dataList = sqlSession.selectList("mapper.event.selectBoardDetail", dataMap);
		System.out.println("da0333333333333333333333333333333333"+dataList);
		return dataList;
	}
	
	
}
