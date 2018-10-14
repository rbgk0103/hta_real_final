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
		List<GuestVo> openTableList = dao.openTableList(tableNo);
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
		System.out.println("ip param = " + req.getParameter("ip"));
		System.out.println("nowPage param : " + req.getParameter("nowPage"));
		String ip = req.getParameter("ip");
		String ipCut = ip.substring(ip.length()-2, ip.length());
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		dao.setNowPage(nowPage);
		int tableNo = dao.getTableNo(ipCut);
		List<GuestVo> openTableList = dao.openTableList(tableNo);
		// openTableList 쿼리에서 현재 테이블 번호를 제외한 접속한 테이블의 정보를 불러와야합니다.
		// 테이블 목록을 볼 때 자기 자신의 테이블 이 속해있는 page일 경우
		// 테이블 갯수가 2개로 나오고 그 뒤에 있는 테이블은 보이지 않게됩니다.
		Iterator<GuestVo> iterator = openTableList.iterator();
		while(iterator.hasNext()) {
			GuestVo vo = iterator.next();
			System.out.print("vo.getTable_no() : " + vo.getTable_no());
			System.out.println("\tvo.getGuest_gender() : " + vo.getGuest_gender());
		}
		
		modelAndView.addObject("ip", ip);
		modelAndView.addObject("tableNo", tableNo);
		modelAndView.addObject("openTableList", openTableList);
		modelAndView.addObject("chatDao", dao);
		modelAndView.setViewName("chat/chatHeader");
		return modelAndView;
	}
}
