package bean;

import java.io.IOException;
import java.net.InetAddress;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;

@Controller
@ServerEndpoint("/broadcasting")
public class WebSocketServer {
	
	ChatDao dao;
	private static Set<Session> clients =
			Collections.synchronizedSet(new HashSet<Session>());
	
	public WebSocketServer(ChatDao dao) {
		this.dao = dao;
	}
	
	@OnMessage
	public void onMessage(String msg, Session session) throws Exception {
		System.out.println("receive message : " + msg);
		for (Session s : clients) {
			s.getBasicRemote().sendText(msg);
		}
	}

	@OnOpen
	public void onOpen(Session s) {
		/*try {
			String address = InetAddress.getLocalHost().getHostAddress();
			System.out.println("세션 오픈 : " + address);
		} catch (IOException ex) {
			ex.printStackTrace();
		}*/
		System.out.println("session open : " + s);
		clients.add(s);
	}
	
	@OnClose
	public void onClose(Session s) {
		System.out.println("session close : " + s);
		clients.remove(s);
	}
}
