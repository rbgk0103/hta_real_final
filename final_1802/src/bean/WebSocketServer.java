package bean;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@ServerEndpoint("/broadcasting")
public class WebSocketServer {
	
	ChatDao dao;
	private static Map<String, String> ipAddress = new HashMap<String, String>();
	private static Map<String, Session> clients = new HashMap<String, Session>();
	
	public WebSocketServer(ChatDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="/getIp.chat")
	public ModelAndView onOpen(String ip) {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("컨트롤러 ip : " + ip);
		modelAndView.addObject("ip", ip);
		modelAndView.setViewName("client");
		return modelAndView;
	}
	
	@OnMessage
	public void onMessage(String msg, Session session) throws Exception {
		System.out.println("receive message : " + msg);
		for (String key : clients.keySet()) {
			clients.get(key).getBasicRemote().sendText(msg);
		}
	}
	
	@OnOpen
	public void onOpen(Session s) {
		System.out.println("session open : " + s);
		clients.put("", s);
	}
	
	@OnClose
	public void onClose(Session s) {
		System.out.println("session close : " + s);
		clients.remove("");
	}
}