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
		String om = "여기가 메뉴 메인";
		System.out.println(om);
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
	
	@RequestMapping(value = "/add_list.ord")
	public ModelAndView orderMenu(HttpServletRequest req, int menu_no) {
		ModelAndView mv = new ModelAndView();
		menu_no = Integer.parseInt(req.getParameter("menu_no"));
		System.out.println("메뉴 번호야: " + menu_no);
		
		MenuVo vo = dao.addList(menu_no);
		mv.addObject("vo", vo);
		mv.setViewName("right_order");
		return mv;
	}
}
