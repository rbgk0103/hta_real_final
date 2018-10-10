package bean;

import java.util.HashMap;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;

@Controller
@ServerEndpoint("/broadcasting")
public class WebSocketServer {
	
	// private static Map<아이피, Map<테이블 번호, Session>> map = new HashMap()<>;
	
	private static Map<String, Session> clients = new HashMap<String, Session>();
	private HashMap<Integer, String> tableList;
	@OnMessage
	public void onMessage(String msg, Session session) throws Exception {
		String tableNo = msg.substring(0, 1);
		System.out.println("receive message : " + msg);
		for (String key : clients.keySet()) {
			clients.get(key).getBasicRemote().sendText(msg);
		}
	}
	
	@OnOpen
	public void onOpen(Session s) {
		ChatDao dao = new ChatDao();
		this.tableList = (HashMap<Integer, String>)dao.tableList();
		clients.put("s", s);
	}
	
	@OnClose
	public void onClose(Session s) {
		System.out.println("session close : " + s);
		clients.remove("s");
	}
}