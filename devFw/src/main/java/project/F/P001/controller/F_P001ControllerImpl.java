package project.F.P001.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.F.P001.vo.F_P001VO;
import project.F.P001.service.F_P001Service;




@Controller("F_P001Controller")
public class F_P001ControllerImpl implements F_P001Controller {
	
	@Override
	@RequestMapping(value="/reviewRanking.do" ,method = RequestMethod.GET)
	public ModelAndView reviewRanking(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "reviewRanking";
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/memberReview.do" ,method = RequestMethod.GET)
	public ModelAndView memberReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "memberReview";
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	

	
	@Override
	@RequestMapping(value="/bestProduct.do" ,method = RequestMethod.GET)
	public ModelAndView bestProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "bestProduct";
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	

	
	@Autowired
	private F_P001Service f_P001Service;
	@Autowired
	F_P001VO F_P001VO;
	
	
	@Override
	@RequestMapping(value="/eventProduct.do" ,method = RequestMethod.GET)
	public ModelAndView eventProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName1 = getViewName(request);
		viewName1 = "eventProduct";
		List list1 = f_P001Service.searchItem1();
		System.out.println(list1);
		ModelAndView mav1 = new ModelAndView(viewName1);
		mav1.addObject("List",list1);
		return mav1;
	}

	      
	@Override
	@RequestMapping(value="/category.do" ,method = RequestMethod.GET)
	public ModelAndView category(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "category";
		List list = f_P001Service.searchItem();
		System.out.println(list);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("List", list);
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

