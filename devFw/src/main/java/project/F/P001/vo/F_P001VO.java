package project.F.P001.vo;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("F_P001VO")
public class F_P001VO {               
	  private String no_number;
	   private String ev_discount;
	   public String getNo_number() {
		return no_number;
	}
	public void setNo_number(String no_number) {
		this.no_number = no_number;
	}
	public String getEv_discount() {
		return ev_discount;
	}
	public void setEv_discount(String ev_discount) {
		this.ev_discount = ev_discount;
	}
	public String getEvent_explain() {
		return event_explain;
	}
	public void setEvent_explain(String event_explain) {
		this.event_explain = event_explain;
	}
	private String event_explain;
       
   private String sell_number;
   private String pro_number;
   private String sell_price;
   private String pro_price;
   private String sell_score;
   private String sell_title;
   private String sell_thumbnail;
   private String mem_id;
   private String pro_vendor;
   
   private String common_code;
   private String common_name;  
   
   public String getCommon_code() {
	return common_code;
}
public void setCommon_code(String common_code) {
	this.common_code = common_code;
}
public String getCommon_name() {
	return common_name;
}
public void setCommon_name(String common_name) {
	this.common_name = common_name;
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
   public String getPro_price() {
      return pro_price;
   }
   public void setPro_price(String pro_price) {
      this.pro_price = pro_price;
   }
   public String getSell_score() {
      return sell_score;
   }
   public void setSell_score(String sell_score) {
      this.sell_score = sell_score;
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
   public String getMem_id() {
      return mem_id;
   }
   public void setMem_id(String mem_id) {
      this.mem_id = mem_id;
   }
   public String getPro_vendor() {
      return pro_vendor;
   }
   public void setPro_vendor(String pro_vendor) {
      this.pro_vendor = pro_vendor;
   }
   
   
   
   
}