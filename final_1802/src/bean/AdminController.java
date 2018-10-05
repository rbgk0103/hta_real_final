package bean;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
		AdminDao dao;

		
		public AdminController(AdminDao dao) {
			this.dao = dao;

		}
		
		@RequestMapping(value="/table_status.adm")
		public ModelAndView menu_list(String str) {
			ModelAndView mv = new ModelAndView();
			
			
			
			mv.setViewName("table_status");
			return mv;
		}
}
