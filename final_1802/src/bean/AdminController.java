package bean;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
		AdminDao dao;
		
		public AdminController(AdminDao dao) {
			this.dao = dao;
			System.out.println("dao들옴?");

		}
		@RequestMapping(value="table_status.adm")
		public ModelAndView table_status() {
			ModelAndView mv = new ModelAndView();
			
			List<tblVo> list = this.dao.list();
			
			System.out.println("들어온거맞냐 ㅡㅡ");
			mv.addObject("list",list);
			mv.setViewName("table/sfs");
			
			
			return mv;
		}
}
