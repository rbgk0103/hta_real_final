package bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EtcController {
	
	MembersDao dao;
	PageCompute page;
	
	public EtcController(MembersDao dao, PageCompute page) {
		this.dao = dao;
		this.page = page;
	}
	
	@RequestMapping(value="/mbr_list.etc")
	public ModelAndView list(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String findStr = req.getParameter("mbr_findStr");
		int nowPage = 1;
		
		if(req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		
		page.setNowPage(nowPage);
		List<MembersVo> list = dao.list(findStr);
		
		mv.addObject("page", page);
		mv.addObject("list", list);
		
		mv.setViewName("./member/mbr_list");
		
		return mv;
	}
	
	@RequestMapping(value="/mbr_modify.etc")
	public ModelAndView modify(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("컨트롤러");
		System.out.println("엠뱔엔오 : " + Integer.parseInt(req.getParameter("mbr_no")));
		
		String msg = "";
		
		msg = dao.modify(req);
		
		mv.addObject("msg", msg);
		mv.setViewName("./member/mbr_list");
		
		return mv;
	}
	
	@RequestMapping(value="/mbr_delete.etc")
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
		
		mv.setViewName("./member/mbr_list");
		
		return mv;
	}
	
}
