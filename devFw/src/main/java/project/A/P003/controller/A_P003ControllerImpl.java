package project.A.P003.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;


import project.A.P003.service.A_P003Service;
import project.A.P001.vo.A_P001VO;
import project.A.P002.service.A_P002Service;


@Controller("A_P003Controller")
public class A_P003ControllerImpl implements A_P003Controller {

	
	@Autowired
	A_P003Service a_p003Serivce;
	
	@Autowired
	A_P001VO A_P001VO;
	
	
	@Override
	@RequestMapping(value="/memberupdatepage.do" ,method = RequestMethod.GET)
	public ModelAndView memberupdatepage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "memberupdatepage";
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/membersecessionpage.do" ,method = RequestMethod.GET)
	public ModelAndView membersecessionpage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "membersecessionpage";
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/Secessionsuccesspage.do" ,method = RequestMethod.GET)
	public ModelAndView Secessionsuccesspage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "Secessionsuccesspage";
		HttpSession session=request.getSession();
		session.invalidate();		
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/memberpwcheckpage.do" ,method = RequestMethod.GET)
	public ModelAndView memberpwcheckpage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "memberpwcheckpage";
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/modifyMyInfo.do" ,method = RequestMethod.POST)
	public ResponseEntity modifyMyInfo(@RequestParam("attribute")  String attribute,
			                 @RequestParam("value")  String value,
			               HttpServletRequest request, HttpServletResponse response)  throws Exception {
		Map<String,String> memberMap=new HashMap<String,String>();
		String val[]=null;
		HttpSession session=request.getSession();
		A_P001VO=(A_P001VO)session.getAttribute("memberInfo");
		String mem_id=A_P001VO.getMem_id();
		if(attribute.equals("mem_email")){
			val=value.split(",");
			memberMap.put("mem_email1",val[0]);
			memberMap.put("mem_email2",val[1]);
		}else if(attribute.equals("mem_address")){
			val=value.split(",");
			memberMap.put("mem_zip",val[0]);
			memberMap.put("mem_address1",val[1]);
			memberMap.put("mem_address2", val[2]);
		}else {
			memberMap.put(attribute,value);	
		}
		
		memberMap.put("mem_id", mem_id);
		
		//수정된 회원 정보를 다시 세션에 저장한다.
		A_P001VO=(A_P001VO)a_p003Serivce.modifyMyInfo(memberMap);
		session.removeAttribute("memberInfo");
		session.setAttribute("memberInfo", A_P001VO);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}	
	
	
	@RequestMapping(value = "/Secessionmember.do", method = RequestMethod.POST)
	public String Secessionmember(@ModelAttribute A_P001VO A_P001VO,HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();	
		String message = null;
		boolean result = a_p003Serivce.pwCheck(A_P001VO.getMem_id(),A_P001VO.getMem_pw());
		System.out.println(A_P001VO);
		if(result) {
			a_p003Serivce.Secessionmember(A_P001VO);
			session.invalidate();
		return "Secessionsuccesspage";
		}else {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " </script>";
			return "membersecessionpage";
		}
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