package bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuctionController {
   AuctionDao dao;
   
   public AuctionController(AuctionDao dao) {
      System.out.println("생성자 입장 ");
      this.dao = dao;
   }
   
   // 
   @RequestMapping(value="auction_list.auc")
   public ModelAndView auctionList(String menu_type) {
      System.out.println("con_list 입장");
      
      ModelAndView mv = new ModelAndView();      
      List<MenuVo> list = dao.list(menu_type);
      
      mv.addObject("list",list);
      mv.addObject("mt",menu_type);
      mv.setViewName("auction/auction_list");
      return mv;
   }
   
   @RequestMapping(value="auction_input.auc")
   public ModelAndView auctionInput(HttpServletRequest req) {
      ModelAndView mv = new ModelAndView();
      System.out.println("con_input 입장");      
      
      String msg = dao.insert(req);
      
      mv.addObject("msg",msg);
      mv.setViewName("auction/auction_list");
      
      return mv;
   }
   
   


} // End of class