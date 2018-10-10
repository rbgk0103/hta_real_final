package bean;

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
		System.out.println("컨트롤러 ip : " + ip);
		int tableNo = dao.getTableNo(ip);
		System.out.println("Controller tableNo : " + tableNo);
		modelAndView.addObject("ip", ip);
		modelAndView.addObject("tableNo", tableNo);
		modelAndView.setViewName("chatClientIndex");
		return modelAndView;
	}
}
