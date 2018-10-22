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
	/*********************************table**************************************/
	@RequestMapping(value="table_status.adm")
	public ModelAndView table_status() {
		ModelAndView mv = new ModelAndView();
		
		
		List<TblVo> list = admin_dao.table_select();
		List<OrdersSetVo> list_orders = admin_dao.table_order_select();
		
		
		mv.addObject("list",list);
		mv.addObject("list_orders",list_orders);
		mv.setViewName("table/table_status");
		return mv;
	}
	
	@RequestMapping(value="table_set.adm")
	public ModelAndView table_set(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String table_ip_cut = admin_dao.get_admin_ip(req);
		String table_msg = admin_dao.set_table_on(req);
		String guest_msg = admin_dao.set_guest(req);
		System.out.println("table_ip_cut - controller : " + table_ip_cut);
		mv.addObject("table_ip_cut", table_ip_cut);
		mv.setViewName("table/table_set_result");
		return mv;
	}
	
	@RequestMapping(value="table_set_delete.adm")
	public ModelAndView table_set_delete(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String table_msg = admin_dao.set_table_off(req);
		String guest_msg = admin_dao.guest_status_update(req);

		mv.setViewName("table/table_set_delete");
		return mv;
	}
	
	@RequestMapping(value="table_pay.adm")
	public ModelAndView table_pay(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String table_pay = admin_dao.insert_table_pay(req);
		String guest_msg = admin_dao.guest_status_update_pay(req);
		String table_msg = admin_dao.set_table_off(req);
		
		System.out.println(table_pay);
		System.out.println(guest_msg);
		System.out.println(table_msg);
		
		
		
		mv.addObject("table_msg",table_msg);
		mv.addObject("table_pay",table_pay);
		mv.addObject("guest_msg",guest_msg);
		mv.setViewName("table/table_pay");
		return mv;
	}

	
	
	
	
	
	
	
	
	
	/*********************************menu**************************************/
	@RequestMapping(value="menu_list.adm")
	public ModelAndView menu_list(String menu_type) {
		ModelAndView mv = new ModelAndView();
		List<MenuVo> list = this.menu_dao.list(menu_type);
		
		mv.addObject("list",list);
		mv.addObject("mt", menu_type);
		mv.setViewName("menu/menu_index");
		return mv;
	}
	
	@RequestMapping(value="insert_menu.adm")
	public ModelAndView menu_insert(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		msg = this.menu_dao.insert(req);
		
		mv.addObject("msg", msg);
		mv.setViewName("menu/menu_index");
		return mv;
	}
	
	@RequestMapping(value="menu_view.adm")
	public ModelAndView menu_view(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		MenuVo vo = menu_dao.view(Integer.parseInt(req.getParameter("menu_no")));
		mv.addObject("vo", vo);
		mv.setViewName("menu/menu_view");
		return mv;
	}
	@RequestMapping(value="menu_modify.adm")
	public ModelAndView menu_modify(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		msg = menu_dao.modify(req);
		
		mv.addObject("msg", msg);
		mv.setViewName("menu/menu_index");
		return mv;
	}
	@RequestMapping(value="menu_delete.adm")
	public ModelAndView menu_delete(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		System.out.println("delete 진입");
		String msg = "";
		msg = menu_dao.delete(req);
		System.out.println(msg);
		mv.addObject("msg", msg);
		mv.setViewName("menu/menu_index");
		return mv;
	}
	
	@RequestMapping(value="menu_today.adm")
	public ModelAndView menu_today(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		msg = menu_dao.today(req, 1);
		System.out.println(msg);
		mv.addObject("msg", msg);
		mv.setViewName("menu/menu_index");
		return mv;
	}
	@RequestMapping(value="menu_today_no.adm")
	public ModelAndView menu_today_no(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		msg = menu_dao.today(req, 0);
		System.out.println(msg);
		mv.addObject("msg", msg);
		mv.setViewName("menu/menu_index");
		return mv;
	}
	@RequestMapping(value="menu_go_insert.adm")
	   public ModelAndView menu_go_insert(HttpServletRequest req) {
	      ModelAndView mv = new ModelAndView();
	      mv.setViewName("menu/menu_insert");
	      return mv;
	   }
}
