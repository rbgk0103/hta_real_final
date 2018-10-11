package bean;

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
		String ip = req.getParameter("ip");
		String ipCut = ip.substring(ip.length()-2, ip.length());
		System.out.println("컨트롤러 ip : " + ipCut);
		int tableNo = dao.getTableNo(ipCut);
		System.out.println("Controller tableNo : " + tableNo);
		//	테이블번호, ip 뒤 두 자리
		List<GuestVo> openTableList = dao.openTableList();
		modelAndView.addObject("ip", ip);
		modelAndView.addObject("tableNo", tableNo);
		modelAndView.addObject("openTableList", openTableList);
		modelAndView.setViewName("chatClientIndex");

		return modelAndView;
	}
	
	@RequestMapping(value="header.chat")
	public ModelAndView loadHeader() {
		ModelAndView modelAndView = new ModelAndView();
		
		return modelAndView;
	}
}
