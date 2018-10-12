package bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class OrdersVo {
	/* orders 테이블 컬럼 */
	int ord_no;		// PK
	int guest_no;	// FK
	int ord_table_no;
	String ord_date;
	
	ArrayList<ArrayList<String>> stuff;
	
	
	
	
	public ArrayList<ArrayList<String>> getStuff() {
		return stuff;
	}
	public void setStuff(ArrayList<ArrayList<String>> stuff) {
		this.stuff = stuff;
	}
	Map<String, String> ordersSet = new HashMap<String, String>();
	
	
	public int getOrd_no() {
		return ord_no;
	}
	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
	}
	public int getGuest_no() {
		return guest_no;
	}
	public void setGuest_no(int guest_no) {
		this.guest_no = guest_no;
	}
	public int getOrd_table_no() {
		return ord_table_no;
	}
	public void setOrd_table_no(int ord_table_no) {
		this.ord_table_no = ord_table_no;
	}
	public String getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(String ord_date) {
		this.ord_date = ord_date;
	}
	public Map<String, String> getOrdersSet() {
		return ordersSet;
	}
	public void setOrdersSet(Map<String, String> ordersSet) {
		this.ordersSet = ordersSet;
	}
//	public List<OrdersSetVo> getOs() {
//		return os;
//	}
//	public void setOs(List<OrdersSetVo> os) {
//		this.os = os;
//	}
//	
	
}
