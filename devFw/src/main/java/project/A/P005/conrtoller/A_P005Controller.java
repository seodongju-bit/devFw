package project.A.P005.conrtoller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



public interface A_P005Controller {
	public ModelAndView listBasket(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map<String, Object> removeBasket(@RequestParam("ba_no") String ba_no, HttpServletRequest request, HttpServletResponse response) throws Exception;
//	public ModelAndView updateBasket(@RequestParam("mem_no") String mem_no, @RequestParam("ba_quantity") String ba_quantity, HttpServletRequest request, HttpServletResponse response) throws Exception;	
	public Map<String, Object> updateBasket(@RequestParam("ba_no") String ba_no, @RequestParam("ba_quantity") String ba_quantity, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}