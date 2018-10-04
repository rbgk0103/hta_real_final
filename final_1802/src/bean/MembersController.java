package bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MembersController {
	
	MembersDao dao;
	PageCompute page;
	
	public MembersController(MembersDao dao, PageCompute page) {
		this.dao = dao;
		this.page = page;
	}
	
	public ModelAndView login(HttpServletRequest req, HttpSession session_id) {
		ModelAndView mv = new ModelAndView();
		System.out.println("모델앤뷰 로그인");
		
		return mv;
	}

}
