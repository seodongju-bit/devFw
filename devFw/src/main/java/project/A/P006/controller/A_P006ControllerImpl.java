package project.A.P006.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.A.P001.vo.A_P001VO;
import project.A.P006.service.A_P006Service;
import project.A.P006.vo.A_P006VO;



@Controller("A_P006Controller")
public class A_P006ControllerImpl implements A_P006Controller{

		private static final Logger logger = LoggerFactory.getLogger(A_P006ControllerImpl.class);
		@Autowired
		A_P006Service p006_Service;
		@Autowired
		A_P006VO p006_VO;
		
		
		@Override
		@RequestMapping(value ="/chatInit.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView chatInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = "chatInit";
			HttpSession session = request.getSession();
	
			A_P001VO memberInfo = (A_P001VO) session.getAttribute("memberInfo");
			String mem_id = memberInfo.getMem_id();
			System.out.println("memberId ::::::::::::::: " + mem_id);
/*			List<C_P001_D001VO> initList = new ArrayList<C_P001_D001VO>();
			initList = c_p002_d005_Service.selectMemberList(mem_id);	*/
			
			List initList = p006_Service.selectMemberList(mem_id);
			
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("memberList", initList);
			return mav;
		
		}
		
		@Override
		@RequestMapping(value ="/sellerChat.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView sellerChat(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = "sellerChat";
			HttpSession session = request.getSession();
			String seller = request.getParameter("seller");
			A_P001VO memberInfo = (A_P001VO) session.getAttribute("memberInfo");
			String mem_id = memberInfo.getMem_id();
			System.out.println("memberId :: " + mem_id);
/*			List<C_P001_D001VO> initList = new ArrayList<C_P001_D001VO>();
			initList = c_p002_d005_Service.selectMemberList(mem_id);	*/
			
			List initList = p006_Service.selectMemberList(mem_id);
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("memberList", initList);
			mav.addObject("seller", seller);
			
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
				viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
			}
			return viewName;
		}
}
