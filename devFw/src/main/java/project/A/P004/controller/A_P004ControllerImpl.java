package project.A.P004.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.A.P004.service.A_P004Service;
import project.A.P004.vo.A_P004VO;



@Controller("A_P004Controller")
public class A_P004ControllerImpl   implements A_P004Controller {
	@Autowired
	private A_P004Service activeService;
	@Autowired
	A_P004VO activeVO ;
	
	@Override
	@RequestMapping(value="/myPage.do" ,method = RequestMethod.GET)
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "myPage";
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/coupon.do" ,method = RequestMethod.GET)
	public ModelAndView coupon(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "coupon";
		HttpSession session = request.getSession();
		String p_id = (String)session.getAttribute("mem_id");
		if(p_id == null) {
			viewName = "redirect:main.do";
			ModelAndView mav = new ModelAndView(viewName);
			return mav;
		}
		List couponsList = activeService.listCoupon(p_id);
		System.out.println(couponsList);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("couponsList", couponsList);
		return mav;
	}
	

	@Override
	@RequestMapping(value="/point.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView point(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "point";
//		HttpSession session = request.getSession();
//		String mem_id = (String)session.getAttribute("mem_id");
//		System.out.println("session="+mem_id);
//		List pointList = activeService.listPoint(mem_id);
//		System.out.println(pointList);
		ModelAndView mav = new ModelAndView(viewName);
//		mav.addObject("pointList", pointList);
		return mav;
		
	}
	
	@Override
	@RequestMapping(value="/pointSearch.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> pointSearch(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		String division = request.getParameter("division");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		System.out.println(start);
		System.out.println(end);
		if("point_date".equals(division)) {
			searchMap.put("date", division);
		}else {
			searchMap.put("date", division);
		}
		// 검색조건설정
		System.out.println("####333333333333333333333333333333333333"+searchMap);
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		System.out.println("session="+mem_id);
		searchMap.put("mem_id", mem_id);
		searchMap.put("start", start);
		searchMap.put("end", end);
		//데이터 조회
		List<A_P004VO> data = activeService.listPoint(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
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

