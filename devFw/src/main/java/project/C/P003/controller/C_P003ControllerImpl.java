package project.C.P003.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.C.P001.vo.PagingVO;
import project.C.P003.service.C_P003Service;
import project.C.P003.vo.C_P003VO;
import project.C.P003.vo.PageVO;


@Controller("C_P003Controller")
public class C_P003ControllerImpl implements C_P003Controller {
	@Autowired
	private C_P003Service C_P003Service;
	@Autowired
	C_P003VO C_P003VO;
	 @Value("${uploadFilePath}")
	   private String uploadFilePath;
	   @Value("${downloadFilePath}")
	   private String downloadFilePath;
	
	@Override
	@RequestMapping(value="/notice.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView notice(PageVO vo, 
			@RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage, 
			
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "notice";
		
		int total=C_P003Service.countBoard();
		System.out.println(total);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}

		
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		List noticelist = C_P003Service.searchnotice();
		System.out.println(noticelist);
		ModelAndView mavw = new ModelAndView(viewName);
		mavw.addObject("List",noticelist);
		return mavw;
	}
	
	

	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {                     
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/",1), viewName.length());
		}
		return viewName;
	}







	
}
