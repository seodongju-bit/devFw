package project.B.P001.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.B.P001.service.B_P001Service;
import project.B.P001.vo.B_P001VO;

 


@Controller("B_P001Controller")
public class B_P001ControllerImpl   implements B_P001Controller {

	@Override
	@RequestMapping(value="/itemManager.do" ,method = RequestMethod.GET)
	public ModelAndView itemManager(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		if(!sellerCheck(request)) {
			ModelAndView mav = new ModelAndView(viewName);
			mav.setViewName("redirect:main.do");
			return mav;
		}
		viewName = "itemManager";
		//JSONObject obj = new JSONObject();
		//obj.put("name", "123");
		//obj.put("age", "234");
	
		//JSONArray ja = new JSONArray();
		//ja.add(obj);

		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	
	private SqlSession sqlSession;
	
	@Autowired
	B_P001VO b_P001VO;
	
	@Autowired
	B_P001Service b_P001Service;
	
	   @Override
	   @RequestMapping(value = "/itemManager/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception  {
	      request.setCharacterEncoding("utf-8");
	      
	      HttpSession session = request.getSession();
	      session=request.getSession();
	      String seller_id = (String)session.getAttribute("mem_id");
	      
	      Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
	      Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
	      
	      searchMap.put("seller_id", seller_id);
	      List<B_P001VO> data =b_P001Service.selectItem(searchMap);
	      resultMap.put("Data", data);
	        
	      return resultMap;
	   }

	   @Override
	   @RequestMapping(value = "/itemManager/addProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public ModelAndView addProduct(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		   String viewName = getViewName(request);
			viewName = "addProduct";
			ModelAndView mav = new ModelAndView(viewName);
			return mav;
	   }
	   
	   
	   
	   
	public boolean sellerCheck(HttpServletRequest request) {
		boolean result = false;
		HttpSession session = request.getSession();
		session=request.getSession();
		Boolean isLogOn = (Boolean)session.getAttribute("isLogOn");
		String mem_division = (String)session.getAttribute("mem_division");
		try {
			if(isLogOn && mem_division.equals("1")) {
				result = true;
			}
		}catch(Exception e) {}
		return result;
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

