package project.C.P001.controller;

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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.C.P001.service.C_P001Service;
import project.C.P001.vo.C_P001VO;
import project.F.P002.vo.F_P002VO;




@Controller("eventController")
public class C_P001ControllerImpl   implements C_P001Controller {
	
	@Autowired
	private C_P001Service eventService;
	@Autowired
	C_P001VO eventVO ;
	
	
	@Override
	@RequestMapping(value="/event.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listEvent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "event";
		List eventList = eventService.listEvent();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("eventList", eventList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/eventDetail.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView eventDetail(@RequestParam("no_number") String no_number, 
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String viewName = "eventDetail";
		Map<String, Object> dataMap = new HashMap();
		Map<String, Object> resultMap = new HashMap();
		dataMap.put("no_number", no_number);
		List<Map<String,Object>> dataList = eventService.selectBoardDetail(dataMap);
		resultMap = dataList.get(0);
		System.out.println("고객번호111111111111111111111111111111111111"+dataList);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("resultMap", resultMap);
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

