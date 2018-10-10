package bean;

public class GameSetVo {
	/* oders_set 테이블의 컬럼들 */
	int os_no;		// PK
	int ord_no;		// FK
	int menu_no;	// FK
	int os_qty;
	int os_price;
	String os_evnet;
	
	
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
	public String getOs_evnet() {
		return os_evnet;
	}
	public void setOs_evnet(String os_evnet) {
		this.os_evnet = os_evnet;
	}
	
	
	
}
