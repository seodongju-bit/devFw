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


import project.C.P003.service.C_P003Service;
import project.C.P003.vo.C_P003VO;
import project.C.P003.vo.PageVO;


@Controller("C_P003Controller")
public class C_P003ControllerImpl implements C_P003Controller {
	@Autowired
	private C_P003Service C_P003Service;
	@Autowired
	C_P003VO C_P003VO;
	
	
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
	
		
		List noticelist2 = C_P003Service.searchnotice2(); 
		System.out.println(noticelist2);
		
		ModelAndView mavw = new ModelAndView(viewName);
		mavw.addObject("List",noticelist);
		mavw.addObject("List2",noticelist2);

		return mavw;
		
		
		
	}
	
	

	
	

	@Override
	@RequestMapping(value="/noticeDetail.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView noticeDetail(@RequestParam("de_number") String de_number, 
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String viewName = "noticeDetail";
		Map<String, Object> dataMap = new HashMap();
		Map<String, Object> resultMap = new HashMap();
		dataMap.put("de_number", de_number);
		List<Map<String,Object>> noticeList3 = C_P003Service.noticeDetail(dataMap);
		resultMap = noticeList3.get(0);
		System.out.println("controller실행"+noticeList3);
		ModelAndView mavw2 = new ModelAndView(viewName);
		mavw2.addObject("resultMap", resultMap);                  
		return mavw2;
	}
            
	
	
	@Override
	@RequestMapping(value="/noticeDetail2.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView noticeDetail2(@RequestParam("qu_number") String qu_number, 
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String viewName = "noticeDetail2";
		Map<String, Object> dataMap2 = new HashMap();
		Map<String, Object> resultMap2 = new HashMap();
		dataMap2.put("qu_number", qu_number);
		List<Map<String,Object>> noticeList4 = C_P003Service.noticeDetail2(dataMap2);
		resultMap2 = noticeList4.get(0);
		System.out.println("controller실행"+noticeList4);
		ModelAndView mavw3 = new ModelAndView(viewName);
		mavw3.addObject("resultMap2", resultMap2);                  
		return mavw3;             
	}
	
	

	@Override
	@RequestMapping(value="/questions.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questions(PageVO vo1 
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "questions";
		int totals = C_P003Service.countBoard();
		System.out.println("컨트롤러"+totals);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}

		
			vo1 = new PageVO(totals, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
		
		List questionList = C_P003Service.listquestion(vo1);
		ModelAndView mavw4 = new ModelAndView(viewName);
		mavw4.addObject("page", vo1);    
		mavw4.addObject("questionList", questionList);
		return mavw4;
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
