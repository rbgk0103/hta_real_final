package bean;

import org.springframework.web.servlet.ModelAndView;

public class ChatController {

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
}
