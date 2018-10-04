package bean;

public class PageCompute {
	
	int listSize = 0;
	int blockSize = 0;
	int nowPage = 0;

	int totSize = 0;
	int totPage  = 0;
	int totBlock = 0;
	int nowBlock = 0;

	int endPage   = 0;
	int startPage = 0;

	int endNo   = 0;
	int startNo = 0;
	

	public void pageCompute() {

		totPage  = (int)Math.ceil(totSize/(double)listSize);
		totBlock = (int)Math.ceil(totPage/(double)blockSize);
		nowBlock = (int)Math.ceil(nowPage/(double)blockSize);

		endPage   = nowBlock * blockSize;
		startPage = endPage - blockSize + 1;
		if(endPage > totPage) endPage = totPage;

		endNo   = nowPage * listSize;
		startNo = endNo - listSize + 1;

		if(endNo > totSize) endNo = totSize;
		
	}
	
//	paging set/get
	
	public int getListSize() {
		return listSize;
	}
	
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	
	public int getBlockSize() {
		return blockSize;
	}
	
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	
	public int getNowPage() {
		return nowPage;
	}
	
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	
	public int getTotSize() {
		return totSize;
	}
	
	public void setTotSize(int totSize) {
		this.totSize = totSize;
	}
	
	public int getTotPage() {
		return totPage;
	}
	
	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}
	
	public int getTotBlock() {
		return totBlock;
	}
	
	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}
	
	public int getNowBlock() {
		return nowBlock;
	}
	
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public int getEndNo() {
		return endNo;
	}
	
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	
	public int getStartNo() {
		return startNo;
	}
	
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

}
