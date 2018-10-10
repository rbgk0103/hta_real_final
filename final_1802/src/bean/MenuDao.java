package bean;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;

import java.util.Enumeration;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MenuDao {
	String encType = "utf-8";
	String uploadDir = "C:/Users/JHTA/git/hta_real_final/final_1802/WebContent/admin/menu/menuImg/";
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
		if(menu_type == "") {
			menu_type = "%"+menu_type+"%";
		}
		list = s.selectList("menu.select", menu_type);
		return list;
	}
	
	public MenuVo view(int menu_no) {
		MenuVo vo = new MenuVo();
		vo = s.selectOne("menu.view",menu_no);			
		return vo;
	}
	public String delete(HttpServletRequest req) {
		MenuVo vo = new MenuVo();
		String msg = "";
		int cnt = 0;
		try {
			MultipartRequest multi = new MultipartRequest(req, uploadDir, fileSize, encType,
					new DefaultFileRenamePolicy());
			vo = setVo(multi);
			
			vo = s.selectOne("menu.view",vo.getMenu_no());
			
			File file = new File(uploadDir + vo.getMenu_image());
			file.delete();
			
			cnt = s.delete("menu.delete",vo.getMenu_no());
			
			if(cnt > 0) {
				s.commit();
				msg = "<script>alert('정상적으로 삭제 되었습니다.')</script>";
			}else {
				s.rollback();
				msg = "<script>alert('삭제중 오류 발생.')</script>";
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			msg = "<script>alert('삭제중 오류 발생.')</script>";
		}
		
		return msg;
	}
	
	public String modify(HttpServletRequest req) {
		MenuVo vo = new MenuVo();
		MenuVo v = new MenuVo();
		int cnt = 0;
		String msg = "";
		try {
			MultipartRequest multi = new MultipartRequest(req, uploadDir, fileSize, encType,
					new DefaultFileRenamePolicy());
			vo = setVo(multi);
			v = s.selectOne("menu.view",vo.getMenu_no());
			File file = new File(uploadDir + v.getMenu_image());
			file.delete();
			cnt = s.update("menu.modify",vo);
			if(cnt > 0) {
				s.commit();
				msg = "<script>alert('정상적으로 수정되셨습니다.')</script>";
			}else {
				s.rollback();
				msg = "<script>alert('수정중 오류 발생.')</script>";
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			s.rollback();
			msg = "<script>alert('수정중 오류 발생.')</script>";
		}
		
		return msg;
	}
	
	public String insert(HttpServletRequest req) {
		MenuVo vo = new MenuVo();
		int cnt = 0;
		String msg = "";
		try {
			MultipartRequest multi = new MultipartRequest(req, uploadDir, fileSize, encType,
					new DefaultFileRenamePolicy());
			vo = setVo(multi);
			cnt = s.insert("menu.insert",vo);
			if(cnt > 0) {
				s.commit();
				msg = "<script>alert('정상적으로 등록되셨습니다.')</script>";
			}else {
				s.rollback();
				msg = "<script>alert('등록중 오류 발생.')</script>";
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			msg = "<script>alert('등록중 오류 발생.')</script>";
		}finally {
			return msg;
		}
	}
	
	public String today(HttpServletRequest req) {
		MenuVo vo = new MenuVo();
		int cnt = 0;
		String msg = "";
		try {
			MultipartRequest multi = new MultipartRequest(req, uploadDir, fileSize, encType,
					new DefaultFileRenamePolicy());
			vo = setVo(multi);
			System.out.println("menuNo : " + vo.getMenu_no());
			cnt = s.update("menu.today", vo.getMenu_no());
			if(cnt > 0) {
				s.commit();
				msg = "<script>alert('오늘의메뉴가 등록 되었습니다.')</script>";
			}else {
				s.rollback();
				msg = "<script>alert('등록중 오류 발생.')</script>";
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			msg = "<script>alert('등록중 오류 발생.')</script>";
		}finally {
			return msg;
		}
	}
	public String today_no(HttpServletRequest req) {
		MenuVo vo = new MenuVo();
		int cnt = 0;
		String msg = "";
		try {
			MultipartRequest multi = new MultipartRequest(req, uploadDir, fileSize, encType,
					new DefaultFileRenamePolicy());
			vo = setVo(multi);
			System.out.println("menuNo : " + vo.getMenu_no());
			cnt = s.update("menu.today_no", vo.getMenu_no());
			if(cnt > 0) {
				s.commit();
				msg = "<script>alert('오늘의메뉴가 취소 되었습니다.')</script>";
			}else {
				s.rollback();
				msg = "<script>alert('취소중 오류 발생.')</script>";
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			msg = "<script>alert('취소중 오류 발생.')</script>";
		}finally {
			return msg;
		}
	}
	
	public MenuVo setVo(MultipartRequest multi) {
		MenuVo vo = new MenuVo();
		if(multi.getParameter("menu_no") != null) {
			vo.setMenu_no(Integer.parseInt(multi.getParameter("menu_no")));			
		}
		vo.setMenu_name(multi.getParameter("menu_name"));
		vo.setMenu_price(Integer.parseInt(multi.getParameter("menu_price")));
		vo.setMenu_type(multi.getParameter("menu_type"));
		// 첨부파일
		Enumeration e = multi.getFileNames();
		while(e.hasMoreElements()) {

			String tag = (String)e.nextElement();
			
			String menuImage = multi.getFilesystemName(tag);
			if(menuImage == null) {				
				continue;
			}
			vo.setMenu_image(menuImage);
		}
		return vo;
	}
}
