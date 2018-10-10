package bean;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class AdminDao {
	 
	SqlSession s;
	
	public AdminDao() {
		try {
			s =	AdminFactory.getFactory().openSession();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	public List<tblVo> table_select(){
		List<tblVo> list;
		list = s.selectList("adm.select_table");
		return list;
	}
}
