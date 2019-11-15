package project.B.P001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("B_P001VO")
public class B_P001VO {
	
	private String sell_number="";
	private String sell_price="";
	private String sell_title="";
	
	private String pro_number="";
	private String mem_id="";
	private String pro_division="";
	private String pro_name="";
	private String pro_price="";
	private String pro_vendor="";
	private String pro_brand ="";
	private String pro_explain="";

	private Date release_date;
	
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



	public String getPro_explain() {
		return pro_explain;
	}

	public void setPro_explain(String pro_explain) {
		this.pro_explain = pro_explain;
	}

	public String getPro_brand() {
		return pro_brand;
	}

	public void setPro_brand(String pro_brand) {
		this.pro_brand = pro_brand;
	}

	public Date getRelease_date() {
		return release_date;
	}

	public void setRelease_date(Date release_date) {
		this.release_date = release_date;
	}

	public String getPro_vendor() {
		return pro_vendor;
	}

	public void setPro_vendor(String pro_vendor) {
		this.pro_vendor = pro_vendor;
	}
	
	
	
	
}
