package project.A.P005.conrtoller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



public interface A_P005Controller {
	public ModelAndView listBasket(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}