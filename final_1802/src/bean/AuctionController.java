package bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpOutputMessage;
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
   
   //관리자 list
   @RequestMapping(value="auction_list.auc")
   public ModelAndView auctionList() {
      ModelAndView mv = new ModelAndView();      
      List<AuctionVo> list = dao.list();
      mv.addObject("auctionList",list);
      mv.setViewName("auction/auction_list");
      return mv;
   }
   
   //관리자 history
   @RequestMapping(value="auction_history.auc")
   public ModelAndView auctionHistory() {
      System.out.println("con_history 입장");
      
      ModelAndView mv = new ModelAndView();      
      List<AuctionVo> list = dao.list();
      
      mv.addObject("auctionList",list);
      mv.setViewName("auction/auction_history");
      return mv;
   }
   
   //관리자 list
   @RequestMapping(value="auction_start.auc")
   public ModelAndView auctionStart(HttpServletRequest req) {
      ModelAndView mv = new ModelAndView();      
      int b_no = Integer.parseInt(req.getParameter("bb_ no"));
      String msg = dao.auc_start(Integer.parseInt(req.getParameter("ae_no")));
      
      mv.addObject("b_no",b_no);
      mv.addObject("msg",msg);
      mv.setViewName("auction/auction_gong");
      return mv;
   }
   
//   @RequestMapping(value="auction_client.auc")
//   public ModelAndView auctionClient() {
//      System.out.println("con_client 입장");
//      
//      ModelAndView mv = new ModelAndView();      
//      List<AuctionVo> list = dao.list();
//      
//      mv.addObject("list",list);
//      mv.setViewName("auction/auctionClient");
//      return mv;
//   }
   
   //관리자 insert
   @RequestMapping(value="auction_input.auc")
   public ModelAndView auctionInput(HttpServletRequest req) {
      ModelAndView mv = new ModelAndView();
      System.out.println("con_input 입장");      
      
      String msg = dao.insert(req);
      
      mv.addObject("msg",msg);
      mv.setViewName("auction/auction_gong");
      
      return mv;
   } 
    //관리자 view
    @RequestMapping(value="auction_view.auc")
    public ModelAndView auctionView(HttpServletRequest req) {
       
       ModelAndView mv = new ModelAndView();
       System.out.println("con_view 입장");
       AuctionVo vo = dao.view(Integer.parseInt(req.getParameter("ae_no")));
       
       mv.addObject("vo",vo);
       mv.setViewName("auction/auction_view");
      
       return mv;
    }
    
    
    //사용자 auction
    @RequestMapping(value="auctiona.auc")
    public ModelAndView auction(HttpServletRequest req) {
       ModelAndView mv = new ModelAndView();
       AuctionVo vo = dao.view(Integer.parseInt(req.getParameter("ae_no")));
       
       mv.addObject("vo",vo);
       mv.setViewName("auction/auction");
       
       return mv;
    }
    
    @RequestMapping(value="auction_confirm.auc")
    public ModelAndView auctionConfirm(HttpServletRequest req) {
       
       ModelAndView mv = new ModelAndView();
       System.out.println("con_confirm 입장");
       System.out.println("? : " + req.getParameter("hh"));

       System.out.println("? : " + Integer.parseInt(req.getParameter("hh")));
       dao.confirm(Integer.parseInt(req.getParameter("hh")));
       System.out.println("con4");

       return mv;
    }
    
    //관리자 delete
    @RequestMapping(value="auction_delete.auc")
    public ModelAndView auctionDelete(HttpServletRequest req) {
       System.out.println("con_del 입장");
       
       ModelAndView mv = new ModelAndView();
       String msg = "";
       
       System.out.println("ae"+Integer.parseInt(req.getParameter("ae_no")));
       
       msg = dao.delete(Integer.parseInt(req.getParameter("ae_no")));
       mv.addObject("msg",msg);
       mv.setViewName("auction/auction_gong");
       
       return mv;
    }
    
    @RequestMapping(value="auctionClient.auc")
    public ModelAndView auctionClient(HttpServletRequest req) {
       System.out.println(req.getParameter("ae_no"));
       System.out.println(req.getParameter("ae_max"));
       System.out.println(req.getParameter("ae_min"));
       System.out.println(req.getParameter("ae_price"));
       ModelAndView mv = new ModelAndView();
       mv.addObject("ae_no",req.getParameter("ae_no"));
       mv.addObject("ae_max",req.getParameter("ae_max"));
       mv.addObject("ae_min",req.getParameter("ae_min"));
       mv.addObject("ae_price",req.getParameter("ae_price"));
       mv.setViewName("auction/auction");
       
       return mv;
    }
    
    //관리자 modify
    @RequestMapping(value="auction_modify.auc")
    public ModelAndView auctionModify(HttpServletRequest req) {
       System.out.println("con_mod 입장");
       
       ModelAndView mv = new ModelAndView();
       String msg = "";
       msg = dao.modify(req);
       
       System.out.println("mo"+Integer.parseInt(req.getParameter("ae_no")));

       mv.addObject("msg",msg);
       mv.setViewName("auction/auction_gong");
      
       return mv;
    }
    
    

} // End of class