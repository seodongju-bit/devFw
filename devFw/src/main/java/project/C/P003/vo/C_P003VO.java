package project.C.P003.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("C_P003VO")
public class C_P003VO {
	private String de_number;
	private String mem_id;
	private String de_division;
    private Date de_date;
	private String de_contents;
	
	private String qu_number;
	private String qu_contents;
	private String qu_answer;

	
	
	
	public C_P003VO() {
		System.out.println("C_P003VO 호출");
	}
	public String getDe_number() {             
		return de_number;
	}
	public void setDe_number(String de_number) {
		this.de_number = de_number;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getDe_division() {
		return de_division;
	}
	public void setDe_division(String de_division) {
		this.de_division = de_division;
	}
	public Date getDe_date() {            
		return de_date;
	}
	public void setDe_date(Date de_date) {
		this.de_date = de_date;
	}
	public String getDe_contents() {
		return de_contents;
	}
	public void setDe_contents(String de_contents) {
		this.de_contents = de_contents;
	}
	public String getQu_number() {
		return qu_number;
	}
	public void setQu_number(String qu_number) {
		this.qu_number = qu_number;
	}
	public String getQu_contents() {
		return qu_contents;
	}
	public void setQu_contents(String qu_contents) {
		this.qu_contents = qu_contents;
	}
	public String getQu_answer() {
		return qu_answer;
	}
	public void setQu_answer(String qu_answer) {
		this.qu_answer = qu_answer;
	}

	
	

}
