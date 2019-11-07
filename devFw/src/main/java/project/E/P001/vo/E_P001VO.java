package project.E.P001.vo;

import org.springframework.stereotype.Component;

@Component("E_P001VO")
public class E_P001VO {
	private String sell_number="";
	private String pro_number="";
	private String pro_name="";
	private String sell_price="";
	private String sell_title="";
	private String sell_thumbnail="";
	private String mem_ID="";
	private String order_size="";
	private String order_color="";
	private String detail_quantity="";
	
	
	public E_P001VO() {
		System.out.println("E_P001VO 호출");
	}


	public String getSell_number() {
		return sell_number;
	}


	public void setSell_number(String sell_number) {
		this.sell_number = sell_number;
	}


	public String getPro_number() {
		return pro_number;
	}


	public void setPro_number(String pro_number) {
		this.pro_number = pro_number;
	}


	public String getPro_name() {
		return pro_name;
	}


	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}


	public String getSell_price() {
		return sell_price;
	}


	public void setSell_price(String sell_price) {
		this.sell_price = sell_price;
	}


	public String getSell_title() {
		return sell_title;
	}


	public void setSell_title(String sell_title) {
		this.sell_title = sell_title;
	}


	public String getSell_thumbnail() {
		return sell_thumbnail;
	}


	public void setSell_thumbnail(String sell_thumbnail) {
		this.sell_thumbnail = sell_thumbnail;
	}


	public String getMem_ID() {
		return mem_ID;
	}


	public void setMem_ID(String mem_ID) {
		this.mem_ID = mem_ID;
	}


	public String getOrder_size() {
		return order_size;
	}


	public void setOrder_size(String order_size) {
		this.order_size = order_size;
	}


	public String getOrder_color() {
		return order_color;
	}


	public void setOrder_color(String order_color) {
		this.order_color = order_color;
	}


	public String getDetail_quantity() {
		return detail_quantity;
	}


	public void setDetail_quantity(String detail_quantity) {
		this.detail_quantity = detail_quantity;
	}


	







	
}
