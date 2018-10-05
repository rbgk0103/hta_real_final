package bean;

import java.util.List;

import javax.swing.text.AbstractDocument.Content;

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
		
		String om = "여기가 메뉴 메인";
		System.out.println(om);
		List<MenuVo> list = dao.menuSelect(findStr);
		System.out.println("우리모두 하하하");
		
		mv.setViewName("order_menu");
		return mv;
	}
}
