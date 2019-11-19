package project.E.P001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.E.P001.vo.E_P001VO;
import project.E.P001.vo.E_P001VO2;


@Repository("E_P001DAO") 
public class E_P001DAOImpl implements E_P001DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<E_P001VO> selectItem(Map<String, Object> searchMap) throws DataAccessException {
		List<E_P001VO> list = sqlSession.selectList("E.P001.searchItem", searchMap);
		//System.out.println("dao:"+list);
		return list;
	}
	
	@Override
	public void insertNewOrder(List<E_P001VO2> myOrderList) throws DataAccessException {
		int order_number = selectOrderNumber();
		for(int i = 0; i < myOrderList.size(); i++) {
			E_P001VO2 e_P001VO2 = (E_P001VO2)myOrderList.get(i);
			e_P001VO2.setOrder_number(order_number);
			sqlSession.insert("E.P001.insertNewOrder", e_P001VO2);
		}
	}
	
	public E_P001VO2 findMyOrder(String order_number) throws DataAccessException {
		E_P001VO2 e_P001VO2 = (E_P001VO2)sqlSession.selectOne("E.P001.selectOrderNumber", order_number);
		return e_P001VO2;
	}
	
	private int selectOrderNumber() throws DataAccessException {
		return sqlSession.selectOne("E.P001.selectOrderNumber");
	}
	


}
