package bean;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class OrdersDao {
	SqlSession sqlSession;
	
	public OrdersDao() {
		sqlSession = OrdersFactory.getFatory().openSession();
	}
	public List<MenuVo> menuSelect(String findStr){
		if (findStr == null) {findStr = "grill";}
		
		System.out.println("findStr:" + findStr);
		List<MenuVo> list = sqlSession.selectList("ord.menu_list", findStr);
		System.out.println(list.size());
		return list;
	}
}
