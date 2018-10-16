package bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ModalController {

	public ModalController() {
		
	}
	
	@RequestMapping(value="table_detail.modal")
	public ModelAndView table_detail(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		AdminDao admin_dao = new AdminDao();
		int tbl_no = Integer.parseInt(req.getParameter("tbl_no"));
		int guest_no = Integer.parseInt(req.getParameter("guest_no"));

		List<OrdersSetVo> list_orders = admin_dao.table_detail_list(tbl_no , guest_no);
		mv.addObject("list_orders",list_orders);
		mv.setViewName("admin/table/table_detail");
		return mv;
	}
	

}
