package project.A.P001.controller;

import java.io.IOException;
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

import project.A.P001.base.A_P001Base;
import project.A.P001.service.A_P001Service;
import project.A.P001.vo.A_P001VO;

@Controller("A_P001Controller")
public class A_P001ControllerImpl implements A_P001Controller {
	
	@Autowired
	A_P001Service a_p001Service;
	@Autowired
	A_P001VO A_P001VO;
	

	
	@Override
	@RequestMapping(value="/signinpage.do" ,method = RequestMethod.GET)
	public ModelAndView signinmain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "signinpage";
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/searchidpage.do" ,method = RequestMethod.GET)
	public ModelAndView searchidpage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "searchidpage";
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/searchpwpage.do" ,method = RequestMethod.GET)
	public ModelAndView searchpwpage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "searchpwpage";
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/unauthorizedmember.do" ,method = RequestMethod.GET)
	public ModelAndView unauthorizedmember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "unauthorizedmember";
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/secessionmember.do" ,method = RequestMethod.GET)
	public ModelAndView secessionmember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "secessionmember";
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}

	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		try {
			String addr = (String)request.getParameter("referrer");
			String[] addr2 = addr.split("devFw");
			addr2 = addr2[1].split("\\?");
			A_P001VO=a_p001Service.login(loginMap);
			if(A_P001VO!= null && A_P001VO.getMem_id()!=null){
				
				if(A_P001VO.getMem_verify().equals("n")) {
					mav.setViewName("redirect:unauthorizedmember.do");
					return mav;
				}else if(A_P001VO.getMem_division().equals("3")) {
					mav.setViewName("redirect:secessionmember.do");
					return mav;
				}
				HttpSession session=request.getSession();
				session=request.getSession();
				session.setAttribute("isLogOn", true);
				session.setAttribute("mem_division", A_P001VO.getMem_division());
				session.setAttribute("mem_id", A_P001VO.getMem_id());
				session.setAttribute("memberInfo",A_P001VO);

				System.out.println(addr2[0]);
				if(addr2[0].equals("/signupsuccesspage.do") || addr2[0].equals("/signinpage.do") || addr2[0].equals("/verify.do")) {
					mav.setViewName("redirect:main.do");
				}else {   
					mav.setViewName("redirect:"+addr2[0]);
					if(addr2.length==2) {
						addr2 = addr2[1].split("\\&");
						for(int i=0; i<addr2.length; i++) {
							String[] addr3 = addr2[i].split("\\=");
							mav.addObject(addr3[0], addr3[1]);
						}
					}
				}
			}else{
				String message="아이디나  비밀번호가 틀립니다. 다시 로그인해주세요";
				mav.addObject("message", message);
				mav.setViewName("redirect:signinpage.do");
			}
		}catch(Exception e) {
			System.out.println("catch");
			mav.setViewName("redirect:main.do");
			return mav;	
		}
		return mav;
	}
	

	
	@ResponseBody
	@RequestMapping(value = "/idsearch.do", method = RequestMethod.POST)
	public ResponseEntity idsearch(@RequestParam Map<String, String> idMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		System.out.println(idMap);	
		String result = a_p001Service.idsearch(idMap);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	
	}

	
	
	@Override
	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String addr = (String)request.getParameter("referrer");
		String[] addr2 = addr.split("devFw");
		addr2 = addr2[1].split("\\?");
		
		HttpSession session=request.getSession();
		session.invalidate();		
		mav.setViewName("redirect:"+addr2[0]);
		if(addr2.length==2) {
			addr2 = addr2[1].split("\\=");
			mav.addObject(addr2[0], addr2[1]);
		}
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