package project.B.P002.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("B_P002VO")
public class B_P002VO {
	private String sell_number ="";
	private String pro_number ="";
	private String sell_price ="";
	private String sell_contents ="";
	private String sell_date ="";
	private String sell_title ="";
	private String sell_thumbnail ="";
	private String sell_quantity ="";
	private String mem_id ="";
	private String option_yn ="";
	
	private String pro_vendor ="";
	private String pro_name ="";
	private String pro_brand ="";
	
	
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
	public String getSell_contents() {
		return sell_contents;
	}
	public void setSell_contents(String sell_contents) {
		this.sell_contents = sell_contents;
	}
	public String getSell_date() {
		return sell_date;
	}
	public void setSell_date(String sell_date) {
		this.sell_date = sell_date;
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
	public String getSell_quantity() {
		return sell_quantity;
	}
	public void setSell_quantity(String sell_quantity) {
		this.sell_quantity = sell_quantity;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getOption_yn() {
		return option_yn;
	}
	public void setOption_yn(String option_yn) {
		this.option_yn = option_yn;
	}
	public String getPro_vendor() {
		return pro_vendor;
	}
	public void setPro_vendor(String pro_vendor) {
		this.pro_vendor = pro_vendor;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_brand() {
		return pro_brand;
	}
	public void setPro_brand(String pro_brand) {
		this.pro_brand = pro_brand;
	}
	
	
	
	
	
}
