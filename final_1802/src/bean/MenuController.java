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
			System.out.println("실행");
		}
		
		@RequestMapping(value="list.menu")
		public ModelAndView menu_list(HttpServletRequest req) {
			ModelAndView mv = new ModelAndView();
			System.out.println(req.getParameter("menu_type"));
			
			List<MenuVo> list = this.dao.list(req.getParameter("menu_type"));
			mv.addObject("list",list);
			mv.addObject("mt", req.getParameter("menu_type"));
			mv.setViewName("menu_index");
			return mv;
		}
		
/*		@RequestMapping(value="insert.menu")
		public ModelAndView menu_insert(HttpServletRequest req) {
			ModelAndView mv = new ModelAndView();
			String msg = "<script>alert('등록 되셨습니다.')</script>";
			this.vo = this.dao.insert(req);
			mv.addObject("msg", msg);
			mv.setViewName("menu_index");
			return mv;
		}*/
		
		@RequestMapping(value="view.menu")
		public ModelAndView menu_view(HttpServletRequest req) {
			ModelAndView mv = new ModelAndView();
			this.vo = this.dao.view(Integer.parseInt(req.getParameter("menu_no")));
			mv.addObject("vo", this.vo);
			
			mv.setViewName("menu_view");
			return mv;
		}
}