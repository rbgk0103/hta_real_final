package bean;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

public class MembersDao {
	
	SignCodeVo svo;
	MembersVo mvo;
	PageCompute page;
	
	SqlSession s;
	
	public MembersDao(SignCodeVo svo, MembersVo mvo, PageCompute page) {
		s = MbrFactory.getFactory().openSession();
		this.svo = svo;
		this.mvo = mvo;
		this.page = page;
	}
	
	public MembersVo login(String id, String pwd) {
		System.out.println("디에이오 로그인");
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		mvo = null;
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("pwd", pwd);
		System.out.println(params.get("id"));
		System.out.println(params.get("pwd"));

		int cnt = s.selectOne("mbr.login", params);
		System.out.println(cnt);
		
		if(cnt > 0) {
			mvo = s.selectOne("mbr.findInfo", params);
			System.out.println("디에이오 mvo id : " + mvo.getMbrId());
		}
		return mvo;
	}
	
	public String register(HttpServletRequest req) {
		System.out.println("디에이오 레지스터");
		String msg = "";
		mvo = null;
		
		mvo = setVo(req);
		int cnt = s.insert("mbr.insert", mvo);
		
		System.out.println("cnt : " + cnt);
		
		if(cnt > 0) {
			s.commit();
			msg = "insert success";
		}else {
			s.rollback();
			msg = "insert false";
		}
		
		return msg;
	}
	
	public MembersVo findInfo(String name, String phone) {
		System.out.println("디에이오 파인드");
		System.out.println("name : " + name);
		System.out.println("phone : " + phone);
		String msg = "";
		mvo = null;
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("name", name);
		params.put("phone", phone);
		
		System.out.println("map name : " + params.get("name"));
		System.out.println("map phone : " + params.get("phone"));
		
		mvo = s.selectOne("mbr.findInfo", params);
		
		System.out.println("return mybatis id : " + mvo.getMbrId());
		System.out.println("return mybatis pwd : " + mvo.getMbrPwd());
		
		return mvo;
	}
	
	public MembersVo setVo(HttpServletRequest req) {
		System.out.println("디에이오 셋브이오");
		mvo = new MembersVo();
		
		mvo.setMbrId(req.getParameter("mbr_id"));
		mvo.setMbrName(req.getParameter("mbr_name"));
		mvo.setMbrPhone(req.getParameter("mbr_phone"));
		mvo.setMbrPwd(req.getParameter("mbr_pwd"));
		mvo.setMbrGender(req.getParameter("mbr_gender"));
		mvo.setMbrBirth(req.getParameter("mbr_birth"));
		
		return mvo;
	}

}
