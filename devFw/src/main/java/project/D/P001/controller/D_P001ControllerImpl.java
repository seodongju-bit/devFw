package project.D.P001.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	@RequestMapping(value="/reviewwrite.do" ,method = RequestMethod.GET)
	public ModelAndView reviewwrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "reviewwrite";
		List reviewlist = d_P001Service.reviewItem();     
		ModelAndView mavs = new ModelAndView(viewName);
        mavs.addObject("List", reviewlist);
		return mavs; 
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

	@Override
	@RequestMapping(value="/myReview.do" ,method = RequestMethod.GET)
	public ModelAndView myReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "myReview";
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}



}

