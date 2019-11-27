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

import project.C.P001.vo.PagingVO;
import project.C.P003.vo.PageVO;

public interface C_P003Controller {
	
	
public ModelAndView notice(PageVO vo,String nowPage, String cntPerPage,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
           