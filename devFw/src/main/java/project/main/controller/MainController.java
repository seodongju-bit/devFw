package project.main.controller;

import java.util.ArrayList;
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
import project.search.paging.SearchPageMaker;
import project.search.paging.SearchPagingVO;
import project.main.paging.MainPageMaker;
import project.main.paging.MainPagingVO;
import project.search.vo.SearchVO;

@Controller("mainController")
@EnableAspectJAutoProxy
public class MainController {
	@Autowired
	private F_P002Service F_P002Service;
	@Autowired
	private F_P002VO F_P002VO;

	@RequestMapping(value= "/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
	//현재 페이지 번호와 페이지당 보여줄 게시글 수가 담긴 pagingVO 객체를 사용
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response, MainPagingVO mainPagingVO) throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		MainPageMaker mainPageMaker = new MainPageMaker();
		
		List<Map<String, Object>> banner = new ArrayList<Map<String, Object>>();
		banner = F_P002Service.mainBanner();
		
		//page와 perPageNum 세팅
		mainPageMaker.setMainPagingVO(mainPagingVO);
		//총 게시글의 수를 세팅
		//pageMaker.setTotalCount(F_P002Service.countMainListTotal());
		mainPageMaker.setTotalCount(F_P002Service.countList());
		//PagingVO 파라미터를 이용하여 목록 조회
		List<F_P002VO> mainList = F_P002Service.mainList(mainPagingVO);
		ModelAndView mav=new ModelAndView();
		mav.addObject("mainList", mainList);
		//세팅된 pageMaker에는 페이징을 위한 버튼의 값들이 들어있으며 ModelAndView를 이용하여 jsp에 넘겨줌
		mav.addObject("mainPageMaker", mainPageMaker);
		mav.addObject("banner", banner);
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
			                       HttpServletRequest request, HttpServletResponse response, SearchVO searchVO) throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		List<F_P002VO> searchList = F_P002Service.searchList(searchVO);
		mav.addObject("searchList", searchList);
		
		
		SearchPageMaker searchPageMaker = new SearchPageMaker();
		searchPageMaker.setSearchPagingVO(searchVO);
		searchPageMaker.setTotalCount(F_P002Service.countList());
		mav.addObject("searchPageMaker", searchPageMaker);
		System.out.println("정보:" + mav);
		return mav;
		
	}
}
