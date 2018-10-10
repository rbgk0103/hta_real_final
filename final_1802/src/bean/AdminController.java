package bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	AdminDao dao;
	
	public AdminController(AdminDao dao) {
		this.dao = dao;
	}
	@RequestMapping(value="table_status.adm")
	public ModelAndView table_status() {
		ModelAndView mv = new ModelAndView();
		System.out.println("들어온거맞냐 ㅡㅡ");
		
		List<tblVo> list = dao.table_select();
		
		mv.addObject("list",list);
		mv.setViewName("table/table_status");
		return mv;
	}
	
	@RequestMapping(value="table_set.adm")
	public ModelAndView table_set(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		System.out.println("들어온거맞냐 ㅡㅡ");
		
		System.out.println(req.getParameter("guest_gender")+"성별");
		System.out.println(req.getParameter("tbl_no")+"테이블넘버");
		System.out.println(req.getParameter("guest_cnt")+"명수");
		
		

		mv.setViewName("table/table_set_result");
		return mv;
	}
}
