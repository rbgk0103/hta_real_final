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
	
	//tblIp를 이용하여, tblVo 얻기
	public TblVo tblVoSelectOne(String tblIp) {

		TblVo tblVo;
		System.out.println(tblIp);
		tblVo = sqlSession.selectOne("ip.getTblVo", tblIp);
		return tblVo;
	}
}
