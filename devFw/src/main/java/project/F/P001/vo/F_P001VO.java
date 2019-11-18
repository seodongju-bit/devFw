package project.F.P001.vo;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("F_P001VO")
public class F_P001VO {               
	  private String no_number;
	   private String ev_discount;	
	   private String event_explain;
	   
	   private String order_number;
	   private int detail_quantity;
	   

private String sell_number;
   private String pro_number;
   private String sell_price;
   private String pro_price;
   private String sell_score;
   private String sell_title;
   private String sell_thumbnail;
   private String mem_id;
   private String pro_vendor;
private String pro_explain;
   
   private String common_code;
   private String common_name;  
   
   private String review_number;
   private String mem_no;
   private int review_monthpoint;
   private String review_content;
 


	public F_P001VO() {
		System.out.println("F_P001VO 호출");
	}

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
   
	   public String getPro_explain() {
			return pro_explain;
		}
		public void setPro_explain(String pro_explain) {
			this.pro_explain = pro_explain;
		}

	       
		   public String getOrder_number() {
				return order_number;
			}
			public void setOrder_number(String order_number) {
				this.order_number = order_number;
			}
			public int getDetail_quantity() {
				return detail_quantity;
			}
			public void setDetail_quantity(int detail_quantity) {
				this.detail_quantity = detail_quantity;
			}
			   
			   
			  
			public String getReview_number() {
			return review_number;
		}

		public void setReview_number(String review_number) {
			this.review_number = review_number;
		}

		public String getMem_no() {
			return mem_no;
		}

		public void setMem_no(String mem_no) {
			this.mem_no = mem_no;
		}

		public int getReview_monthpoint() {
			return review_monthpoint;
		}

		public void setReview_monthpoint(int review_monthpoint) {
			this.review_monthpoint = review_monthpoint;
		}

		public String getReview_content() {
			return review_content;
		}

		public void setReview_content(String review_content) {
			this.review_content = review_content;
		}
}