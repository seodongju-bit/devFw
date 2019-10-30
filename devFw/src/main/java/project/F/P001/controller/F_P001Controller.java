package project.F.P001.controller;

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

public interface F_P001Controller {
	
	ModelAndView reviewRanking(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView memberReview(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView eventProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView bestProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView category(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
