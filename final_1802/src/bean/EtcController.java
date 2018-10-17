package bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
		
		String findStr = "";
		if(req.getParameter("mbr_findStr") != null) {
			findStr = req.getParameter("mbr_findStr");
		}
		
		int nowPage = 1;
		if(req.getParameter("mbr_nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("mbr_nowPage"));
		}
		
		System.out.println("리스트 컨트롤에서 findStr : " + findStr);
		System.out.println("리스트 컨트롤러 nowPage : " + nowPage);
		page.setNowPage(nowPage);
		List<MembersVo> list = dao.list(findStr);
		
		mv.addObject("mbr_findStr", findStr);
		mv.addObject("mbr_nowPage", nowPage);
		mv.addObject("page", page);
		mv.addObject("list", list);
		
		mv.setViewName("members_manage/mbr_list");
		
		return mv;
	}
	
	@RequestMapping(value="/mbr_modify.etc")
	public ModelAndView modify(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String findStr = "";
		
		if(req.getParameter("mbr_findStr") != null) {
			findStr = req.getParameter("mbr_findStr");
		}
		
		int nowPage = 1;
		
		if(req.getParameter("mbr_nowPage").equals("") || req.getParameter("mbr_nowPage") == null) {
			nowPage = 1;
		}else {
			nowPage = Integer.parseInt(req.getParameter("mbr_nowPage"));
		}
		
		MembersVo mvo = dao.modify(req);
		
		page.setNowPage(nowPage);
		List<MembersVo> list = dao.list(findStr);
		
		if(mvo != null) {
			
			mv.addObject("mbr_findStr", findStr);
			mv.addObject("mbr_nowPage", nowPage);
			mv.addObject("page", page);
			mv.addObject("list", list);

			mv.setViewName("members_manage/mbr_list");
		}

		return mv;
	}
	
	@RequestMapping(value="/mbr_delete.etc")
	public ModelAndView delete(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		
		int mbrNo = Integer.parseInt(req.getParameter("mbrNo"));
		
		boolean b = dao.delete(mbrNo);
		
		mv.setViewName("forward:/mbr_list.etc");
		
		return mv;
	}
	
}
