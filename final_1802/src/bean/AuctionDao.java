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
   
   public List<MenuVo> list(String menu_type){
      System.out.println("dao 입장");
      List<MenuVo> list;
      if(menu_type == ""||menu_type == null) {
         menu_type = "%%";
      }
      list = s.selectList("auc.auction_list", menu_type);
      
      return list;
   }
   
   public String insert(HttpServletRequest req) {
	  AuctionVo vo = new AuctionVo();
	  String msg = "";
	  
	  int cnt = 0;
	   
	  // java class 는 " " , ' ' 는 char  
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
   
   
   
   
     

}