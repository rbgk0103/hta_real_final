package bean;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GameController {
	GameDao dao;
	
	public GameController(GameDao dao) {
		this.dao = dao;
	}
	
	// [게임] 처음 진입
	@RequestMapping(value = "/index.game")
	public ModelAndView orderMain(String findStr) {
		ModelAndView mv = new ModelAndView();
		
		String gm = "여기가 게임 index";
		System.out.println(gm);
		
		System.out.println("우리모두 게임하하하");
		
		mv.setViewName("game_index"); // game_index.jsp
		
		return mv;
	}
}
