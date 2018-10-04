package bean;

import org.apache.ibatis.session.SqlSession;

public class MembersDao {
	
	SignCodeVo svo;
	MembersVo mvo;
	PageCompute page;
	
	SqlSession s;
	
	public MembersDao(SignCodeVo svo, MembersVo mvo, PageCompute page) {
		this.svo = svo;
		this.mvo = mvo;
		this.page = page;
		
		
	}

}
