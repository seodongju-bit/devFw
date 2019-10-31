package project.A.P005.vo;

import org.springframework.stereotype.Component;

@Component("basketVO")
public class A_P005VO {
	private String mem_no;
	private String sell_number;
	private String pro_nubmer;
	private String ba_quantity;

	public A_P005VO() {
		
	}

	public A_P005VO(String mem_no, String sell_number, String pro_nubmer, String ba_quantity) {
		this.mem_no=mem_no;
		this.sell_number=sell_number;
		this.pro_nubmer=pro_nubmer;
		this.ba_quantity=ba_quantity;
		
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

	public String getSell_number() {
		return sell_number;
	}

	public void setSell_number(String sell_number) {
		this.sell_number = sell_number;
	}

	public String getPro_nubmer() {
		return pro_nubmer;
	}

	public void setPro_nubmer(String pro_nubmer) {
		this.pro_nubmer = pro_nubmer;
	}

	public String getBa_quantity() {
		return ba_quantity;
	}

	public void setBa_quantity(String ba_quantity) {
		this.ba_quantity = ba_quantity;
	}

}