package bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

public class GTDao {
	/* 필드*/
	SqlSession sqlSession;
	
	// Game 파일업로드처리 변수들 : TODO
	
	
	// 파라미터 변수들
	String findStr;
	int findTblNo;
	
	
	/* 생성자 - dao객체 만들자마자 커넥션까지! */
	public GTDao() {
		sqlSession = GameFactory.getFatory().openSession();
	}
	
	
	/* 사용자 정의 메소드들 */
	
	// 게임타이틀목록 가져오기
	public List<GTVo> gtSelect(HttpServletRequest req){
		findStr = req.getParameter("findStr");
		if (findStr == null) {findStr = "tvt";}
		
		System.out.println("findStr:" + findStr);
		
		List<GTVo> gtList = sqlSession.selectList("game.gtList", findStr);
		System.out.println(gtList.size());
		System.out.println(gtList.get(0).getGtName());
		
		return gtList;
	}
	
	// 테이블목록 가져오기
	public List<TblVo> tblSelect(HttpServletRequest req){
		
		/*if (req.getParameter("tbl_no") == null) {
			findTblNo = 1;
		}else {
			findTblNo = Integer.parseInt(req.getParameter("tbl_no")); 
		}*/
		
		List<TblVo> tblList = sqlSession.selectList("game.tblList");
		
		System.out.println(tblList.size());
		return tblList;
	}
}
