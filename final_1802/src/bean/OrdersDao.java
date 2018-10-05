package bean;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class OrdersDao {
	SqlSession sqlSession;
	
	public List<MenuVo> menuSelect(String findStr){
		List<MenuVo> vo = null;
		System.out.println("이거 menu뽑을거야");
		return vo;
	}
}
