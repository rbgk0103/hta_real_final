package bean;

public class GTVo {
	/* GAME_TITLES 테이블 칼럼 */
	int gtNo;		// PK
	String gtName;	
	String gtWith;

	
	/* Set Get */
	public int getGtNo() {
		return gtNo;
	}
	public void setGtNo(int gtNo) {
		this.gtNo = gtNo;
	}
	public String getGtName() {
		return gtName;
	}
	public void setGtName(String gtName) {
		this.gtName = gtName;
	}
	public String getGtWith() {
		return gtWith;
	}
	public void setGtWith(String gtWith) {
		this.gtWith = gtWith;
	}
	
}
