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
	
	@Autowired
	private F_P001Service f_P001Service;
	@Autowired
	F_P001VO F_P001VO;
	
	@Override
	@RequestMapping(value="/reviewRanking.do" ,method = RequestMethod.GET)
	public ModelAndView reviewRanking(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "reviewRanking";
		List productlist5 = f_P001Service.searchItem5();
		System.out.println(productlist5);
		ModelAndView mav5 = new ModelAndView(viewName);
		mav5.addObject("List", productlist5);
		return mav5;
	}
	

	
	@Override
	@RequestMapping(value="/memberReview.do" ,method = RequestMethod.GET)
	public ModelAndView memberReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName3 = getViewName(request);
		viewName3 = "memberReview";

		ModelAndView mav3 = new ModelAndView(viewName3);
	
		return mav3;
	}
	

	
	
	@Override
	@RequestMapping(value="/bestProduct.do" ,method = RequestMethod.GET)
	public ModelAndView bestProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName2 = getViewName(request);
		viewName2 = "bestProduct";
		List productlist2 = f_P001Service.searchItem2(); 
		System.out.println(productlist2);
		ModelAndView mav2 = new ModelAndView(viewName2);
		mav2.addObject("List",productlist2);
		return mav2;
	}
	

	
	@Override
	@RequestMapping(value="/eventProduct.do" ,method = RequestMethod.GET)
	public ModelAndView eventProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName1 = getViewName(request);
		viewName1 = "eventProduct";
		List productlist1 = f_P001Service.searchItem1();
		System.out.println(productlist1);
		ModelAndView mav1 = new ModelAndView(viewName1);
		mav1.addObject("List",productlist1);
		return mav1;
	}

	      
	@Override
	@RequestMapping(value="/category.do" ,method = RequestMethod.GET)
	public ModelAndView category(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "category";
		List productlist = f_P001Service.searchItem();
		System.out.println(productlist);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("List", productlist);
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