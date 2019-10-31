package project.F.P001.vo;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("F_P001VO")
public class F_P001VO {

	private int pro_number;
	private int mem_no;
	private String pro_onedivision;
	private String pro_twodivision;
	private String pro_name;
	private int pro_price;
	private int pro_quantity;
	
	public F_P001VO() {
		
	}
	public F_P001VO(int pro_number, int mem_no, String pro_onedivision, String pro_name, int pro_price, int pro_quantity) {
		this.pro_number = pro_number;
		this.mem_no = mem_no;
		this.pro_onedivision = pro_onedivision;
		this.pro_twodivision = pro_twodivision;
		this.pro_name=pro_name;
		this.pro_price=pro_price;
		this.pro_quantity=pro_quantity;
		
	}
	public int getPro_number() {
		return pro_number;
	}
	public void setPro_number(int pro_number) {
		this.pro_number = pro_number;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getPro_onedivision() {
		return pro_onedivision;
	}
	public void setPro_onedivision(String pro_onedivision) {
		this.pro_onedivision = pro_onedivision;
	}
	public String getPro_twodivision() {
		return pro_twodivision;
	}
	public void setPro_twodivision(String pro_twodivision) {
		this.pro_twodivision = pro_twodivision;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public int getPro_quantity() {
		return pro_quantity;
	}
	public void setPro_quantity(int pro_quantity) {
		this.pro_quantity = pro_quantity;
	}
	
	
	
	
	
}
    