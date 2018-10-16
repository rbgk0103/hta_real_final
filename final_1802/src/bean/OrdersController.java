package bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.RequestWrapper;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrdersController {
	OrdersDao dao;
	
	public OrdersController(OrdersDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value = "/main.ord")
	public ModelAndView orderMain(String findStr) {
		ModelAndView mv = new ModelAndView();
		findStr = "";
		List<MenuVo> list = dao.menuSelect(findStr);
		System.out.println("우리모두 하하하");
		
		mv.addObject("list", list);
		mv.setViewName("order_menu");
		return mv;
	}
	
	@RequestMapping(value = "/center.ord")
	public ModelAndView orderCenter(HttpServletRequest req, String findStr) {
		ModelAndView mv = new ModelAndView();
		findStr = req.getParameter("findStr");
		List<MenuVo> list = dao.menuSelect(findStr);
		System.out.println("우리모두 하하하");
		
		mv.addObject("list", list);
		mv.setViewName("center_menu");
		return mv;
	}
	
	
	@RequestMapping(value = "/orderMenu.ord")
	public ModelAndView orderMenu(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		int tblNo = Integer.parseInt(req.getParameter("ord_tbl_no")); 
		int g_no = Integer.parseInt(req.getParameter("guest_no")); 
		String nos[] = req.getParameterValues("menu_no");
		String qtys[] = req.getParameterValues("os_qty");
		String prices[] = req.getParameterValues("os_price");
		
		String msg = dao.addList(nos, qtys, prices, tblNo, g_no);
		
		mv.addObject("msg", msg);
		mv.setViewName("order_result");
		return mv;
	}
	
	@RequestMapping(value = "/viewList.ord")
	public ModelAndView viewList(HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		System.out.println("viewList안에");
		System.out.println(req.getParameter("ord_tbl_no"));
//		int tblNo = Integer.parseInt(req.getParameter("ord_tbl_no")); 
//		int g_no = Integer.parseInt(req.getParameter("guest_no"));
		
		int tblNo = Integer.parseInt(req.getParameter("tbl_no")); 
		int g_no = Integer.parseInt(req.getParameter("g_no"));
		
		List<OrdersSetVo> orderList = dao.viewList(tblNo, g_no);
		
		mv.addObject("orderList", orderList);
		mv.setViewName("modal_show_order_list");
		
		return mv;
	}
}
