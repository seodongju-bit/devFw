package project.A.P002.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.A.P002.vo.A_P002VO;
import project.A.P002.service.A_P002Service;


@Controller("A_P002Controller")
public class A_P002ControllerImpl   implements A_P002Controller {
		

	
	
	@Override
	@RequestMapping(value="/signuppage.do" ,method = RequestMethod.GET)
	public ModelAndView signupmain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "signuppage";
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/memberdivisionpage.do" ,method = RequestMethod.GET)
	public ModelAndView memberdivision(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "memberdivisionpage";
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/signupsuccesspage.do" ,method = RequestMethod.GET)
	public ModelAndView signupsuccess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "signupsuccesspage";
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Autowired
	A_P002Service a_p002Service;
	@Autowired
	A_P002VO A_P002VO;
	
	
	@Override
	@RequestMapping(value="/addMember.do" ,method = RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("A_P002VO") A_P002VO _A_P002VO,HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		System.out.println("asdfasf"+_A_P002VO.getMem_id());
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			a_p002Service.addMember(_A_P002VO);
		    message  = "<script>";
		    message += " location.href='"+request.getContextPath()+"/signupsuccesspage.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/signuppage.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	

	
	@Override
	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		System.out.println(id);
		String result = a_p002Service.overlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
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