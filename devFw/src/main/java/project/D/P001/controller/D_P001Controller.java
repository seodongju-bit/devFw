package project.D.P001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface D_P001Controller {
    public ModelAndView myReview(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView reviewwrite(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}