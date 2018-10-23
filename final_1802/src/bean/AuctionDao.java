package bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

public class AuctionDao {
      
   SqlSession s;

   
   public AuctionDao(){
      try {
         s = AuctionFactory.getFactory().openSession();
      }catch(Exception ex) {
         ex.printStackTrace();
      }
   }
   
   //관리자 list
   public List<AuctionVo> list(){
      System.out.println("dao 입장");
      List<AuctionVo> list = s.selectList("auc.auction_list");
      
      return list;
   }
   
   //관리자 insert
   public String insert(HttpServletRequest req) {
     AuctionVo vo = new AuctionVo();
     System.out.println("dao_ins 입장");
     String msg = "";
     
     int cnt = 0;
      
     // java class 는 " " , ' ' 는 char  
        vo.setMenu_no(Integer.parseInt(req.getParameter("menu_no")));
        vo.setAe_price(Integer.parseInt(req.getParameter("ae_price")) / 2); // 5000
        vo.setAe_pct_max(Integer.parseInt(req.getParameter("ae_pct_max")) / 20); // 500
        vo.setAe_pct_min(Integer.parseInt(req.getParameter("ae_pct_min")) / 25); // 400
        
        cnt = s.insert("auc.auction_input",vo);
        System.out.println("cnt : " + cnt);
     if(cnt > 0) {
        msg = "<script>alert('입력 성공')</script>";
        s.commit();
        System.out.println("T");
     }else {
        msg = "<script>alert('입력 실패')</script>";        
        s.rollback();
        System.out.println("F");
     }
     System.out.println(msg);
     return msg;
   }
    
   //관리자 view
   public AuctionVo view(int ae_no) {
      AuctionVo vo = new AuctionVo();
      vo = s.selectOne("auc.view",ae_no);
      return vo;
   }
   
   //사용자 auction
   
   public AuctionVo auction(int ae_no) {
      AuctionVo vo = new AuctionVo();
      vo = s.selectOne("auc.auction",ae_no);
      return vo;
   }
   
   //관리자 경매 start
   public String auc_start(int ae_no) {
      String msg = "";
      int cnt = 0;
      cnt = s.update("auc.start",ae_no);
      if(cnt > 0) {
         s.commit();
         msg = "<script>alert('경매가 진행됩니다.')</script>";
      }else {
         s.rollback();
         msg = "<script>alert('경매중 오류')</script>";
      }
      
      return msg;
   }
   
   public String auc_end(HttpServletRequest req) {
      String msg = "";
      int cnt = 0;
      System.out.println("A : ");
      AuctionVo vo = new AuctionVo();
      System.out.println("cost : " + Integer.parseInt(req.getParameter("pri")));
      System.out.println("ae_no : " + Integer.parseInt(req.getParameter("no")));
      vo.setAe_cost(Integer.parseInt(req.getParameter("pri")));
      vo.setAe_no(Integer.parseInt(req.getParameter("no")));
      cnt = s.update("auc.end", vo);
      if(cnt > 0) {
         System.out.println("B : ");
         s.commit();
      }else {
         s.rollback();
      }
      
      return msg;
   }
   
   //사용자 confirm
   public void confirm(int ae_no) {
      int cnt = 0;
      System.out.println("con1");
      cnt = s.update("auc.auction_confirm", ae_no);
      System.out.println("con2");

      if(cnt > 0) {
         System.out.println("con3");

         s.commit();
      }else {
         s.rollback();
      }
   }
   
   //관리자 delete
   public String delete(int ae_no) {
      String msg = "";
      int cnt = 0;
      
      try {   
        
         cnt = s.delete("auc.delete", ae_no);
         if(cnt > 0) {
            msg = "<script>alert('정상적으로 삭제 되었습니다.')</script>";
            s.commit();
         }else {
            msg = "<script>alert('삭제 실패')</script>";
            s.rollback();
         }
      }catch(Exception ex) {
         ex.printStackTrace();
         msg = "<script>alert('예외 발생')</script>";
      }   
      return msg; 
   }

   //관리자 modify
   public String modify(HttpServletRequest req) {
       AuctionVo vo = new AuctionVo();
       System.out.println("dao_mod 입장");
       String msg = "";
      
       int cnt = 0;
        
       try {
          if (req.getParameter("ae_price") == null ) {
          System.out.println("룰루~~~~~");
          }
          // req.getParameter("get 될 id")
          vo.setAe_no(Integer.parseInt(req.getParameter("ae_no")));
          vo.setAe_price(Integer.parseInt(req.getParameter("price"))); // 5000
          vo.setAe_pct_max(Integer.parseInt(req.getParameter("pct_max"))); // 500
          vo.setAe_pct_min(Integer.parseInt(req.getParameter("pct_min"))); // 400
                
          /*System.out.println("1" + vo.getAe_price());
          System.out.println("2" + vo.getAe_pct_max());
          System.out.println("3" + vo.getAe_pct_min());
          System.out.println("4" + vo.getAe_no());*/
          
          cnt = s.update("auc.modify",vo);
          
          System.out.println("cnt" + cnt);
          
          if(cnt > 0) {
             s.commit();
            msg = "<script>alert('정상적으로 수정되셨습니다.')</script>";
          }else {
             s.rollback();
            msg = "<script>alert('수정중 오류 발생.')</script>";
          }
       }catch(Exception ex) {
          ex.printStackTrace();
         s.rollback();
         msg = "<script>alert('수정중 예외 발생.')</script>";
       }
       return msg;
   }

}