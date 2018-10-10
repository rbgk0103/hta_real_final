package bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	AdminDao admin_dao;
	MenuDao menu_dao;
	
	public AdminController(AdminDao admin_dao , MenuDao menu_dao) {
		this.admin_dao = admin_dao;
		this.menu_dao = menu_dao;
	}
	@RequestMapping(value="table_status.adm")
	public ModelAndView table_status() {
		ModelAndView mv = new ModelAndView();
		
		List<TblVo> list = admin_dao.table_select();
		

		mv.addObject("list",list);
		mv.setViewName("table/table_status");
		return mv;
	}
	
	@RequestMapping(value="table_set.adm")
	public ModelAndView table_set(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
	
		String table_msg = admin_dao.set_table_on(req);
		String guest_msg = admin_dao.set_guest(req);
		
		System.out.println(table_msg);
		System.out.println(guest_msg);
		//set_guest;
		
		mv.setViewName("table/table_set_result");
		return mv;
	}
	
	@RequestMapping(value="menu_list.adm")
	public ModelAndView menu_list(String menu_type) {
		ModelAndView mv = new ModelAndView();
		List<MenuVo> list = this.menu_dao.list(menu_type);
		
		mv.addObject("list",list);
		mv.addObject("mt", menu_type);
		mv.setViewName("menu/menu_index");
		return mv;
	}
}
