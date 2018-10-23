package bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {

	ChatDao chatDao;
	ChatVo chatVo;
	TotalChatListVo totalChatListVo;	//테이블 번호, 성별, 메세지 보낸 시간, 보낸 테이블 번호, 메세지 내용, 받는 테이블 번호
	
	public ChatController(ChatVo chatVo, ChatDao chatDao, TotalChatListVo totalChatListVo) {
		this.chatVo = chatVo;
		this.chatDao = chatDao;
		this.totalChatListVo = totalChatListVo;
	}
	
	//chatClientIndex의 공지 버튼을 눌렀을 때 호출
	@RequestMapping(value="noticeInsert.chat")
	public ModelAndView noticeInsert(HttpServletRequest req) {
		ModelAndView modelAndView = new ModelAndView();
		chatDao.noticeInsert(req.getParameter("noticeMessage"));	//공지를 notice 테이블에 insert
		
		modelAndView.addObject("noticeText", chatDao.notice());	//insert 후 가장 최근에 등록한 공지 내용을 가져온 후 addObject
		modelAndView.setViewName("chat/chatNotice");
		return modelAndView;
	}
	
	
	//공지 하나를 불러옴 (공지 입력했을 때, chatClientIndex.jsp가 켜졌을 때
	@RequestMapping(value="notice.chat")
	public ModelAndView notice() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("noticeText", chatDao.notice());	//최근 공지 하나를 불러온 후 addObject
		modelAndView.setViewName("chat/chatNotice");
		return modelAndView;
	}
	
	//1대1채팅 혹은 전체채팅 목록을 불러옴(chatHeader에서 테이블 번호를 눌렀을 경우, chatClientIndex.jsp가 켜졌을 경우
	@RequestMapping(value="content.chat")
	public ModelAndView content(HttpServletRequest req) {
		ModelAndView modelAndView = new ModelAndView();
		
		List<TotalChatListVo> list = new ArrayList<TotalChatListVo>();
		if(req.getParameter("msg").substring(1).equals("a")) {	//전체 채팅일 경우
			list = chatDao.totalChatList();	//전체채팅 불러옴
		} else {	//1대1 채팅일 경우
			ChatVo vo = new ChatVo();
			vo.setChat_sender(req.getParameter("msg").substring(0, 1));	//보낸 테이블 번호
			vo.setChat_receiver(req.getParameter("msg").substring(1));	//받는 테이블 번호
			list = chatDao.oneToOneChatList(vo);	//1대1 대화 목록
		}
		modelAndView.addObject("totalChatList", list);
		modelAndView.addObject("receiveNo", req.getParameter("msg").substring(1));
		modelAndView.addObject("tableNo", req.getParameter("msg").substring(0, 1));
		modelAndView.setViewName("chat/chatContent");	//chatClientIndex.jsp의 chatContent에 로드
		return modelAndView;
	}
	
	//대화 전송 버튼을 눌렀을 때 DB chat 테이블에 저장
	@RequestMapping(value="insert.chat")
	public ModelAndView onMessage(HttpServletRequest req) {
		ModelAndView modelAndView = new ModelAndView();
		
		//chatVo에 값을 넣음
		chatVo.setChat_date(new Date());
		chatVo.setChat_sender(req.getParameter("msg").substring(0, 1));
		chatVo.setChat_receiver(req.getParameter("msg").substring(1, 2));
		chatVo.setChat_text(req.getParameter("msg").substring(2, req.getParameter("msg").length()-2));
		chatDao.inputMessage(chatVo);	//DB에 저장
		
		return modelAndView;
	}
	
	@RequestMapping(value="getIp.chat")	//index에서 채팅 버튼을 눌렀을 때
	public ModelAndView onOpen(HttpServletRequest req) {
		ModelAndView modelAndView = new ModelAndView();
		String ip = req.getParameter("ip");	//index.jsp에 있는 자신의 ip를 parameter로 보냄
		System.out.println("getIP에 있는 ip : " + ip);
		String ipCut = ip.substring(ip.length()-2, ip.length());	//ip 뒤 두 자리
		int nowPage = req.getParameter("nowPage") != null	//chatHeader에서 사용하는 nowPage가 없으면 1로 set
					? Integer.parseInt(req.getParameter("nowPage"))
					: 1;
		chatDao.setNowPage(nowPage);
		int tableNo = chatDao.getTableNo(ipCut);	//ip뒤 두 자리에 따른 테이블 번호(DB : table_status 테이블)
		
		List<GuestVo> openTableList = chatDao.openTableList(tableNo);	//page Compute해서 전체 session이 아닌 3개의 세션만 가져옴
		List<GuestVo> sessionOpenAllTableList = chatDao.sessionOpenAllTableList();	//guest_status = 1 테이블 목록을 가져옴, 손님이 자리아 앉은 후 관리자가 테이블에 성별, 인원을 입력했을 때,
		List<TotalChatListVo> totalChatList = chatDao.totalChatList();		//주문 날짜(guest.guest_status = 1)부터 현재 시간까지의 전체 채팅 목록을 불러옵니다.
		
		modelAndView.addObject("totalChatList", totalChatList);	//주문 날짜(guest.guest_status = 1)부터 현재 시간까지의 전체 채팅 목록을 불러옵니다.
		modelAndView.addObject("ip", ip);
		modelAndView.addObject("tableNo", chatDao.getTableNo(ipCut));	//ip뒤 두 자리에 따른 테이블 번호(DB : table_status 테이블)
		modelAndView.addObject("openTableList", openTableList);	//page Compute해서 전체 session이 아닌 3개의 세션만 가져옴
		modelAndView.addObject("allTableList", sessionOpenAllTableList);	//guest_status = 1 테이블 목록을 가져옴, 손님이 자리아 앉은 후 관리자가 테이블에 성별, 인원을 입력했을 때,
		modelAndView.addObject("chatDao", chatDao);	//chatHeader의 nowPage용
		modelAndView.setViewName("chatClientIndex");
		
		return modelAndView;
	}
	
	@RequestMapping(value="header.chat")	//chatHeader 로드
	public ModelAndView loadHeader(HttpServletRequest req) {
		ModelAndView modelAndView = new ModelAndView();
		//ip 뒤 두 자리
		String ipCut = req.getParameter("ip").substring(req.getParameter("ip").length()-2, req.getParameter("ip").length());
		int nowPage;
		if(req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
			chatDao.setNowPage(nowPage);
		}
		int tableNo = chatDao.getTableNo(ipCut);
		List<GuestVo> openTableList = chatDao.openTableList(tableNo);	//page Compute해서 전체 session이 아닌 3개의 세션만 가져옴
		int receiveIntNo;
		String receiveStringNo;
		try {
		if(req.getParameter("receiveNo") == "a" || req.getParameter("receiveNo") == null) {
			receiveStringNo = "a";
			modelAndView.addObject("receiveStringNo", receiveStringNo);
		} else {
			receiveIntNo = Integer.parseInt(req.getParameter("receiveNo"));
			modelAndView.addObject("receiveIntNo", receiveIntNo);
		}
		} catch (NumberFormatException ex) {
			System.out.println("java.lang.NumberFormatException");
		}
		
		modelAndView.addObject("ip", req.getParameter("ip"));
		modelAndView.addObject("tableNo", tableNo);
		modelAndView.addObject("openTableList", openTableList);
		modelAndView.addObject("chatDao", chatDao);
		modelAndView.setViewName("chat/chatHeader");
		return modelAndView;
	}
}
