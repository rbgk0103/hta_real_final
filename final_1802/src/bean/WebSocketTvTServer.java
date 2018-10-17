package bean;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/gameBroadcasting")
public class WebSocketTvTServer {

	/* 필드 */
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	/* 메서드들*/
	@OnMessage
	public void onMessage(String msg, Session session) throws Exception {
		System.out.println("receive message : " + msg);
		
		for (Session s : clients) {
			s.getBasicRemote().sendText(msg);
		}
	}

	@OnOpen
	public void onOpen(Session s) {
		System.out.println("session open : " + s);
		clients.add(s);
	}

	@OnClose
	public void onClose(Session s) {
		System.out.println("session close : " + s);
		clients.remove(s);
	}
	
}	// End of Class