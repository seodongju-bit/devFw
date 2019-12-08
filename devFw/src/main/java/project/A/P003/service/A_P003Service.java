package project.A.P003.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.A.P002.vo.A_P002VO;
import project.A.P003.vo.A_P003VO;

public interface A_P003Service {
	public A_P003VO  modifyMyInfo(Map memberMap) throws Exception;
	public A_P003VO myDetailInfo(String mem_id) throws Exception;
	public void Secessionmember(A_P003VO A_P003VO) throws Exception;
}