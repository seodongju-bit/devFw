package project.E.P001.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.E.P001.vo.E_P001VO;
import project.A.P001.vo.A_P001VO;
import project.A.P002.vo.A_P002VO;
import project.E.P001.service.E_P001Service;



@Controller("E_P001Controller")
public class E_P001ControllerImpl implements E_P001Controller {
	@Autowired
	E_P001VO e_P001VO;
	
	@Autowired
	E_P001Service e_P001Service;
	
	@RequestMapping(value = "/order.do", method = { RequestMethod.POST })
	public ModelAndView order(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session = request.getSession();
		Boolean isLogOn = (Boolean)session.getAttribute("isLogOn");
		String action=(String)session.getAttribute("action");
		
		if(isLogOn==null || isLogOn == false) {
			return new ModelAndView("redirect:../devFw/signinpage.do");
		}else {
			String viewName = (String)request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			List<Map<String, Object>> list = createModel(request);
			Map<String, Object> searchMap = new HashMap<String, Object>();
			List<E_P001VO> result = new ArrayList<E_P001VO>();
			
				for(int i=0;i<list.size();i++) {
					searchMap.put("p_id", list.get(i).get("sell_number"));
					e_P001VO = (E_P001VO)e_P001Service.selectItem(searchMap).get(0);
					
					//List<E_P001VO>
					e_P001VO.setSell_number((String)list.get(i).get("sell_number"));
					e_P001VO.setDetail_quantity((String)list.get(i).get("detail_quantity")); 
					e_P001VO.setOrder_size((String)list.get(i).get("order_size")); 
					e_P001VO.setOrder_color((String)list.get(i).get("order_color"));
					System.out.println(BeanUtils.describe(e_P001VO));
					result.add(e_P001VO);
				}
			session.setAttribute("orderList", result);
			A_P001VO memberInfo=(A_P001VO)session.getAttribute("memberInfo");
			session.setAttribute("orderer", memberInfo);
			return mav;
			
		}
	}
	
	@RequestMapping(value="/order2.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView buy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session = request.getSession();
		Boolean isLogOn = (Boolean)session.getAttribute("isLogOn");
		String action=(String)session.getAttribute("action");
		if(isLogOn==null || isLogOn == false) {
			return new ModelAndView("redirect:../devFw/signinpage.do");
		}else {
			ModelAndView mav = new ModelAndView("order");
			List<Map<String, Object>> list = createModel2(request);
			Map<String, Object> searchMap = new HashMap<String, Object>();
			List<E_P001VO> result = new ArrayList<E_P001VO>();
			
				for(int i=0 ; i<list.size() ; i++) {
					System.out.println(i);
					searchMap = new HashMap<String, Object>();
					searchMap.put("p_id", list.get(i).get("sell_number"));
					System.out.println(55);
					e_P001VO = (E_P001VO)e_P001Service.selectItem(searchMap).get(0);
					System.out.println(i);
					//List<E_P001VO>
					e_P001VO.setSell_number((String)list.get(i).get("sell_number")); 
					e_P001VO.setDetail_quantity((String)list.get(i).get("detail_quantity")); 
					e_P001VO.setOrder_size((String)list.get(i).get("order_size")); 
					e_P001VO.setOrder_color((String)list.get(i).get("order_color"));
					System.out.println("--->"+BeanUtils.describe(e_P001VO));
					result.add(e_P001VO);
				}
			session.setAttribute("orderList", result);
			A_P001VO memberInfo=(A_P001VO)session.getAttribute("memberInfo");
			session.setAttribute("orderer", memberInfo);
			return mav;
			
		}
	}
	
	@RequestMapping(value="/payToOrder.do", method = RequestMethod.POST)
	public ModelAndView payToOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		A_P001VO a_P001VO = (A_P001VO)session.getAttribute("orderer");
		String mem_id = a_P001VO.getMem_id();
		int mem_point = a_P001VO.getMem_point();
		System.out.println("mem_id:" +mem_id);
		
		
		
		String sell_number = request.getParameter("h_sell_number");
		System.out.println("sell_number:"+sell_number);
		
		String sell_title = request.getParameter("h_sell_title");
		System.out.println("sell_title:" + sell_title);
		
		String order_size = request.getParameter("h_order_size");
		System.out.println("order_size:" + order_size);
		
		String order_color = request.getParameter("h_order_color");
		System.out.println("order_color:" + order_color);
		
		String detail_quantity = request.getParameter("h_detail_quantity");
		System.out.println("detail_quantity:" + detail_quantity);
		
		String pro_price = request.getParameter("h_pro_price");
		System.out.println("pro_price:" + pro_price);
		
		String sell_price = request.getParameter("h_sell_price");
		System.out.println("sell_price:" + sell_price);
		
		String seller_id= request.getParameter("h_seller_id");
		System.out.println("seller_id:" + seller_id);
		
		String order_total_price = request.getParameter("h_order_total_price");
		System.out.println("order_total_price:" + order_total_price);
		
		String order_total_sale_price = request.getParameter("h_order_total_sale_price");
		System.out.println("order_total_sale_price" + order_total_sale_price);
		
		String final_order_total_pro_price = request.getParameter("h_final_order_total_pro_price");
		System.out.println("final_order_total_pro_price:" + final_order_total_pro_price);
		
		String final_order_total_price = request.getParameter("h_final_order_total_price");
		System.out.println("final_order_total_price:" + final_order_total_price);
		
		
		String delivery_payment = request.getParameter("delivery_method");
		System.out.println("delivery_payment:" + delivery_payment);
		
