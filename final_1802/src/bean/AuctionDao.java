package bean;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

public class AuctionDao {
		
	SqlSession s;
	AuctionVo vo;
	
	public AuctionDao(){
		try {
			s = AuctionFactory.getFactory().openSession();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public String insert(HttpServletRequest req) {
		int cnt = 0;
		String msg = "";
		try {
			cnt = s.insert("auc.insert_list",vo);
			if(cnt > 0 ) {
				msg = "<script>alert('등록완료')</script>";
			}else {
				msg = "<script>alert('등록실패')</script>";
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			msg = "<script>alert('예외발생')</script>";
		}
		
		return msg;
		
	}
}
