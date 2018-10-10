package bean;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class GTDao {
	/* 필드*/
	SqlSession sqlSession;
	
	// Game 파일업로드처리 변수들 : TODO
	
	
	// 페이징처리를 위한 11개의 변수 (처음 3개는 초기값 지정해주기)
	int listSize = 10;
	int blockSize = 3;
	
	int nowPage = 1;		// 외부에서 주입해줘야 함
	int totSize = 0;		// 외부에서 주입해줘야 함 
	
	int totPage = 0;
	int totBlock = 0;
	int nowBlock = 0;

	int endPage = 0;
	int startPage = 0;
	
	int endNo = 0;						
	int startNo = 0;
	
	// findStr
	String findStr;
	
	/* 생성자 - dao객체 만들자마자 커넥션까지! */
	public GTDao() {
		sqlSession = OrdersFactory.getFatory().openSession();
	}
	
	
	/* 사용자 정의 메소드들 */
	public List<GTVo> gameSelect(String findStr){
		if (findStr == null) {findStr = "";}
		
		System.out.println("findStr:" + findStr);
		
		List<GTVo> gtList = sqlSession.selectList("game.gtList", findStr);
		System.out.println(gtList.size());
		return gtList;
	}
}
