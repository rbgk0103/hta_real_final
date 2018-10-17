package bean;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class ChatDao {

	SqlSession sqlSession;
	
	int listSize = 3;
	int blockSize = 3;
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
	ChatVo chatVo;
	
	int tableNo;
	
	public ChatDao() {
		try {
			sqlSession = ChatFactory.getFactory().openSession();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public List<TotalChatListVo> oneToOneChatList(ChatVo vo) {
		List<TotalChatListVo> list = new ArrayList<TotalChatListVo>();
		list = sqlSession.selectList("chat.chat_one_to_one_list", vo);
		return list;
	}
	
	//주문 날짜(guest.guest_status = 1)부터 현재 시간까지의 1대1 채팅, 또는 전체 채팅 목록을 불러옵니다.
	public List<TotalChatListVo> totalChatList() {
		List<TotalChatListVo> list = new ArrayList<TotalChatListVo>();
		list = sqlSession.selectList("chat.chat_content_list");
		return list;
	}
	
	public void inputMessage(ChatVo vo) {
		System.out.println("input Message 메소드");
		System.out.println("vo.gettext : " + vo.getChat_text());
		int result;
		try {
			result = sqlSession.insert("chat.chat_insert", vo);
			
			if(result > 0) {
				sqlSession.commit();
				System.out.println(result);
			} else {
				sqlSession.rollback();
				System.out.println(result);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			sqlSession.rollback();
			
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
		System.out.println("getTableNo : " + result);
		return result;
	}
	
	// tableNo, tableIp
	//page Compute해서 전체 session이 아닌 3개의 세션만 가져옴
	public List<GuestVo> openTableList(int tableNo) {
		pageCompute();
		setTableNo(tableNo);
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
	
	//guest_status = 1 테이블 목록을 가져옴
	public List<GuestVo> sessionOpenAllTableList() {
		List<GuestVo> sessionOpenAllTableList = sqlSession.selectList("chat.chat_all_list");
		// 콘솔 확인용//////////////////////
		Iterator<GuestVo> iterator = sessionOpenAllTableList.iterator();
		System.out.println("-------sessionOpenAllTableList--------");
		while(iterator.hasNext()) {
			GuestVo vo = iterator.next();
			System.out.print("tbl_no : " + vo.getTable_no());
			System.out.println("\tguest_gender : " + vo.getGuest_gender());
		}
		//////////////////////////////////////////
		return sessionOpenAllTableList;
	}
	
	public void pageCompute() {
		totSize = sqlSession.selectOne("chat.chat_count");
		
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
		if (startNo < 1) {
			startNo = 1;
		}
		if (nowBlock < 1) {
			nowBlock = 1;
		}
	}
	
	public ChatVo getChatVo() {
		return chatVo;
	}
	
	public void setChatVo(ChatVo chatVo) {
		this.chatVo = chatVo;
	}
	
	public int getTableNo() {
		return tableNo;
	}
	
	public void setTableNo(int tableNo) {
		this.tableNo = tableNo;
	}
	
	public GuestVo getGuestVo() {
		return guestVo;
	}
	
	public void setGuestVo(GuestVo guestVo) {
		this.guestVo = guestVo;
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
	
	public int getListSize() {
		return listSize;
	}
	
	public int getBlockSize() {
		return blockSize;
	}
	
	public int getTotSize() {
		return totSize;
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
