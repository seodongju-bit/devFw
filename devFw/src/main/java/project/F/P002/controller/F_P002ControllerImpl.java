package project.F.P002.controller;

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

import project.F.P002.service.F_P002Service;
import project.F.P002.vo.F_P002VO;




@Controller("F_P002Controller")
public class F_P002ControllerImpl   implements F_P002Controller {
	@Autowired
	F_P002Service f_P002Service;
	@Autowired
	F_P002VO f_P002VO;
	
	@Override
	@RequestMapping(value="/sellItems.do" ,method = RequestMethod.GET)
	public ModelAndView searchSell(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		
		////////임시 세션
		HttpSession session = request.getSession();
		session.setAttribute("id", "seodongju");
		////////
		viewName = "sellItems";
		String p_id= request.getParameter("sell_no");
		if(p_id==null || p_id=="") {
			ModelAndView mav = new ModelAndView("redirect:category.do");
			return mav;
		}
		//sell_no 검사: db에 해당 판매글 없으면 잘못된페이지 표시
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("p_id", p_id);
		List list = f_P002Service.selectItem(searchMap);
		if(!list.isEmpty()) {
			f_P002VO = (F_P002VO)list.get(0);
		}else {
			ModelAndView mav = new ModelAndView("redirect:category.do");
			return mav;
		}
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("searchItem", f_P002VO);
		return mav;
	}
	@Override
	@RequestMapping(value = "/searchOption.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<Map<String, Object>> searchOption(@RequestParam(value="p_id", required=false) String p_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("옵션찾기 실행"+ p_id);
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		searchMap.put("p_id", p_id);	 
		
		List list = null;
		try {
			list = f_P002Service.searchOption(searchMap);
			System.out.println("======>"+list);
			for(int i=0; i < list.size();i++) {
				f_P002VO = (F_P002VO)list.get(i);
				resultMap = BeanUtils.describe(f_P002VO);
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

	
	@Override
	@RequestMapping(value = "/addBasket.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView addBasket(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("장바구니추가 실행");
		ModelAndView mav = new ModelAndView("");
		HttpSession session = request.getSession();
		String p_id = (String)session.getAttribute("id");
		List<Map<String, Object>> list = createModel(request);
		
		//Map<String, Object> addMap = new HashMap<String, Object>();
		//Map<String, Object> resultMap = new HashMap<String, Object>();

		
		//addBasket(Map<String, Object> searchMap)
		for(int i=0;i<list.size();i++) {
			list.get(i).put("p_id", p_id);
			System.out.println(list.get(i));
			f_P002Service.addBasket(list.get(i));
		}
		//판매번호, 색상, 사이즈, 수량
		//현재 : 판매번호, 회원번호, 수량, 제품번호

		System.out.println("list:"+list);
		//System.out.println(BeanUtils.describe(e_P001VO));
		
	
		
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	public List<Map<String, Object>> createModel(HttpServletRequest request){
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> resultMap= new HashMap<String, Object>();
		List size = new ArrayList();
		List color = new ArrayList();
		List quantity = new ArrayList();
		int i=1;
		while(true) {
			if(request.getParameter("quantity"+i)==null || request.getParameter("quantity"+i)=="") { break; }
			resultMap = new HashMap<String, Object>();
			resultMap.put("sell_number", request.getParameter("sell_number"));
			resultMap.put("quantity", request.getParameter("quantity"+i));
			resultMap.put("size",request.getParameter("size"+i));
			resultMap.put("color",request.getParameter("color"+i));
			result.add(resultMap);
			i++;
		}
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

