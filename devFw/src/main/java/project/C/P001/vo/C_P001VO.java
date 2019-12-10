package project.C.P001.vo;

import org.springframework.stereotype.Component;

@Component("eventVO")
public class C_P001VO {
	private String no_number;
	private String mem_id;
	private String no_contents;
	private String no_division;
	private String no_title;
	private String imagefilename;
	private String writedate;
	private String view_cnt;

	public C_P001VO() {
		
	}

	public C_P001VO(String no_number, String mem_id, String no_contents, String no_division, String no_title, String imagefilename, String writedate, String view_cnt) {
		this.no_number=no_number;
		this.mem_id=mem_id;
		this.no_contents=no_contents;
		this.no_division=no_division;
		this.no_title=no_title;
		this.imagefilename=imagefilename;
		this.writedate=writedate;
		this.view_cnt=view_cnt;
	}
	
	public String getNo_number() {
		return no_number;
	}

	public void setNo_number(String no_number) {
		this.no_number = no_number;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getNo_contents() {
		return no_contents;
	}

	public void setNo_contents(String no_contents) {
		this.no_contents = no_contents;
	}

	public String getNo_division() {
		return no_division;
	}

	public void setNo_division(String no_division) {
		this.no_division = no_division;
	}

	public String getNo_title() {
		return no_title;
	}

	public void setNo_title(String no_title) {
		this.no_title = no_title;
	}

	public String getImagefilename() {
		return imagefilename;
	}

	public void setImagefilename(String imagefilename) {
		this.imagefilename = imagefilename;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public String getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(String view_cnt) {
		this.view_cnt = view_cnt;
	}

	

}