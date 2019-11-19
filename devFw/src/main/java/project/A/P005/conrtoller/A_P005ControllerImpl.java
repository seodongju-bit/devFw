package project.A.P005.conrtoller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.A.P005.service.A_P005Service;
import project.A.P005.vo.A_P005VO;
import project.hm.p0004.vo.P0004VO;





@Controller("basketController")
@EnableAspectJAutoProxy
public class A_P005ControllerImpl   implements A_P005Controller {
//	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	@Autowired
	private A_P005Service basketService;
	@Autowired
	A_P005VO basketVO ;
	
	@Override
	@RequestMapping(value="/basket.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listBasket(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "basket";
		List basketList = basketService.listBasket();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("basketList", basketList);
		return mav;
	}

//	@Override
//	@RequestMapping(value="/basket/removeBasket.do" ,method = { RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView removeBasket(@RequestParam("mem_no") String mem_no,
//			           HttpServletRequest request, HttpServletResponse response) throws Exception{
//		request.setCharacterEncoding("utf-8");
//		basketService.removeBasket(mem_no);
//		System.out.println("고객번호"+mem_no);
//		
//		ModelAndView mav = new ModelAndView("redirect:/basket.do");
//		return mav;
//	}
	
	@Override
	@RequestMapping(value="/basket/removeBasket.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> removeBasket(@RequestParam("ba_no") String ba_no, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		System.out.println("고객번호="+ba_no);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		dataMap.put("ba_no", ba_no);
		System.out.println("=======================>>"+dataMap.toString());
		
		try {
			basketService.removeBasket(dataMap);
			resultMap.put("error_yn", "N");	
		} catch (Exception e) {
			resultMap.put("error_yn", "Y");
			resultMap.put("error_text", "�����߻�");
			e.printStackTrace();
		}		
		return resultMap;
	}
		
//	@Override
//	@RequestMapping(value="/basket/updateBasket.do" ,method = { RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView updateBasket( @RequestParam("mem_no") String mem_no, @RequestParam("ba_quantity") String ba_quantity,
//			           HttpServletRequest request, HttpServletResponse response) throws Exception{
//		request.setCharacterEncoding("utf-8");
//		System.out.println("고객번호="+mem_no);
//		System.out.println("상품개수="+ba_quantity);
//		Map dataMap = new HashMap();
//		dataMap.put("mem_no", mem_no);
//		dataMap.put("ba_quantity", ba_quantity);
//		System.out.println(dataMap);
//		System.out.println("333333333333333333333333333" + ba_quantity);
//		basketService.updateBasket(dataMap);
//		ModelAndView mav = new ModelAndView("redirect:/basket.do");
//		return mav;
//	}	
		
	
	@Override
	@RequestMapping(value="/basket/updateBasket.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> updateBasket(@RequestParam("ba_no") String ba_no, @RequestParam("ba_quantity") String ba_quantity, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		System.out.println("고객번호="+ba_no);
		System.out.println("상품개수="+ba_quantity);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		dataMap.put("ba_no", ba_no);
		dataMap.put("ba_quantity", ba_quantity);
	
		System.out.println("=======================>>"+dataMap.toString());
		
		try {
			basketService.updateBasket(dataMap);
			resultMap.put("error_yn", "N");	
		} catch (Exception e) {
			resultMap.put("error_yn", "Y");
			resultMap.put("error_text", "�����߻�");
			e.printStackTrace();
		}		
		return resultMap;
	}
		
		
	
	
	/*@RequestMapping(value = "/basket/*Form.do", method =  { RequestMethod.GET, RequestMethod.POST})
	private ModelAndView form(@RequestParam(value= "result", required=false) String result,
						       HttpServletRequest request, 
						       HttpServletResponse response) throws Exception {
		//String viewName = getViewName(request);
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName(viewName);
		return mav;
	}*/
	

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
