package bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GameController {
	/* 필드 */
	GTDao gtDao;
	GEDao geDao;
	
	/* 생성자 */
	public GameController(GTDao gtDao, GEDao geDao) {
		this.gtDao = gtDao;
		this.geDao = geDao;
	}
	
	// [게임] 처음 진입
	@RequestMapping(value = "/index.game")
	public ModelAndView gameIndex(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String gm = "여기가 게임 index";
		System.out.println(gm);
		
		String page ="game";
		
		mv.addObject("page", page);
		mv.setViewName("game_index"); // game_index.jsp
		return mv;
	}
	
	// [게임타이틀 목록] 
	@RequestMapping(value = "/game_title_list.game")
	public ModelAndView gameTitleList(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String gm = "여기가 게임 타이틀리스트";
		System.out.println(gm);
		
		List<GTVo> gtList = gtDao.gtSelect(req);
		
		System.out.println("gtList.size(): " + gtList.size());
		
		mv.addObject("gtList", gtList);
		mv.setViewName("game_title_list"); // game_index.jsp
		
		return mv;
	}
	
	// [대전을대전을 위한 테이블목록] 
	@RequestMapping(value = "/tbl_list.game")
	public ModelAndView tblList(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String gm = "여기가 테이블목록";
		System.out.println(gm);
		
		List<TblVo> tblList = gtDao.tblSelect(req);
		
		System.out.println("tblList.size(): " + tblList.size());
		
		mv.addObject("tblList", tblList);
		mv.setViewName("tbl_list"); // tbl_list.jsp
		
		return mv;
	}
	
	// [tvtReady] 
	@RequestMapping(value = "/tvt_ready.game")
	public ModelAndView tvtReady(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		int tbl_i = -1;		// 내 테이블 번호
		int tbl_u = -1;		// 상대 테이블 번호
		
		if (req.getParameter("tbl_i") != null) {
			tbl_i = Integer.parseInt(req.getParameter("tbl_i"));
		}
		
		if (req.getParameter("tbl_u") != null) {
			tbl_u = Integer.parseInt(req.getParameter("tbl_u"));
		}
		
		GTVo gtVo = gtDao.gtSelectOne(req);
		MenuVo menuVo = gtDao.menuSelectOne(req);
		
		
		mv.addObject("tbl_i", tbl_i);
		mv.addObject("tbl_u", tbl_u);
		
		mv.addObject("gtVo", gtVo);
		mv.addObject("menuVo", menuVo);
		
		
		mv.setViewName("tvt_ready"); // tbl_list.jsp
		
		return mv;
	}
	
	// [tvtPlay] 
	@RequestMapping(value = "/tvtPlay.game")
	public ModelAndView tvtPlay(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String tvtAcceptMsg = req.getParameter("tvtAcceptMsg");
		
		
		mv.addObject("tvtAcceptMsg", tvtAcceptMsg);
		
		mv.setViewName("tvt_play"); // tvt_play.jsp
		
		return mv;
	}
	
	// [tvtPlay2] 
	@RequestMapping(value = "/tvtPlay2.game")
	public ModelAndView tvtPlay2(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String tvtAcceptMsg = req.getParameter("tvtAcceptMsg");
		
		
		mv.addObject("tvtAcceptMsg", tvtAcceptMsg);
		mv.setViewName("tvt_play2"); // tvt_play2.jsp
		
		return mv;
	}
}
