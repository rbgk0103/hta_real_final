package bean;

public class TblVo {
	int tbl_no;
	int tbl_status;
	String tbl_ip;

	String guest_gender;
	int guest_cnt;
	int guest_no;
	int guest_status;
	int mbr_no;
	
	public int getMbr_no() {
		return mbr_no;
	}

	public void setMbr_no(int mbr_no) {
		this.mbr_no = mbr_no;
	}

	public int getGuest_no() {
		return guest_no;
	}

	public void setGuest_no(int guest_no) {
		this.guest_no = guest_no;
	}

	public String getGuest_gender() {
		return guest_gender;
	}

	public void setGuest_gender(String guest_gender) {
		this.guest_gender = guest_gender;
	}

	public int getGuest_cnt() {
		return guest_cnt;
	}

	public void setGuest_cnt(int guest_cnt) {
		this.guest_cnt = guest_cnt;
	}

	public String getTbl_ip() {
		return tbl_ip;
	}

	public void setTbl_ip(String tbl_ip) {
		this.tbl_ip = tbl_ip;
	}

	public int getTbl_no() {
		return tbl_no;
	}

	public void setTbl_no(int tbl_no) {
		this.tbl_no = tbl_no;
	}

	public int getTbl_status() {
		return tbl_status;
	}

	public void setTbl_status(int tbl_status) {
		this.tbl_status = tbl_status;
	}

	public int getGuest_status() {
		return guest_status;
	}

	public void setGuest_status(int guest_status) {
		this.guest_status = guest_status;
	}

}