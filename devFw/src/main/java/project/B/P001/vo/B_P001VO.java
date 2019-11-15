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
	
	private String pro_name="";
	private String pro_division="";
	private String pro_price="";
	private String pro_vender="";
	private String pro_explain="";
	
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

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getPro_division() {
		return pro_division;
	}

	public void setPro_division(String pro_division) {
		this.pro_division = pro_division;
	}

	public String getPro_price() {
		return pro_price;
	}

	public void setPro_price(String pro_price) {
		this.pro_price = pro_price;
	}

	public String getPro_vender() {
		return pro_vender;
	}

	public void setPro_vender(String pro_vender) {
		this.pro_vender = pro_vender;
	}

	public String getPro_explain() {
		return pro_explain;
	}

	public void setPro_explain(String pro_explain) {
		this.pro_explain = pro_explain;
	}
	
	
	
}
