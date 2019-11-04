package project.F.P001.vo;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("F_P001VO")
public class F_P001VO {               


             
   private String sell_number;
   private String pro_number;
   private String sell_price;
   private String pro_price;
   private String sell_score;
   private String sell_title;
   private String sell_thumbnail;
   private String mem_id;
   private String pro_vendor;
   
   
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
    