package bean;

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
	public MenuVo addList(int menu_no){
		MenuVo vo = null;
		System.out.println("?????????");
		vo = sqlSession.selectOne("ord.add_order", menu_no);
		System.out.println(vo.menu_name);
		return vo;
	}
}
