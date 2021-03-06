package bean;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class OrdersDao {
   SqlSession sqlSession;
   
   public OrdersDao() {
      sqlSession = OrdersFactory.getFatory().openSession();
   }
   
   /* 메뉴 조회 */
   public List<MenuVo> menuSelect(String findStr){
      List<MenuVo> list;
      
      if (findStr.equals("snack")) {
         list = sqlSession.selectList("ord.menu_list2");
      } else {
         list = sqlSession.selectList("ord.menu_list", findStr);
      }
      
      System.out.println(list.size());
      return list;
   }
   
   /* 주문 추가할 목록 */
   public String addList(String nos[], String qtys[], String prices[], int tblNo, int g_no){
      ArrayList<ArrayList<String>> stuff = new ArrayList<ArrayList<String>>();
      String msg = "주문이 완료되었습니다.";
      int size = nos.length;
      
      OrdersVo vo = new OrdersVo();
      
      vo.setOrd_tbl_no(tblNo);
      vo.setGuest_no(g_no);
      
      for (int k=0 ; k<size ; k++) {
         
         String[] s = {nos[k], qtys[k], prices[k]};
         stuff.add(new ArrayList<String>(Arrays.asList(s)));
      }
      
      vo.setStuff(stuff);
      
      int cnt = sqlSession.insert("ord.order", vo);
      if (cnt > 0) {
         sqlSession.commit();
      }
      
      return msg;
   }
   
   public List<OrdersSetVo> viewList(int tblNo, int g_no){
      List<OrdersSetVo> list = sqlSession.selectList("ord.view_list", g_no);
      System.out.println(list.get(0).getMenu_name());
      return list;
   }
   
}