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
	//공지 insert, sysdate와 매개변후를 notice테이블에 저장
	public void noticeInsert(String noticeText) {
		int result = 0;
		try {
			result = sqlSession.insert("chat.notice_insert", noticeText);
			if(result < 1) {
				sqlSession.rollback();
			} else {
				sqlSession.commit();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			sqlSession.rollback();
		}
	}
	
	//notice select, 가장 최근에 등록한 공지 하나를 불러옴
	public String notice() {
		String noticeText = sqlSession.selectOne("chat.chat_notice");
		return noticeText;
	}
	
	
	//orders 테이블의 주문 시간부터 sysdate까지, guest_status =1 이고 보내는 테이블과 받는 테이블이 서로 교차되어 같을 경우의 대화 목록을 불러옴
	//1대1 대화 목록
	public List<TotalChatListVo> oneToOneChatList(ChatVo vo) {
		List<TotalChatListVo> list = new ArrayList<TotalChatListVo>();
		list = sqlSession.selectList("chat.chat_one_to_one_list", vo);
		return list;
	}
	
	//주문 날짜(guest.guest_status = 1)부터 현재 시간까지의 전체 채팅 목록을 불러옵니다.
	public List<TotalChatListVo> totalChatList() {
		List<TotalChatListVo> list = new ArrayList<TotalChatListVo>();
		list = sqlSession.selectList("chat.chat_content_list");
		return list;
	}
	
	//client가 메세지를 전송할 때 메세지를 chat 테이블에 저장
	public void inputMessage(ChatVo vo) {
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
	
	//ip 뒤 두 자리로 table_status 테이블을 조회한 테이블 번호를 가져옴
	public int getTableNo(String ip) {
		int result = 0;
		if(sqlSession.selectOne("chat_table_no", ip) != null) {
			result = sqlSession.selectOne("chat.chat_table_no", ip);
		}
		return result;
	}
	
	//page Compute해서 전체 session이 아닌 3개의 세션만 가져옴
	public List<GuestVo> openTableList(int tableNo) {
		pageCompute();
		setTableNo(tableNo);
		List<GuestVo> openTableList = sqlSession.selectList("chat.chat_open_list", this);
		
		return openTableList;
	}
	
	//guest_status = 1 테이블 목록을 가져옴, 손님이 자리아 앉은 후 관리자가 테이블에 성별, 인원을 입력했을 때,
	//관리자가 성별, 인원을 입력한 테이블의 목록을 가져옴
	public List<GuestVo> sessionOpenAllTableList() {
		List<GuestVo> sessionOpenAllTableList = sqlSession.selectList("chat.chat_all_list");
		return sessionOpenAllTableList;
	}
	
	//chatHeader 페이징 용
	public void pageCompute() {
		//자기 자신을 제외한 접속한 테이블(guest_status = 1)의 목록을 가져옴
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
