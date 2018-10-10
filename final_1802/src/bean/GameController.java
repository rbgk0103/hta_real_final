package bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GameController {
	/* 필드 */
	GameDao dao;
	
	/* 생성자 */
	public GameController(GameDao dao) {
		this.dao = dao;
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
		
		mv.setViewName("game_title_list"); // game_index.jsp
		
		return mv;
	}
}
