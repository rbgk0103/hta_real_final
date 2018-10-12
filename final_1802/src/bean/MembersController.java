package bean;

import java.util.List;

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
	public ModelAndView login(HttpServletRequest req, HttpSession session_mbr) {
		ModelAndView mv = new ModelAndView();
		
		String id = req.getParameter("mbr_id");
		String pwd = req.getParameter("mbr_pwd");
		
		MembersVo mvo = dao.login(id, pwd);
		String msg = "";
		
		if(mvo != null) {
			session_mbr.setAttribute("session_mbr", mvo);
			mv.addObject("mvo", mvo);
			msg = "login";
		}else {
			msg = "아이디 / 암호 다시 확인";
		}
		mv.addObject("msg", msg);
		mv.setViewName("info");
		
		return mv;
	}
	
	@RequestMapping(value="/idCheck.mbr")
	public ModelAndView idCheck(String id) {
		ModelAndView mv = new ModelAndView();

		int cnt = dao.idCheck(id);
		String msg = "";
		
		if(cnt > 0) {
			msg = "id_over";
			mv.addObject("msg", msg);
			mv.addObject("id_chk", "over");
			mv.setViewName("info");
		}else if(cnt == 0) {
			msg = "id_possible";
			mv.addObject("msg", msg);
			mv.addObject("id_chk", "possible");
			mv.setViewName("info");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/register.mbr")
	public ModelAndView register(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		
		msg = dao.register(req);
		
		if(msg.equals("reg_success")) {
			msg = "reg_success";
		}else if(msg.equals("reg_false")) {
			msg = "reg_false";
		}
		mv.addObject("msg", msg);
		mv.setViewName("info");
		return mv;
	}
	
	@RequestMapping(value="/findInfo.mbr")
	public ModelAndView findInfo(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		
		if(req.getParameter("mbr_name").equals("") || req.getParameter("mbr_phone").equals("")) {
			msg = "이름과 연락처를 모두 입력해주세요.";
			
			mv.addObject("msg", msg);
			mv.setViewName("info");
			return mv;
		}
		
		String name = req.getParameter("mbr_name");
		String phone = req.getParameter("mbr_phone");
		
		MembersVo mvo = dao.findInfo(name, phone);
		
		msg = "아이디 : " + mvo.getMbrId() + "\n비밀번호 : " + mvo.getMbrPwd();
		
		mv.addObject("mvo", mvo);
		mv.setViewName("info");
		
		return mv;
	}
	
	@RequestMapping(value="/logout.mbr")
	public ModelAndView logout(HttpSession sess) {
		ModelAndView mv = new ModelAndView();
		
		sess.removeAttribute("session_mbr");
		
		String msg = "logout";
		mv.addObject("msg", msg);
		mv.setViewName("info");
		return mv;
	}
	
	@RequestMapping(value="/mbr_list.mbr")
	public ModelAndView list(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String findStr = req.getParameter("findStr");
		int nowPage = 1;
		
		if(req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		
		page.setNowPage(nowPage);
		List<MembersVo> list = dao.list(findStr);
		
		mv.addObject("page", page);
		mv.addObject("list", list);
		
		mv.setViewName("mbr_list");
		
		return mv;
	}
	
}