		String delivery_method = request.getParameter("delivery_method");
		System.out.println("delivery_method:" + delivery_method);
		
		String mem_name = request.getParameter("mem_name");
		System.out.println("mem_name:" + mem_name);
		
		String mem_tel = request.getParameter("mem_tel");
		System.out.println("mem_tel:" + mem_tel);
		
		String mem_email1 = request.getParameter("mem_email1");
		System.out.println("mem_email1:" + mem_email1);
		
		String mem_email2 = request.getParameter("mem_email2");
		System.out.println("mem_email2:" + mem_email2);
		
		String order_zip = request.getParameter("order_zip");
		System.out.println("order_zip:" + order_zip);
		
		String order_address1 = request.getParameter("order_address1");
		System.out.println("order_address1:" + order_address1);
		
		String order_address2 = request.getParameter("order_address2");
		System.out.println("order_address2:" + order_address2);
		
		String _order_pointuse = request.getParameter("order_pointuse");
		System.out.println("order_pointuse:" + _order_pointuse);
		int order_pointuse = Integer.parseInt(_order_pointuse);
		
		String order_request = request.getParameter("order_request");
		System.out.println("order_request:" + order_request);
		
		String pay_method = request.getParameter("pay_method");
		System.out.println("pay_method:" + pay_method);
		
		String deli_number = request.getParameter("deli_number");
		String deli_name = request.getParameter("deli_name");
		String od_state = request.getParameter("od_state");
		
		String point_save = request.getParameter("h_point_save");
		System.out.println("point_save:" + point_save);
		
		String point_save_total = request.getParameter("h_point_save_total");
		System.out.println(point_save_total);
		
		List<E_P001VO> orderList = (List<E_P001VO>)session.getAttribute("orderList");
		
		for(int i = 0; i <orderList.size(); i++) {
			E_P001VO e_P001VO = (E_P001VO)orderList.get(i);
			
			e_P001VO.setMem_id(mem_id);
			e_P001VO.setSell_number(sell_number);
			e_P001VO.setSell_title(sell_title);
			e_P001VO.setOrder_size(order_size);
			e_P001VO.setOrder_color(order_color);
			e_P001VO.setDetail_quantity(detail_quantity);
			e_P001VO.setPro_price(pro_price);
			e_P001VO.setSell_price(sell_price);
			e_P001VO.setSeller_id(seller_id);
			e_P001VO.setOrder_total_price(order_total_price);
			e_P001VO.setOrder_total_sale_price(order_total_sale_price);
			e_P001VO.setFinal_order_total_pro_price(final_order_total_pro_price);
			e_P001VO.setFinal_order_total_price(final_order_total_price);
			e_P001VO.setDelivery_payment(delivery_payment);
			e_P001VO.setDelivery_method(delivery_method);
			e_P001VO.setMem_name(mem_name);
			e_P001VO.setMem_tel(mem_tel);
			e_P001VO.setMem_email1(mem_email1);
			e_P001VO.setMem_email2(mem_email2);
			e_P001VO.setOrder_zip(order_zip);
			e_P001VO.setOrder_address1(order_address1);
			e_P001VO.setOrder_address2(order_address2);
			e_P001VO.setOrder_pointuse(order_pointuse);
			e_P001VO.setOrder_request(order_request);
			e_P001VO.setPay_method(pay_method);
			
			if(od_state != null || deli_name != null) {
			e_P001VO.setOd_state(od_state);
			e_P001VO.setDeli_name(deli_name);
			}
			
			e_P001VO.setPoint_save(point_save);
			e_P001VO.setPoint_save_total(point_save_total);
			
			orderList.set(i, e_P001VO);
		}
		e_P001Service.addNewOrder(orderList);
		mav.addObject("orderList", orderList);
		return mav;
		}
	
	
	
	
	public List<Map<String, Object>> createModel(HttpServletRequest request){
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> resultMap= new HashMap<String, Object>();
		List size = new ArrayList();
		List color = new ArrayList();
		List quantity = new ArrayList();
		int i=1;
		while(true) {
			if(request.getParameter("quantity"+i)==null || request.getParameter("quantity"+i)=="") { break; }
			resultMap = new HashMap<String, Object>();
			resultMap.put("sell_number", request.getParameter("sell_number"));
			resultMap.put("detail_quantity", request.getParameter("quantity"+i));
			resultMap.put("order_size",request.getParameter("size"+i));
			resultMap.put("order_color",request.getParameter("color"+i));
			resultMap.put("order_color",request.getParameter("od_recomReview"));
			result.add(resultMap);
			i++;
		}
		return result;
	}
	

	public List<Map<String, Object>> createModel2(HttpServletRequest request){
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> resultMap= new HashMap<String, Object>();
		String test = request.getParameter("test");
		String[] colorOp = test.split(",");
		String test1 = request.getParameter("test1");
		String[] sizeOp = test1.split(",");
		String test2 = request.getParameter("test2");
		String[] quantityOp = test2.split(",");
		String test3 = request.getParameter("test3");
		String[] sellnumber = test3.split(",");
		
		for(int i=0; i<quantityOp.length;i++) {
			resultMap = new HashMap<String, Object>();
			resultMap.put("sell_number", sellnumber[i]);
			resultMap.put("detail_quantity", quantityOp[i] );
			resultMap.put("order_size", sizeOp[i]);
			resultMap.put("order_color", colorOp[i]);
			result.add(resultMap);
		}
		return result;
	}
	
	
	
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

