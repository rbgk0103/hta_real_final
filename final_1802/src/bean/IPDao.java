package bean;

import org.apache.ibatis.session.SqlSession;

public class IPDao {
	/* 필드 */
	SqlSession sqlSession;

	/* 생성자 */
	public IPDao() {
		sqlSession = IPFactory.getFatory().openSession();
	}
	
	/* 사용자 정의 메소드들 */
	
	//tblIp를 이용하여, tblNo 얻기
	public String tblNoSelectOne(String tblIp) {

		String tblNo = "-1";
		tblNo = sqlSession.selectOne("ip.getTblNo", tblIp);
		return tblNo;
	}
}
