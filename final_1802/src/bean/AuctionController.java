package bean;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuctionController {
	AuctionDao dao;
	
	public AuctionController(AuctionDao dao) {
		this.dao = dao;
		System.out.println("실행");
	}
	
	
	@RequestMapping(value="auction_list.auc")
	public ModelAndView auction_list() {
		ModelAndView mv = new ModelAndView();
		System.out.println("제발");
		List<AuctionVo> list = dao.list();
		mv.addObject("list",list);
		mv.addObject("dao",dao);
		
		mv.setViewName("auction/auction_list");
		return mv;
	}
} // End of class