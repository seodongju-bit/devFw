package project.B.P002.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.B.P002.service.B_P002Service;
import project.B.P002.vo.B_P002VO;
 


@Controller("B_P002Controller")
public class B_P002ControllerImpl   implements B_P002Controller {
		
	@Autowired
	B_P002Service b_P002Service;
//	@Autowired
//	B_P002VO b_P002VO;
	

	   @Override
	   @RequestMapping(value = "/itemManager/addSell.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public ModelAndView addSell(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		   String viewName = getViewName(request);
			viewName = "addSell";
			ModelAndView mav = new ModelAndView(viewName);
			return mav;
	   }
	   
	   @Override
	   @RequestMapping(value = "/itemManager/inputSell.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public ModelAndView inputSell(@ModelAttribute("B_P002VO") B_P002VO b_P002VO,HttpServletRequest request, HttpServletResponse response) throws Exception  {
		   String viewName = getViewName(request);
			viewName = "addSell";
			HttpSession session = request.getSession();
			String mem_id = (String)session.getAttribute("mem_id");
			b_P002VO.setMem_id(mem_id);
			
			//System.out.println(request.getParameter("fileName1"));
			System.out.println(b_P002VO.getSell_contents());
			b_P002Service.addSell(b_P002VO);
			//b_P002Service.saveImg(request);
			
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("error_yn" , "n");
			return mav;
	   }

	   @Override
	   @RequestMapping(value = "/itemManager/proNumSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public ModelAndView proNumSearch(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		   String viewName = getViewName(request);
			viewName = "proNumSearch";
			ModelAndView mav = new ModelAndView(viewName);
			return mav;
	   }
	
	   
	   @Override
	   @RequestMapping(value = "/itemManager/proNumSearchAction.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public Map<String, Object> proNumSearchAction(HttpServletRequest request, HttpServletResponse response) throws Exception  {
	      request.setCharacterEncoding("utf-8");
	      String p_id = (String)request.getParameter("p_id");
	      
	      Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
	      Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과

	      if(p_id=="" || p_id==null) {
	    	  return resultMap;
	      }
	      searchMap.put("p_id", p_id);
	      List<B_P002VO> data = b_P002Service.selectItem(searchMap);
	      resultMap.put("Data", data);
	      
	      return resultMap;
	   }
	   
	   
		// 다중파일업로드

//	    @RequestMapping(value = "/file_uploader_html5.do", method = RequestMethod.POST)
//	    @ResponseBody
//	    public String multiplePhotoUpload(HttpServletRequest request) {
//	        // 파일정보
//	        StringBuffer sb = new StringBuffer();
//	        try {
//	            // 파일명을 받는다 - 일반 원본파일명
//	            String oldName = request.getHeader("file-name");
//	            // 파일 기본경로 _ 상세경로
//	            //String filePath = "C:/MyProject/workspace/devFw/src/main/webapp/resources/photoUpload/";
//	            String filePath = "C:/Users/bit/git/devFw/devFw/src/main/webapp/resources/image/items";
//
//	            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
//	                          .format(System.currentTimeMillis()))
//	                          .append(UUID.randomUUID().toString())
//	                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
//	            InputStream is = request.getInputStream();
//	            OutputStream os = new FileOutputStream(filePath + saveName);
//	            int numRead;
//	            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
//	            while ((numRead = is.read(b, 0, b.length)) != -1) {
//	                os.write(b, 0, numRead);
//	            }
//	            os.flush();
//	            os.close();
//	            // 정보 출력
//	            sb = new StringBuffer();
//	            sb.append("&bNewLine=true")
//	              .append("&sFileName=").append(oldName)
//	              .append("&sFileURL=").append("http://192.168.0.64:8090/devFw/resources/image/items/")
//	        .append(saveName);
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	        return sb.toString();
//	    }
	   

	
	
	
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

