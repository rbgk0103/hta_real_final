package bean;

import java.sql.Date;

public class AuctionVo {
	
	int  ae_no;
	int  menu_no;
	Date ae_date; 
	int  ae_price;
	int  ae_pct_max;
	int  ae_cost;
	int  ae_pct_min;
	int  ae_win_table;
	
	public int getAe_no() {
		return ae_no;
	}
	public void setAe_no(int ae_no) {
		this.ae_no = ae_no;
	}
	public int getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}
	public Date getAe_date() {
		return ae_date;
	}
	public void setAe_date(Date ae_date) {
		this.ae_date = ae_date;
	}
	public int getAe_price() {
		return ae_price;
	}
	public void setAe_price(int ae_price) {
		this.ae_price = ae_price;
	}
	public int getAe_pct_max() {
		return ae_pct_max;
	}
	public void setAe_pct_max(int ae_pct_max) {
		this.ae_pct_max = ae_pct_max;
	}
	public int getAe_cost() {
		return ae_cost;
	}
	public void setAe_cost(int ae_cost) {
		this.ae_cost = ae_cost;
	}
	public int getAe_pct_min() {
		return ae_pct_min;
	}
	public void setAe_pct_min(int ae_pct_min) {
		this.ae_pct_min = ae_pct_min;
	}
	public int getAe_win_table() {
		return ae_win_table;
	}
	public void setAe_win_table(int ae_win_table) {
		this.ae_win_table = ae_win_table;
	}
	
	
	
}
