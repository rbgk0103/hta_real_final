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
		
		System.out.println("컨트롤러");
		System.out.println("엠뱔엔오 : " + Integer.parseInt(req.getParameter("mbr_no")));
		System.out.println("엠뱔아디 : " + req.getParameter("mbr_id"));
		System.out.println("엠뱔피됩 : " + req.getParameter("mbr_pwd"));
		System.out.println("엠뱔넴 : " + req.getParameter("mbr_name"));
		System.out.println("엠뱔폰 : " + req.getParameter("mbr_phone"));
		System.out.println("엠뱔벌쓰 : " + req.getParameter("mbr_birth"));
		System.out.println("엠뱔젠더 : " + req.getParameter("mbr_gender"));
		System.out.println("엠뱔푄트 : " + Integer.parseInt(req.getParameter("mbr_point")));
		
		
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
	
	@RequestMapping(value="/mbr_delete.mbr")
	public ModelAndView delete(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String findStr = req.getParameter("mbr_findStr");
		int mbrNo = Integer.parseInt(req.getParameter("mbrNo"));
		int nowPage = Integer.parseInt(req.getParameter("nowPage"));
		
		page.setNowPage(nowPage);
		
		dao.delete(mbrNo);

		List<MembersVo> list = dao.list(findStr);
		
		mv.addObject("page", page);
		mv.addObject("list", list);
		
		mv.setViewName("mbr_list");
		
		return mv;
	}
	
}
