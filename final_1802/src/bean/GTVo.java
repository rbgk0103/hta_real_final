package bean;

public class GTVo {
	/* GAME_TITLES 테이블 칼럼 */
	int gt_no;		// PK
	String gt_name;	
	String gt_with;

	
	/* Set Get */
	public int getGt_no() {
		return gt_no;
	}
	public void setGt_no(int gt_no) {
		this.gt_no = gt_no;
	}
	public String getGt_name() {
		return gt_name;
	}
	public void setGt_name(String gt_name) {
		this.gt_name = gt_name;
	}
	public String getGt_with() {
		return gt_with;
	}
	public void setGt_with(String gt_with) {
		this.gt_with = gt_with;
	}
}
