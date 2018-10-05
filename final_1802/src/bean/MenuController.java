package bean;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MenuController {
		MenuDao dao;
		MenuVo vo;
		
		public MenuController(MenuDao dao, MenuVo vo) {
			this.dao = dao;
			this.vo = vo;
		}
		
		@RequestMapping(value="/list.menu")
		public ModelAndView menu_list(String str) {
			ModelAndView mv = new ModelAndView();
			
			System.out.println("menu = " + str);
			
			List<MenuVo> list = this.dao.list(str);
			mv.addObject("list",list);
			mv.setViewName("menu_index");
			return mv;
		}
}
