package project.main;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONObject;
import project.F.P002.service.F_P002Service;
import project.F.P002.vo.F_P002VO;

@Controller("mainController")
@EnableAspectJAutoProxy
public class MainController {
	@Autowired
	private F_P002Service F_P002Service;
	@Autowired
	private F_P002VO F_P002VO;

	@RequestMapping(value= "/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		List mainList = F_P002Service.mainList();
		ModelAndView mav=new ModelAndView();
		mav.addObject("mainList", mainList);
		return mav;
	}
																			//브라우저로 전송하는 JSON 데이터의 한글 인코딩을 지정
	@RequestMapping(value="/predictive.do",method = RequestMethod.GET,produces = "application/text; charset=utf8")
			//@ResponseBody: JSON 데이터를 브라우저로 출력
			//@RequestParam: 검색할 키워드를 가져옴
	public @ResponseBody String  predictive(@RequestParam("keyword") String keyword,
			                                  HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		//System.out.println(keyword);
		if(keyword == null || keyword.equals(""))
		   return null ;
	
		keyword = keyword.toUpperCase();
		//가져온 키워드가 포함된 상품 제목을 조회
	    List<String> keywordList =F_P002Service.predictive(keyword);
	    
		JSONObject jsonObject = new JSONObject();
		//조회한 데이터를 JSON에 저장
		jsonObject.put("keyword", keywordList);
		//JSON을 문자열로 변환한 후 브라우저로 출력
	    String jsonInfo = jsonObject.toString();
	    System.out.println(jsonInfo);
	    return jsonInfo ;
	}
	
	@RequestMapping(value="/searchProd.do" ,method = RequestMethod.GET)
	public ModelAndView searchProd(@RequestParam("searchWord") String searchWord,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		//검색창에서 가져온 단어가 포함된 상품 제목을 조회
		List<F_P002VO> searchList=F_P002Service.searchProd(searchWord);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("searchList", searchList);
		System.out.println(mav);
		return mav;
		
	}
}
