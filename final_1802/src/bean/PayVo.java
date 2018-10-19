package bean;

public class PayVo {
	int pay_no;
	String pay_date;
	int pay_tot_price;
	int guest_no;
	int pc_no;
	String pc_type;
	int table_no;
	
	public int getTable_no() {
		return table_no;
	}
	public void setTable_no(int table_no) {
		this.table_no = table_no;
	}
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public int getPay_tot_price() {
		return pay_tot_price;
	}
	public void setPay_tot_price(int pay_tot_price) {
		this.pay_tot_price = pay_tot_price;
	}
	public int getGuest_no() {
		return guest_no;
	}
	public void setGuest_no(int guest_no) {
		this.guest_no = guest_no;
	}
	public int getPc_no() {
		return pc_no;
	}
	public void setPc_no(int pc_no) {
		this.pc_no = pc_no;
	}
	public String getPc_type() {
		return pc_type;
	}
	public void setPc_type(String pc_type) {
		this.pc_type = pc_type;
	}

	
}
