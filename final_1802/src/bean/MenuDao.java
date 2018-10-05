package bean;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class MenuDao {
	String encType = "utf-8";
	String uploadDir = "C:/Users/JHTA/eclipse-workspace/1802-spring/WebContent/upload/";
	int fileSize = 1024 * 1024 * 10;
	ParameterBlock pb = null;
	BufferedImage bi = null;
	BufferedImage thumb = null;
	Graphics2D g = null;
	File file = null;
	
	String menuType;
	SqlSession s;
	
	public MenuDao() {

		try {
			s =	FinalFactory.getFactory().openSession();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public List<MenuVo> list(String menu_type){
		List<MenuVo> list;
		list = s.selectList("menu.select", menu_type);
		return list;
	}

}
