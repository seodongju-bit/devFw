package project.A.P001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("a_p001VO")
public class A_P001VO {
	private String mem_no = "";
	private String mem_id = "";
	private String mem_pw = "";
	private String mem_address = "";
	private String mem_name = "";
	private String mem_tel = "";
	private String mem_point = "";
	private String mem_nick = "";
	private String mem_division = "";
	private String mem_totalRC = "";
	private String mem_mothRC = "";
	private String mem_reviewgrade = "";
	
	public A_P001VO() {
		System.out.println("A_P001VO ȣ��");
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
	public String getMem_address() {
		return mem_address;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_point() {
		return mem_point;
	}
	public void setMem_point(String mem_point) {
		this.mem_point = mem_point;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getMem_division() {
		return mem_division;
	}
	public void setMem_division(String mem_division) {
		this.mem_division = mem_division;
	}
	public String getMem_totalRC() {
		return mem_totalRC;
	}
	public void setMem_totalRC(String mem_totalRC) {
		this.mem_totalRC = mem_totalRC;
	}
	public String getMem_mothRC() {
		return mem_mothRC;
	}
	public void setMem_mothRC(String mem_mothRC) {
		this.mem_mothRC = mem_mothRC;
	}
	public String getEmm_reviewgrade() {
		return mem_reviewgrade;
	}
	public void setEmm_reviewgrade(String emm_reviewgrade) {
		this.mem_reviewgrade = emm_reviewgrade;
	}

	
	

	
}