package project.C.P001.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface C_P001Controller {
	public ModelAndView listEvent(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView eventDetail(@RequestParam("no_number") String no_number, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
