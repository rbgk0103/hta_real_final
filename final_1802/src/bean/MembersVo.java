package bean;

public class MembersVo {
	
	private int mbrNo;
	private String mbrId;
	private String mbrName;
	private String mbrPhone;
	private String mbrPwd;
	private String mbrGender;
	private String mbrRegDate;
	private String mbrBirth;
	private int mbrPoint;
	private int scNo;
	private String scFrom;
	
	public int getMbrNo() {
		return mbrNo;
	}
	public void setMbrNo(int mbrNo) {
		this.mbrNo = mbrNo;
	}
	public String getMbrId() {
		return mbrId;
	}
	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}
	public String getMbrName() {
		return mbrName;
	}
	public void setMbrName(String mbrName) {
		this.mbrName = mbrName;
	}
	public String getMbrPhone() {
		return mbrPhone;
	}
	public void setMbrPhone(String mbrPhone) {
		this.mbrPhone = mbrPhone;
	}
	public String getMbrPwd() {
		return mbrPwd;
	}
	public void setMbrPwd(String mbrPwd) {
		this.mbrPwd = mbrPwd;
	}
	public String getMbrGender() {
		return mbrGender;
	}
	public void setMbrGender(String mbrGender) {
		this.mbrGender = mbrGender;
	}
	public String getMbrRegDate() {
		return mbrRegDate;
	}
	public void setMbrRegDate(String mbrRegDate) {
		this.mbrRegDate = mbrRegDate.substring(0, 11);
	}
	public String getMbrBirth() {
		return mbrBirth;
	}
	public void setMbrBirth(String mbrBirth) {
		this.mbrBirth = mbrBirth;
	}
	public int getMbrPoint() {
		return mbrPoint;
	}
	public void setMbrPoint(int mbrPoint) {
		this.mbrPoint = mbrPoint;
	}
	public int getScNo() {
		return scNo;
	}
	public void setScNo(int scNo) {
		this.scNo = scNo;
	}
	public String getScFrom() {
		return scFrom;
	}
	public void setScFrom(String scFrom) {
		this.scFrom = scFrom;
	}
	
}
