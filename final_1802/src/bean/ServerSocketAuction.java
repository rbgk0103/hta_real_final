package bean;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/auction")
public class ServerSocketAuction {
	
	private static Map<String, Session> aucClient = Collections.synchronizedMap(new HashMap<String, Session>());
	
	@OnOpen
	public void onOpen(Session session) {
		System.out.println("연결 성고잉ㅁ");
	}
	
	@OnClose
	public void onClose(Session session) {
		System.out.println("연결 실패임");
	}
	
	@OnMessage
	public void onMessage(String msg, Session session) {
		
		String tableNo = msg.substring(0,  1);
		if(msg.length() == 1) {
			aucClient.put(tableNo, session);
		} else {
			try {
				if(tableNo.equals("5")) {
					Set<String> tableList = aucClient.keySet();
					for(String no : tableList) {
						aucClient.get(no).getBasicRemote().sendText(msg);
					}
				} else {
					System.out.println("보낼 새센이 없나봄 ㅋ");
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}
}
