package project.B.P001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("B_P001VO")
public class B_P001VO {
	private String mem_id="";
	private String sell_number="";
	private String pro_number="";
	private String sell_price="";
	private String sell_title="";

	
	public B_P001VO() {
		System.out.println("B_P001VO 호출");
	}
	
	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
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
	
	
	
}
