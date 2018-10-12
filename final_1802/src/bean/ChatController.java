package bean;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller(value="*.chat")
public class ChatController {

	ChatDao dao;
	
	public ChatController(ChatDao dao) {
		this.dao = dao;
	}
	
	public ModelAndView notice() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("chatNotice");
		return modelAndView;
	}
	
	public ModelAndView content(String message) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("chatContent");
		return modelAndView;
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
		dao.setNowPage(nowPage);
		int tableNo = dao.getTableNo(ipCut);
		
		System.out.println("컨트롤러 ip : " + ipCut);
		System.out.println("Controller tableNo : " + tableNo);
		
		//	테이블번호, ip 뒤 두 자리
		List<GuestVo> openTableList = dao.openTableList();
		List<GuestVo> sessionOpenAllTableList = dao.sessionOpenAllTableList();
		if(req.getParameter("nowPage") != null) {
			url = "chat/chatHeader";
		} else {
			url = "chatClientIndex";
		}
		modelAndView.addObject("ip", ip);
		modelAndView.addObject("tableNo", tableNo);
		modelAndView.addObject("openTableList", openTableList);
		modelAndView.addObject("allTableList", sessionOpenAllTableList);
		modelAndView.addObject("chatDao", dao);
		modelAndView.setViewName(url);
		
		return modelAndView;
	}
	
	@RequestMapping(value="header.chat")
	public ModelAndView loadHeader(HttpServletRequest req) {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("loadHeader 메소드");
		String ip = req.getParameter("ip");
		String ipCut = ip.substring(ip.length()-2, ip.length());
		int nowPage = req.getParameter("nowPage") != null
				? Integer.parseInt(req.getParameter("nowPage"))
				: 1;
		dao.setNowPage(nowPage);
		int tableNo = dao.getTableNo(ipCut);
		List<GuestVo> openTableList = dao.openTableList();
		System.out.println("--------------HEADER.CHAT--------------");
		Iterator<GuestVo> iterator = openTableList.iterator();
		while(iterator.hasNext()) {
			GuestVo vo = iterator.next();
			System.out.println("vo.getTable_no() : " + vo.getTable_no());
			System.out.println("vo.getGuest_gender() : " + vo.getGuest_gender());
		}
		System.out.println("header.chat의 nowPageParameter : " + nowPage);
		System.out.println("header.chat의 ip parameter : " + ip);
		System.out.println("dao.getBlockSize() : " + dao.getBlockSize());
		System.out.println("dao.getEndNo() : " + dao.getEndNo());
		System.out.println("dao.getEndPage() : " + dao.getEndPage());
		System.out.println("dao.getListSize() : " + dao.getListSize());
		System.out.println("dao.getNowBlock() : " + dao.getNowBlock());
		System.out.println("dao.getNowPage() : " + dao.getNowPage());
		System.out.println("dao.getStartNo() : " + dao.getStartNo());
		System.out.println("dao.getStartPage() : " + dao.getStartPage());
		System.out.println("dao.getTableNo(ipCut) : " + dao.getTableNo(ipCut));
		System.out.println("dao.getTotBlock() : " + dao.getTotBlock());
		System.out.println("dao.getTotPage() : " + dao.getTotPage());
		System.out.println("dao.getTotSize() : " + dao.getTotSize());
		
		modelAndView.addObject("ip", ip);
		modelAndView.addObject("tableNo", tableNo);
		modelAndView.addObject("openTableList", openTableList);
		modelAndView.addObject("chatDao", dao);
		modelAndView.setViewName("chat/chatHeader");
		System.out.println("dao end page : " + dao.getEndNo());
		return modelAndView;
	}
}
