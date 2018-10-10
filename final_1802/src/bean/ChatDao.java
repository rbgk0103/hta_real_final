package bean;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class ChatDao {

	SqlSession sqlSession;
	
	public ChatDao() {
		try {
			sqlSession = ChatFactory.getFactory().openSession();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public int getTableNo(String ip) {
		int result = 0;
		System.out.println("ChatDao ip : " + ip);
		if(sqlSession.selectOne("chat_table_no", ip) == null) {
			System.out.println("널임");
		} else {
			result = sqlSession.selectOne("chat.chat_table_no", ip);
		}
		System.out.println("result : " + result);
		return result;
	}
	
	public Map<Integer, String> tableList() {
		Map<Integer, String> tableList = new HashMap<Integer, String>();
		if(sqlSession.selectMap("chat.chat_table_list", "tbl_no") != null) {
			tableList = sqlSession.selectMap("chat.chat_table_list", "tbl_no");
		}
		System.out.println("Map에 잘 들어갔을까요? : " + tableList.get(1));
		return tableList;
	}
}
