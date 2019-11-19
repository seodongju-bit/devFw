package project.A.P005.vo;

import org.springframework.stereotype.Component;

@Component("basketVO")
public class A_P005VO {
	private String ba_no;
	private String mem_id;
	private String sell_number;
	private String ba_size;
	private String ba_color;
	private String ba_quantity;

	public A_P005VO() {
		
	}

	public A_P005VO(String ba_no, String mem_id, String sell_number, String ba_size, String ba_color, String ba_quantity) {
		this.ba_no=ba_no;
		this.mem_id=mem_id;
		this.sell_number=sell_number;
		this.ba_size=ba_size;
		this.ba_color=ba_color;
		this.ba_quantity=ba_quantity;
		
	}

	public String getBa_no() {
		return ba_no;
	}

	public void setBa_no(String ba_no) {
		this.ba_no = ba_no;
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

	public String getBa_size() {
		return ba_size;
	}

	public void setBa_size(String ba_size) {
		this.ba_size = ba_size;
	}

	public String getBa_color() {
		return ba_color;
	}

	public void setBa_color(String ba_color) {
		this.ba_color = ba_color;
	}

	public String getBa_quantity() {
		return ba_quantity;
	}

	public void setBa_quantity(String ba_quantity) {
		this.ba_quantity = ba_quantity;
	}

}