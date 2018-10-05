package bean;

import java.sql.Date;

public class AuctionVo {
	
	int  aeNo;
	int  menuNo;
	Date aeDate; 
	int  aePrice;
	int  aePctMax;
	int  aeCost;
	int  aePctMin;
	int  aeWinTable;
	
	public int getAeNo() {
		return aeNo;
	}
	public void setAeNo(int aeNo) {
		this.aeNo = aeNo;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public Date getAeDate() {
		return aeDate;
	}
	public void setAeDate(Date aeDate) {
		this.aeDate = aeDate;
	}
	public int getAePrice() {
		return aePrice;
	}
	public void setAePrice(int aePrice) {
		this.aePrice = aePrice;
	}
	public int getAePctMax() {
		return aePctMax;
	}
	public void setAePctMax(int aePctMax) {
		this.aePctMax = aePctMax;
	}
	public int getAeCost() {
		return aeCost;
	}
	public void setAeCost(int aeCost) {
		this.aeCost = aeCost;
	}
	public int getAePctMin() {
		return aePctMin;
	}
	public void setAePctMin(int aePctMin) {
		this.aePctMin = aePctMin;
	}
	public int getAeWinTable() {
		return aeWinTable;
	}
	public void setAeWinTable(int aeWinTable) {
		this.aeWinTable = aeWinTable;
	}
	
	
}
