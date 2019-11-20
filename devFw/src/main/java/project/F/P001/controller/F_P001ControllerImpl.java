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
import project.F.P001.vo.PagingVO;
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
	

	
//	@Override
//	@RequestMapping(value="/memberReview.do" ,method = RequestMethod.GET)
//	public ModelAndView memberReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		String viewName3 = getViewName(request);
//		viewName3 = "memberReview";
//
//		ModelAndView mav3 = new ModelAndView(viewName3);
//	
//		return mav3;
//	}
	

	@Override
	@RequestMapping(value="/memberReview.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView memberReview(PagingVO vo
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "memberReview";
		
		int total = f_P001Service.countBoard();
		System.out.println("controller실행"+total);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
		
		List reviewList = f_P001Service.listEvent(vo);
		ModelAndView mav7 = new ModelAndView(viewName);
		mav7.addObject("paging", vo);    
		mav7.addObject("reviewList", reviewList);
		return mav7;
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
	
	@Override
	@RequestMapping(value = "/searchoption.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<Map<String, Object>> searchoption(@RequestParam(value="p_id", required=false) String p_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("옵션찾기 실행"+ p_id);
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		searchMap.put("p_id", p_id);	 
		
		List productlist = null;
		try {
			productlist = f_P001Service.searchoption(searchMap);
			System.out.println("======>"+productlist);
			for(int i=0; i < productlist.size();i++) {
				F_P001VO = (F_P001VO)productlist.get(i);
				resultMap = BeanUtils.describe(F_P001VO);
				result.add(resultMap);
			}
		}catch(Exception e) {
			resultMap.put("error_yn", "Y");
			resultMap.put("error_text", "error_text");
			e.printStackTrace();
		}
		
		System.out.println("=======================>>"+result);
		
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