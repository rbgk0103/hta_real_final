package bean;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class AdminDao {
	 
	SqlSession s;
	
	public AdminDao() {
		try {
			s =	MenuFactory.getFactory().openSession();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	public List<tblVo> list(){
		List<tblVo> list;
		list = s.selectList("adm.select_table");
		return list;
	}
}
