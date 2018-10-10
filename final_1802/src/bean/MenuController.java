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
		
		@RequestMapping(value="list.menu")
		public ModelAndView menu_list(String menu_type) {
			ModelAndView mv = new ModelAndView();
			List<MenuVo> list = this.dao.list(menu_type);
			
			mv.addObject("list",list);
			mv.addObject("mt", menu_type);
			mv.setViewName("menu_index");
			return mv;
		}
		
		@RequestMapping(value="view.menu")
		public ModelAndView menu_view(HttpServletRequest req) {
			ModelAndView mv = new ModelAndView();
			this.vo = this.dao.view(Integer.parseInt(req.getParameter("menu_no")));
			mv.addObject("vo", this.vo);
			
			mv.setViewName("menu_view");
			return mv;
		}
		
		@RequestMapping(value="insert.menu")
		public ModelAndView menu_insert(HttpServletRequest req) {
			ModelAndView mv = new ModelAndView();
			String msg = "";
			msg = this.dao.insert(req);
			
			mv.addObject("msg", msg);
			mv.setViewName("menu_index");
			return mv;
		}
		
		@RequestMapping(value="modify.menu")
		public ModelAndView menu_modify(HttpServletRequest req) {
			ModelAndView mv = new ModelAndView();
			String msg = "";
			msg = this.dao.modify(req);
			
			mv.addObject("msg", msg);
			mv.setViewName("menu_index");
			return mv;
		}
		
		@RequestMapping(value="delete.menu")
		public ModelAndView menu_delete(HttpServletRequest req) {
			ModelAndView mv = new ModelAndView();
			System.out.println("delete 진입");
			String msg = "";
			msg = this.dao.delete(req);
			System.out.println(msg);
			mv.addObject("msg", msg);
			mv.setViewName("menu_index");
			return mv;
		}
		
}