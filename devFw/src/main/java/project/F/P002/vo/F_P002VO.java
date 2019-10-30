package project.F.P002.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("F_P002VO")
public class F_P002VO {
	private String sell_number="";
	private String pro_number="";
	private String sell_price="";
	private String sell_score="";
	private String sell_contents="";
	private String sell_total="";
	private String sell_date="";
	private String sell_title="";
	private String sell_thumbnail="";
	private String sell_quantity="";
	private String mem_ID="";
	private String option_yn="";
	private String option_size="";
	private String option_color="";
	private String option_quantity="";
	
	
	
	public F_P002VO() {
		System.out.println("F_P002VO 호출");
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

	public String getSell_score() {
		return sell_score;
	}

	public void setSell_score(String sell_score) {
		this.sell_score = sell_score;
	}

	public String getSell_contents() {
		return sell_contents;
	}

	public void setSell_contents(String sell_contents) {
		this.sell_contents = sell_contents;
	}

	public String getSell_total() {
		return sell_total;
	}

	public void setSell_total(String sell_total) {
		this.sell_total = sell_total;
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

	public String getMem_ID() {
		return mem_ID;
	}

	public void setMem_ID(String mem_ID) {
		this.mem_ID = mem_ID;
	}

	public String getOption_yn() {
		return option_yn;
	}

	public void setOption_yn(String option_yn) {
		this.option_yn = option_yn;
	}



	public String getOption_size() {
		return option_size;
	}

	public void setOption_size(String option_size) {
		this.option_size = option_size;
	}

	public String getOption_color() {
		return option_color;
	}

	public void setOption_color(String option_color) {
		this.option_color = option_color;
	}

	public String getOption_quantity() {
		return option_quantity;
	}

	public void setOption_quantity(String option_quantity) {
		this.option_quantity = option_quantity;
	}

	
	
	
}