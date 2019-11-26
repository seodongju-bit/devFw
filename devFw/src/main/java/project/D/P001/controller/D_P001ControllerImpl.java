package project.D.P001.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.D.P001.service.D_P001Service;
import project.D.P001.vo.D_P001VO;






@Controller("D_P001Controller")
public class D_P001ControllerImpl   implements D_P001Controller {

	@Autowired
	private D_P001Service d_P001Service;
	@Autowired
	D_P001VO D_P001VO;

	@Override
	@RequestMapping(value="/myReview.do" ,method = RequestMethod.GET)
	public ModelAndView myReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "myReview";
		
		HttpSession session = request.getSession();
		String p_id = (String)session.getAttribute("mem_id");
		if(p_id == null) {
			viewName = "redirect:main.do";
			ModelAndView mavs2 = new ModelAndView(viewName);
			return mavs2;
		}
		
		List reviewlist2 = d_P001Service.reviewItem2(p_id);
		System.out.println(reviewlist2);
		ModelAndView mavs2 = new ModelAndView(viewName);
		mavs2.addObject("List", reviewlist2);
		return mavs2;
	}

	@Override
	@RequestMapping(value="/reviewwrite.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reviewwrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "reviewwrite";
		System.out.println("controller실행");    
		ModelAndView mavs = new ModelAndView(viewName);
		return mavs; 
	}
	
	//리뷰등록
	@Override
	@RequestMapping(value="/reviewEnrollment.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> reviewEnrollment(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		System.out.println(request.getParameter("grade"));
		viewName = "reviewwrite";
		Map<String, Object> resultMap = new HashMap<String, Object>();
		//List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		return resultMap;
	}
	
	
	@Override
	@RequestMapping(value="/writes.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView writes(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "redirect:/reviewwrite.do";
		Map<String, Object> dataMap = new HashMap();
		
		String review_content = request.getParameter("content");
		String mem_no = request.getParameter("writer");

		
		System.out.println(review_content);
		System.out.println(mem_no);

		

		dataMap.put("review_content", review_content);
		dataMap.put("mem_no", mem_no);

		
		System.out.println(dataMap);
		
		 d_P001Service.reviewWrite(dataMap);
		
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
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