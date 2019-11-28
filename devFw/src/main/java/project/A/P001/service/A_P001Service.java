package project.A.P001.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.A.P001.vo.A_P001VO;


public interface A_P001Service {
	public A_P001VO login(Map  loginMap) throws Exception;
	public String idsearch(Map idMap) throws Exception;
}