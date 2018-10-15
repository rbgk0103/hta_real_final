package bean;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IPController {
	/*필드 */
	IPDao ipDao;
	
	/* 생성자 */
	public IPController(IPDao ipDao) {
		this.ipDao = ipDao;
	}
	
	/* 매핑 메소드들 */
	@RequestMapping(value = "/getIp.ip")
	public ModelAndView orderMain(String findStr) {
		ModelAndView mv = new ModelAndView();
		
		/* 이봉기(게임)가 작성한 부분 */
		// 이 페이지(index.jsp)를 실행한 컴퓨터의 IP 얻어내기
		InetAddress local;
		TblVo tblVo;
		
		try {
			local = InetAddress.getLocalHost();
			String localIp = local.getHostAddress();
			String tblIp = "-1";
			
			// 아이피 끝번호만 얻어내기
			if (localIp.length() == 11) {
				tblIp = localIp.substring(9);	
			}else {
				tblIp = localIp.substring(10);
			}
			
			// 아이피 끝번호를 이용해서 DB(TABLE_STATUS테이블)에서 테이블번호 가져오기
			tblVo = ipDao.tblVoSelectOne(tblIp);
			
			mv.addObject("tblVo", tblVo);
			mv.setViewName("index");
			
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		
		return mv;
	}
	
	
	
}
