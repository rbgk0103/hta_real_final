package bean;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

public class AdminDao {
	 
	SqlSession s;
	String msg;
	public AdminDao() {
		try {
			s =	AdminFactory.getFactory().openSession();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	public List<TblVo> table_select(){
		List<TblVo> list;
		list = s.selectList("adm.select_table");
		return list;
	}
	public List<OrdersSetVo> table_order_select() {
		List<OrdersSetVo> list_orders;
		list_orders = s.selectList("adm.select_orders_table");
		return list_orders;
	}
	
	
	public String set_table_on(HttpServletRequest req) {
		
		int tbl_no = Integer.parseInt(req.getParameter("tbl_no"));
		int cnt = s.update("adm.table_status_on" , tbl_no);
		
		if(cnt > 0) {
			msg = "테이블 테이블 수정완료";
			s.commit();
		}else {
			msg = "테이블 테이블 수정실패";
			s.rollback();
		}
		return msg;
	}
	
	public String set_table_off(HttpServletRequest req) {
		
		int tbl_no = Integer.parseInt(req.getParameter("tbl_no"));
		int cnt = s.update("adm.table_status_off", tbl_no);
		
		if(cnt > 0) {
			msg = "테이블 테이블 수정완료";
			s.commit();
		}else {
			msg = "테이블 테이블 수정실패";
			s.rollback();
		}
		return msg;
	}
	

	public String set_guest(HttpServletRequest req) {
		GuestVo gVo = new GuestVo();
		gVo = guest_setVo(req);
		
		int cnt = s.insert("adm.guest_insert", gVo);
		if(cnt > 0) {
			msg = "게스트 테이블 수정완료";
			s.commit();
		}else {
			msg = "게스트 테이블 수정실패";
			s.rollback();
		}
		return msg;
	}
	
	public GuestVo guest_setVo(HttpServletRequest req) {
		GuestVo gVo = new GuestVo();
		gVo.setTable_no(Integer.parseInt(req.getParameter("tbl_no")));
		gVo.setGuest_gender(req.getParameter("guest_gender"));
		gVo.setGuest_cnt(Integer.parseInt(req.getParameter("guest_cnt")));
		return gVo;
	}


	public String guest_status_update(HttpServletRequest req) {
		int tbl_no = Integer.parseInt(req.getParameter("tbl_no"));
		int guest_no = Integer.parseInt(req.getParameter("guest_no"));
		
		GuestVo gVo = new GuestVo();
		gVo.setGuest_no(guest_no);
		gVo.setTable_no(tbl_no);
		
		int cnt = s.update("adm.guest_status_update", gVo);
		
		if(cnt > 0) {
			msg = "테이블 테이블 수정완료";
			s.commit();
		}else {
			msg = "테이블 테이블 수정실패";
			s.rollback();
		}
		
		
		return msg;
	}









	

	
	
	
}
