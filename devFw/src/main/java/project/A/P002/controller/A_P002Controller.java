package project.A.P002.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.A.P002.vo.A_P002VO;



public interface A_P002Controller {
	public ModelAndView signupmain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView signupmain2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView memberdivision(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView signupsuccess(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView mailsendmessage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity  addMember(@ModelAttribute("A_P002VO") A_P002VO A_P002VO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity   overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
//	public ModelAndView emailAuth (HttpServletResponse response, HttpServletRequest request) throws Exception;
	
}

