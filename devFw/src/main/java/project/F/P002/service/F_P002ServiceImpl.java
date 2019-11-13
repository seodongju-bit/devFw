package project.F.P002.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

//import com.bookshop01.goods.vo.ImageFileVO;

import project.F.P002.dao.F_P002DAO;
import project.F.P002.vo.F_P002VO;
import project.main.paging.PagingVO;


@Service("F_P002Service")
@Transactional(propagation = Propagation.REQUIRED)
public class F_P002ServiceImpl implements F_P002Service {
	@Autowired
	private F_P002DAO f_P002DAO;
	
	@Override
	public List<F_P002VO> selectItem(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002VO> list =  f_P002DAO.selectItem(searchMap);
		return list;
	}
	
	@Override
	public List<F_P002VO> searchOption(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P002VO> list =  f_P002DAO.searchOption(searchMap);
		return list;
	}
	

	@Override
	public void addBasket(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("add서비스실행");
		f_P002DAO.addBasket(searchMap);
	}
	
	@Override
	public List<PagingVO> mainList(PagingVO pagingVO) throws Exception {
		return f_P002DAO.mainList(pagingVO);
	}
	
	@Override
	public int countMainList() throws Exception {
		return f_P002DAO.countMainList();
	}
	
	/*public Map F_P002Detail(String sell_number) throws Exception {
		Map F_P002Map=new HashMap();
		F_P002VO F_P002VO = F_P002DAO.selectF_P002Detail(sell_number);
		F_P002Map.put("F_P002VO", F_P002VO);
		List<ImageFileVO> imageList =goodsDAO.selectGoodsDetailImage(sell_number);
		goodsMap.put("imageList", imageList);
		return goodsMap;
	}*/
	
	public List<String> predictive(String keyword) throws Exception {
		List<String> list=f_P002DAO.predictive(keyword);
		return list;
	}
	
	public List<F_P002VO> searchProd(String searchWord) throws Exception{
		List searchList=f_P002DAO.searchProd(searchWord);
		return searchList;
	}


}
