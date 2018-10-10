package bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MembersController {
	
	MembersDao dao;
	PageCompute page;
	
	public MembersController(MembersDao dao, PageCompute page) {
		this.dao = dao;
		this.page = page;
	}
	
	@RequestMapping(value="/login.mbr")
	public ModelAndView login(HttpServletRequest req, HttpSession session_id) {
		ModelAndView mv = new ModelAndView();
		System.out.println("모델앤뷰 로그인");
		
		String id = req.getParameter("mbr_id");
		String pwd = req.getParameter("mbr_pwd");
		
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		
		boolean b = dao.login(id, pwd);
		String msg = "";
		
		return mv;
	}

	@RequestMapping(value="/register.mbr")
	public ModelAndView register(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		System.out.println("모델앤뷰 레지스터");
		
		String id = req.getParameter("mbr_id");
		String pwd = req.getParameter("mbr_pwd");
		String name = req.getParameter("mbr_name");
		String phone = req.getParameter("mbr_phone");
		String birth = req.getParameter("mbr_birth");
		String gender = req.getParameter("mbr_gender");
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		System.out.println("name : " + name);
		System.out.println("phone : " + phone);
		System.out.println("birth : " + birth);
		System.out.println("gender : " + gender);
		
		String msg = dao.register(req);
		mv.addObject("msg", msg);
		
		return mv;
	}
	
	@RequestMapping(value="/findInfo.mbr")
	public ModelAndView findInfo(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		System.out.println("모델엔뷰 파인드");
		String msg = "";
		
		if(req.getParameter("mbr_name").equals("") || req.getParameter("mbr_phone").equals("")) {
			msg = "이름과 연락처를 입력해 쨔샤";
			
			mv.addObject("msg", msg);
			mv.setViewName("msg");
			return mv;
		}
		
		String name = req.getParameter("mbr_name");
		String phone = req.getParameter("mbr_phone");
		
		System.out.println("name : " + name);
		System.out.println("phone : " + phone);
		
		MembersVo mvo = dao.findInfo(name, phone);
		
		msg = "아이디 : " + mvo.getMbrId() + "\n비밀번호 : " + mvo.getMbrPwd();
		System.out.println("컨트롤러 msg : " + msg);
		
		mv.addObject("mvo", mvo);
		mv.setViewName("msg");
		
		return mv;
	}
	
}
