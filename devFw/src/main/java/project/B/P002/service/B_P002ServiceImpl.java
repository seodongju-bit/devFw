package project.B.P002.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartRequest;

import project.B.P002.dao.B_P002DAO;
import project.B.P002.vo.B_P002VO;


@Service("B_P002Service")
@Transactional(propagation = Propagation.REQUIRED)
public class B_P002ServiceImpl implements B_P002Service {
	@Autowired
	private B_P002DAO b_P002DAO;

	@Override
	public void addSell(B_P002VO b_P002VO) {
		b_P002DAO.addSell(b_P002VO);
		
	}
	
	@Override
	public List<B_P002VO> selectItem(Map<String, Object> searchMap) {
		return b_P002DAO.selectItem(searchMap);
	}
	
	@Override
	public void saveImg(HttpServletRequest request) throws DataAccessException {
		System.out.println("서비스 실행");
		//ServletContext context = getServletContext();
		//String saveDir = context.getRealPath("Upload");
		int maxSize  = 3*1024*1024;
		String encoding = "UTF-8";;
		
		//MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, "utf-8" , new MyFileRenamePolicy());
		
	}
	

	

}
