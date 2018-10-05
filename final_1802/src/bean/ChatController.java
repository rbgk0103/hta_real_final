package bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {

	ChatDao dao;
	
	public ChatController(ChatDao dao) {
		this.dao = dao;
	}
	
	/*@RequestMapping(value="/onOpen.chat")
	public ModelAndView onOpen(String ip) {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("컨트롤러 ip : " + ip);
		modelAndView.addObject("ip", ip);
		modelAndView.setViewName("client");
		return modelAndView;
	}*/
	
	@RequestMapping(value="./notice.chat")
	public ModelAndView notice() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("chatNotice");
		return modelAndView;
	}
	
	@RequestMapping(value="./content.chat")
	public ModelAndView content(String message) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("chatContent");
		return modelAndView;
	}
}
