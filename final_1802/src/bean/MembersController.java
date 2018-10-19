package bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MembersController {
	
	MembersDao dao;

	public MembersController(MembersDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="/login.mbr")
	public ModelAndView login(HttpServletRequest req, HttpSession session_mbr) {
		ModelAndView mv = new ModelAndView();
		
		String id = req.getParameter("mbr_id");
		String pwd = req.getParameter("mbr_pwd");
		int tblNo = Integer.parseInt(req.getParameter("tbl_no"));
		
		MembersVo mvo = dao.login(id, pwd, tblNo);
		String msg = "";
		
		if(mvo != null) {
			session_mbr.setAttribute("session_mbr", mvo);
			mv.addObject("mvo", mvo);
			msg = "login_success";
		}else {
			msg = "login_false";
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
			msg = "find_null";
			
			mv.addObject("msg", msg);
			mv.setViewName("info");
			return mv;
		}
		
		String name = req.getParameter("mbr_name");
		String phone = req.getParameter("mbr_phone");
		
		MembersVo mvo = dao.findInfo(name, phone);
		
		if(mvo != null) {
			msg = "find_success";
			
			mv.addObject("msg", msg);
			mv.addObject("mvo", mvo);
			mv.setViewName("info");
		}else {
			msg = "find_false";
			
			mv.addObject("msg", msg);
			mv.setViewName("info");
		}
		
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
	
	@RequestMapping(value="/mbr_modify.mbr")
	public ModelAndView modify(HttpServletRequest req, HttpSession session_mbr) {
		ModelAndView mv = new ModelAndView();
		
		MembersVo mvo = dao.modify(req);
		String msg = "";
		
		if(mvo != null) {
			session_mbr.removeAttribute("session_mbr");
			session_mbr.setAttribute("session_mbr", mvo);
			mv.addObject("mvo", mvo);
			msg = "mody_success";
		}else {
			msg = "mody_false";
		}
		
		mv.addObject("msg", msg);
		mv.setViewName("info");
		
		return mv;
	}
	
}
