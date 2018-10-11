package bean;

import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class ChatDao {

	SqlSession sqlSession;
	
	int listSize = 3;
	int blockSize = 5;
	int nowPage = 1;
	
	int totSize = 0;
	int totPage = 0;
	int totBlock = 0;
	int nowBlock = 0;
	int endPage = 0;
	int startPage = 0;
	int endNo = 0;
	int startNo = 0;
	int cnt = 0;
	GuestVo guestVo;
	
	public GuestVo getGuestVo() {
		return guestVo;
	}
	public void setGuestVo(GuestVo guestVo) {
		this.guestVo = guestVo;
	}
	
	public ChatDao() {
		try {
			sqlSession = ChatFactory.getFactory().openSession();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	public int getTableNo(String ip) {
		int result = 0;
		System.out.println("ChatDao ip : " + ip);
		if(sqlSession.selectOne("chat_table_no", ip) == null) {
			System.out.println("널임");
		} else {
			result = sqlSession.selectOne("chat.chat_table_no", ip);
		}
		System.out.println("result : " + result);
		return result;
	}
	
	// tableNo, tableIp
	public List<GuestVo> openTableList() {
		try {
			pageCompute();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		List<GuestVo> openTableList = sqlSession.selectList("chat.chat_open_list", this);
		
		System.out.println("openTableList에 잘 들어갔는지 확인하자");
		
		// 콘솔 확인용//////////////////////
		Iterator<GuestVo> iterator = openTableList.iterator();
		while(iterator.hasNext()) {
			GuestVo vo = iterator.next();
			System.out.print("tbl_no : " + vo.getTable_no());
			System.out.println("\tguest_gender : " + vo.getGuest_gender());
		}
		//////////////////////////////////////////
		return openTableList;
	}
	
	public void pageCompute() {
		int cnt = sqlSession.selectOne("chat.chat_count");
		setCnt(cnt);
		totSize = cnt;
		
		totPage = (int)Math.ceil(totSize/(double)listSize);
		totBlock = (int)Math.ceil(totPage/(double)blockSize);
		nowBlock = (int)Math.ceil(nowPage/(double)blockSize);
		
		endPage = nowBlock * blockSize;
		startPage = endPage - blockSize + 1;
		
		if(endPage > totPage) {
			endPage = totPage;
		}
		if(startPage < 1) {
			startPage = 1;
		}
		
		endNo = nowPage * listSize;
		startNo = endNo - listSize + 1;
		if(endNo > totSize) {
			endNo = totSize;
		}
		if(startNo < 1) {
			this.startNo = 1;
		}
	}
	
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public int getCnt() {
		return cnt;
	}
	
	public int getTotBlock() {
		return totBlock;
	}
	
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getTotPage() {
		return totPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndNo() {
		return endNo;
	}

	public int getStartNo() {
		return startNo;
	}
	
	public int getNowBlock() {
		return nowBlock;
	}
}
