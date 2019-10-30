package project.F.P002.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.F.P002.dao.F_P002DAO;
import project.F.P002.vo.F_P002VO;


@Service("F_P002Service")
@Transactional(propagation = Propagation.REQUIRED)
public class F_P002ServiceImpl implements F_P002Service {
	@Autowired
	private F_P002DAO f_P002DAO;

	@Override
	public List<F_P002VO> selectItem(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002VO> list =  f_P002DAO.selectItem(searchMap);
		return list;
	}
	
	@Override
	public List<F_P002VO> searchOption(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002VO> list =  f_P002DAO.searchOption(searchMap);
		return list;
	}


}
