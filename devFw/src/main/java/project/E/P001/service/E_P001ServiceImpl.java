package project.E.P001.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.E.P001.dao.E_P001DAO;
import project.E.P001.vo.E_P001VO;


@Service("E_P001Service")
@Transactional(propagation = Propagation.REQUIRED)
public class E_P001ServiceImpl implements E_P001Service {
	@Autowired
	private E_P001DAO e_P001DAO;
	
	@Override
	public List<E_P001VO> selectItem(Map<String, Object> searchMap) throws DataAccessException {
		List<E_P001VO> list =  e_P001DAO.selectItem(searchMap);
		System.out.println("service:"+list);
		return list;
	}
	

	

}
