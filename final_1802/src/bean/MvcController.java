package bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// Controller 어노테이션이 있으니까 이 클래스가 컨틀로러다
@Controller
public class MvcController {

	@RequestMapping(value="/list.ord")
	public String test() {
		String test = "통과";
		return test;
	}
	
	
} // End of class

