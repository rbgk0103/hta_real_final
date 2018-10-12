package bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
		String nos[] = req.getParameterValues("menu_no");
		String qtys[] = req.getParameterValues("os_qty");
		String prices[] = req.getParameterValues("os_price");
		
		String msg = dao.addList(nos, qtys, prices);
		return mv;
	}
}
