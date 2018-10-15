package bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

public class MembersDao {
	
	MembersVo mvo;
	PageCompute page;
	
	SqlSession s;
	
	public MembersDao(MembersVo mvo, PageCompute page) {
		s = MbrFactory.getFactory().openSession();
		this.mvo = mvo;
		this.page = page;
	}
	
	public MembersVo login(String id, String pwd) {
		mvo = null;
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("pwd", pwd);

		int cnt = s.selectOne("mbr.login", params);
		
		if(cnt > 0) {
			mvo = s.selectOne("mbr.findInfo", params);
		}
		return mvo;
	}
	
	public int idCheck(String id) {

		int cnt = s.selectOne("mbr.checkId", id);
		
		return cnt;
	}
	
	public String register(HttpServletRequest req) {
		String msg = "";

		mvo = null;
		
		mvo = setVo(req);
		
		int cnt = s.insert("mbr.insert", mvo);
		
		if(cnt > 0) {
			s.commit();
			msg = "reg_success";
		}else {
			s.rollback();
			msg = "reg_false";
		}
		
		return msg;
	}
	
	public MembersVo findInfo(String name, String phone) {
		mvo = null;
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("name", name);
		params.put("phone", phone);
		
		int cnt = s.selectOne("mbr.checkInfo", params);
		
		if(cnt > 0) {
			mvo = s.selectOne("mbr.findInfo", params);			
		}
		
		return mvo;
	}
	
	public List<MembersVo> list(String findStr){
		
		if(findStr == null) findStr = "";
		
		page.setTotSize(s.selectOne("mbr.listCnt", "%"+findStr+"%"));
		page.pageCompute();
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("findStr", "%"+findStr+"%");
		params.put("startNo", page.getStartNo());
		params.put("endNo", page.getEndNo());
		
		List<MembersVo> list = s.selectList("mbr.list", params);
		
		return list;
	}
	
	public String modify(HttpServletRequest req) {
		String msg = "";

		mvo = null;
		
		mvo = setVo(req);

		int cnt = s.update("mbr.update", mvo);

		
		if(cnt > 0) {
			s.commit();
			msg = "mody_success";
		}else {
			s.rollback();
			msg = "mody_false";
		}
		
		return msg;
	}
	
	public void delete(int mbrNo) {
		
		int cnt = s.delete("mbr.delete", mbrNo);
		
		if(cnt > 0) {
			s.commit();
		}else {
			s.rollback();
		}
		return;
	}
	
	public MembersVo setVo(HttpServletRequest req) {

		mvo = new MembersVo();
		
		if(req.getParameter("mbr_no") != null) {
			mvo.setMbrNo(Integer.parseInt(req.getParameter("mbr_no")));
		}
		
		mvo.setMbrId(req.getParameter("mbr_id"));
		mvo.setMbrName(req.getParameter("mbr_name"));
		mvo.setMbrPhone(req.getParameter("mbr_phone"));
		mvo.setMbrPwd(req.getParameter("mbr_pwd"));
		mvo.setMbrGender(req.getParameter("mbr_gender"));
		mvo.setMbrBirth(req.getParameter("mbr_birth"));
		
		if(req.getParameter("mbr_point") != null) {
			mvo.setMbrPoint(Integer.parseInt(req.getParameter("mbr_point")));
		}
		
		return mvo;
	}

}
