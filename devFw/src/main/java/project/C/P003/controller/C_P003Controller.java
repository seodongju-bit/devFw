package project.C.P003.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import project.C.P003.vo.PageVO;

public interface C_P003Controller {
	    
	
public ModelAndView notice(PageVO vo,String nowPage, String cntPerPage,HttpServletRequest request, HttpServletResponse response) throws Exception;
public ModelAndView noticeDetail(@RequestParam("de_number")String de_number, HttpServletRequest request, HttpServletResponse response) throws Exception;
public ModelAndView noticeDetail2(@RequestParam("qu_number")String qu_number, HttpServletRequest request, HttpServletResponse response) throws Exception;


public ModelAndView questions(PageVO vo,String nowPage, String cntPerPage,HttpServletRequest request, HttpServletResponse response) throws Exception;
public ModelAndView questions1(PageVO vo,String nowPage, String cntPerPage,HttpServletRequest request, HttpServletResponse response) throws Exception;

public ModelAndView questionDetail(@RequestParam("de_number")String de_number, HttpServletRequest request, HttpServletResponse response) throws Exception;
public ModelAndView questionDetail1(@RequestParam("qu_number")String qu_number, HttpServletRequest request, HttpServletResponse response) throws Exception;

public ModelAndView questionwrite(HttpServletRequest request, HttpServletResponse response) throws Exception;
public ModelAndView questionwrite2(HttpServletRequest request, HttpServletResponse response) throws Exception;


public ModelAndView questionwrite3(HttpServletRequest request, HttpServletResponse response) throws Exception;
public ModelAndView questionwrite4(HttpServletRequest request, HttpServletResponse response) throws Exception;



public ModelAndView questionwrite5(HttpServletRequest request, HttpServletResponse response) throws Exception;
public ModelAndView questionwrite6(HttpServletRequest request, HttpServletResponse response) throws Exception;



}                      