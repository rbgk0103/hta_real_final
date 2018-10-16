package bean;

import java.util.ArrayList;

public class OrdersSetVo {
	/* oders_set 테이블의 컬럼들 */
	int os_no;		// PK
	int ord_no;		// FK
	int menu_no;	// FK
	int os_qty;
	int os_price;
	String os_event;
	
	/* menu테이블과 join해서 가져오는 컬럼 */
	String menu_name;
	
	/* orders테이블과 join해서 가져오는 컬럼 */
	int ord_tbl_no;
	
	ArrayList<ArrayList<String>> stuff;
	
	
	public ArrayList<ArrayList<String>> getStuff() {
		return stuff;
	}
	public void setStuff(ArrayList<ArrayList<String>> stuff) {
		this.stuff = stuff;
	}
	
	public int getOs_no() {
		return os_no;
	}
	public void setOs_no(int os_no) {
		this.os_no = os_no;
	}
	public int getOrd_no() {
		return ord_no;
	}
	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
	}
	public int getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}
	public int getOs_qty() {
		return os_qty;
	}
	public void setOs_qty(int os_qty) {
		this.os_qty = os_qty;
	}
	public int getOs_price() {
		return os_price;
	}
	public void setOs_price(int os_price) {
		this.os_price = os_price;
	}
	public String getOs_event() {
		return os_event;
	}
	public void setOs_event(String os_event) {
		this.os_event = os_event;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getOrd_tbl_no() {
		return ord_tbl_no;
	}
	public void setOrd_tbl_no(int ord_tbl_no) {
		this.ord_tbl_no = ord_tbl_no;
	}
	
	
}
