package project.A.P004.vo;

import org.springframework.stereotype.Component;

@Component("couponVO")
public class A_P004VO {
	private String co_number;
	private String co_name;
	private String co_enddate;
	private String co_usedate;
	private String co_sale;
	private String co_salepercent;

	public A_P004VO() {

	}

	public A_P004VO(String co_number, String co_name, String co_enddate, String co_usedate, String co_sale,
			String co_salepercent) {
		this.co_number = co_number;
		this.co_name = co_name;
		this.co_enddate = co_enddate;
		this.co_usedate = co_usedate;
		this.co_sale = co_sale;
		this.co_salepercent = co_salepercent;
	}

	public String getCo_number() {
		return co_number;
	}

	public void setCo_number(String co_number) {
		this.co_number = co_number;
	}

	public String getCo_name() {
		return co_name;
	}

	public void setCo_name(String co_name) {
		this.co_name = co_name;
	}

	public String getCo_enddate() {
		return co_enddate;
	}

	public void setCo_enddate(String co_enddate) {
		this.co_enddate = co_enddate;
	}

	public String getCo_usedate() {
		return co_usedate;
	}

	public void setCo_usedate(String co_usedate) {
		this.co_usedate = co_usedate;
	}

	public String getCo_sale() {
		return co_sale;
	}

	public void setCo_sale(String co_sale) {
		this.co_sale = co_sale;
	}

	public String getCo_salepercent() {
		return co_salepercent;
	}

	public void setCo_salepercent(String co_salepercent) {
		this.co_salepercent = co_salepercent;
	}

}
