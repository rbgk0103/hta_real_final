package bean;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TablesController {
		TablesDao dao;

		
		public TablesController(TablesDao dao) {
			this.dao = dao;

		}
		
		@RequestMapping(value="/list.tbl")
		public ModelAndView menu_list(String str) {
			ModelAndView mv = new ModelAndView();
			
			
			
			mv.setViewName("admin_index");
			return mv;
		}
}
