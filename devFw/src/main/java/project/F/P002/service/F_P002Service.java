package project.F.P002.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.F.P002.vo.F_P002VO;


public interface F_P002Service {
	 public List<F_P002VO> selectItem(Map<String, Object> searchMap) throws DataAccessException;
	List<F_P002VO> searchOption(Map<String, Object> searchMap) throws DataAccessException;
	public List<F_P002VO> mainList() throws Exception;
	
	public List<String> predictive(String keyword) throws Exception;
	public List<F_P002VO> searchProd(String searchWord) throws Exception;

}