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
	TotalChatListVo totalChatListVo;
	boolean chatSwitch;	//전체채팅 : true, 1:1채팅 : false;
	
	public ChatController(ChatVo chatVo, ChatDao chatDao, TotalChatListVo totalChatListVo) {
		this.chatVo = chatVo;
		this.chatDao = chatDao;
		this.totalChatListVo = totalChatListVo;
	}
	
	public ModelAndView notice() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("chatNotice");
		return modelAndView;
	}
	
	@RequestMapping(value="content.chat")
	public ModelAndView content(HttpServletRequest req) {
		ModelAndView modelAndView = new ModelAndView();
		String msg = req.getParameter("msg");
		String receiver = msg.substring(1);
		List<TotalChatListVo> list = new ArrayList<TotalChatListVo>();
		if(msg.substring(1).equals("a")) {
			list = chatDao.totalChatList();
		} else {
			list = chatDao.oneToOneChatList(receiver);
		}
		
		System.out.println("1대1대화중의 msg : " + msg);
		if(list != null) {
			modelAndView.addObject("totalChatList", list);
		}
		modelAndView.addObject("tableNo", msg.substring(0, 1));
		modelAndView.setViewName("chat/chatContent");
		return modelAndView;
	}
	
	@RequestMapping(value="insert.chat")
	public void onMessage(HttpServletRequest req) {
		System.out.println("insert.chat 들어옴");
		System.out.println("msg param : " + req.getParameter("msg"));
		String msg = req.getParameter("msg");
		chatSwitch = msg.substring(1).equals("a") ? true : false;
		
		chatVo.setChat_date(new Date());
		chatVo.setChat_sender(msg.substring(0, 1));
		chatVo.setChat_receiver(msg.substring(1, 2));
		chatVo.setChat_text(msg.substring(2, msg.length()-2));
		
		chatDao.inputMessage(chatVo);
	}
	
	@RequestMapping(value="getIp.chat")
	public ModelAndView onOpen(HttpServletRequest req) {
		ModelAndView modelAndView = new ModelAndView();
		String url = "";
		String ip = req.getParameter("ip");
		String ipCut = ip.substring(ip.length()-2, ip.length());
		int nowPage = req.getParameter("nowPage") != null
					? Integer.parseInt(req.getParameter("nowPage"))
					: 1;
		chatDao.setNowPage(nowPage);
		int tableNo = chatDao.getTableNo(ipCut);
		
		System.out.println("컨트롤러 ip : " + ipCut);
		System.out.println("Controller tableNo : " + tableNo);
		
		//	테이블번호, ip 뒤 두 자리
		List<GuestVo> openTableList = chatDao.openTableList(tableNo);
		List<GuestVo> sessionOpenAllTableList = chatDao.sessionOpenAllTableList();
		List<TotalChatListVo> totalChatList = chatDao.totalChatList();
		if(req.getParameter("nowPage") != null) {
			url = "chat/chatHeader";
		} else {
			url = "chatClientIndex";
		}
		Iterator<TotalChatListVo> iterator = totalChatList.iterator();
		while(iterator.hasNext()) {
			TotalChatListVo vo = iterator.next();
			System.out.println("getIp 메소드 : " + vo.getGuest_gender());
		}
		
		modelAndView.addObject("totalChatList", totalChatList);
		modelAndView.addObject("ip", ip);
		modelAndView.addObject("tableNo", tableNo);
		modelAndView.addObject("openTableList", openTableList);
		modelAndView.addObject("allTableList", sessionOpenAllTableList);
		modelAndView.addObject("chatDao", chatDao);
		modelAndView.setViewName(url);
		
		return modelAndView;
	}
	////////////////////////////////////////////////
	// "#allCircleBorder, #circleBorder 색상 조정 필요 //
	////////////////////////////////////////////////
	@RequestMapping(value="header.chat")
	public ModelAndView loadHeader(HttpServletRequest req) {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("loadHeader 메소드");
		System.out.println("ip param = " + req.getParameter("ip"));
		System.out.println("nowPage param : " + req.getParameter("nowPage"));
		String ip = req.getParameter("ip");
		String ipCut = ip.substring(ip.length()-2, ip.length());
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		chatDao.setNowPage(nowPage);
		int tableNo = chatDao.getTableNo(ipCut);
		List<GuestVo> openTableList = chatDao.openTableList(tableNo);
		Iterator<GuestVo> iterator = openTableList.iterator();
		while(iterator.hasNext()) {
			GuestVo vo = iterator.next();
			System.out.print("vo.getTable_no() : " + vo.getTable_no());
			System.out.println("\tvo.getGuest_gender() : " + vo.getGuest_gender());
		}
		
		modelAndView.addObject("ip", ip);
		modelAndView.addObject("tableNo", tableNo);
		modelAndView.addObject("openTableList", openTableList);
		modelAndView.addObject("chatDao", chatDao);
		modelAndView.setViewName("chat/chatHeader");
		return modelAndView;
	}
}
