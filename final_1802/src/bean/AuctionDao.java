package bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

public class AuctionDao {
		
	SqlSession s;
	
	public AuctionDao(){
		try {
			s = AuctionFactory.getFactory().openSession();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public List<AuctionVo> list(){
		List<AuctionVo> list;
		list = s.selectList("auc.auction_list");
		return list;
	}
	
	

}
