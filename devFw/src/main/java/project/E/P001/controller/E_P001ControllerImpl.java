package project.E.P001.controller;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.E.P001.vo.E_P001VO;
import project.E.P001.service.E_P001Service;



@Controller("E_P001Controller")
public class E_P001ControllerImpl   implements E_P001Controller {
	@Autowired
	E_P001VO e_P001VO;
	@Autowired
	E_P001Service e_P001Service;
	
	@Override
	@RequestMapping(value = "/order.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView order(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "order";
		List<Map<String, Object>> list = createModel(request);
		Map<String, Object> searchMap = new HashMap<String, Object>();
		List<E_P001VO> result = new ArrayList<E_P001VO>();
		for(int i=0;i<list.size();i++) {
			searchMap.put("p_id", list.get(i).get("sell_number"));
			e_P001VO = (E_P001VO)e_P001Service.selectItem(searchMap).get(0);
			
			//List<E_P001VO>
			e_P001VO.setSell_number((String)list.get(i).get("sell_number")); 
			e_P001VO.setDetail_quantity((String)list.get(i).get("detail_quantity")); 
			e_P001VO.setOrder_size((String)list.get(i).get("order_size")); 
			e_P001VO.setOrder_color((String)list.get(i).get("order_color"));
			System.out.println(BeanUtils.describe(e_P001VO));
			result.add(e_P001VO);
		}
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("orderList", result);
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
			resultMap.put("detail_quantity", request.getParameter("quantity"+i));
			resultMap.put("order_size",request.getParameter("size"+i));
			resultMap.put("order_color",request.getParameter("color"+i));
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

