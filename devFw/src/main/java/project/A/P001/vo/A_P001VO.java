package project.A.P001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("A_P001VO")
public class A_P001VO {
	private String mem_no = "";
	private String mem_id = "";
	private String mem_pw = "";
	private String mem_name = "";
	private String mem_email1 = "";
	private String mem_email2 = "";
	private String mem_division = "";
	
	
	public A_P001VO() {
		System.out.println("A_P001VO 호출");
	
	
}



	public String getMem_no() {
		return mem_no;
	}



	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}



	public String getMem_id() {
		return mem_id;
	}



	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}



	public String getMem_pw() {
		return mem_pw;
	}



	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}



	public String getMem_name() {
		return mem_name;
	}



	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}



	public String getMem_email1() {
		return mem_email1;
	}



	public void setMem_email1(String mem_email1) {
		this.mem_email1 = mem_email1;
	}



	public String getMem_email2() {
		return mem_email2;
	}



	public void setMem_email2(String mem_email2) {
		this.mem_email2 = mem_email2;
	}



	public String getMem_division() {
		return mem_division;
	}



	public void setMem_division(String mem_division) {
		this.mem_division = mem_division;
	}

	
	
}