package bean;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.web.multipart.MultipartRequest;
public class MenuDao {
	String encType = "utf-8";
	String uploadDir = "C:/Users/JHTA/eclipse-workspace/final_1802/WebContent/admin/menu/menuImg/";
	int fileSize = 1024 * 1024 * 10;
	ParameterBlock pb = null;
	BufferedImage bi = null;
	BufferedImage thumb = null;
	Graphics2D g = null;
	File file = null;
	
	SqlSession s;
	
	
	public MenuDao() {

		try {
			s =	MenuFactory.getFactory().openSession();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public List<MenuVo> list(String menu_type){
		List<MenuVo> list;
		list = s.selectList("menu.select", menu_type);
		return list;
	}
	
	public MenuVo view(int menu_no) {
		MenuVo vo = new MenuVo();
		vo = s.selectOne("menu.view",menu_no);			
		return vo;
	}
	
	/*public MenuVo insert(HttpServletRequest req) {
		MenuVo vo = new MenuVo();
		int cnt = 0;
		
		try {
			MultipartRequest multi = new MultipartRequest(req, uploadDir, fileSize, encType,
					new DefaultFileRenamePolicy());
			vo = setVo(multi);
			cnt = s.insert("menu.insert",vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			s.commit();
			return vo;
		}
	}
	
	public MenuVo setVo(MultipartRequest multi) {
		MenuVo vo = new MenuVo();
		vo.setMenu_type(multi.getParameter("menu_type"));
		vo.setMenu_name(multi.getParameter("menu_name"));
		
	}
*/
}
