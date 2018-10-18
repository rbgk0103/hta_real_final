package bean;
// chatHeader에서 tableList Map을 사용해서 리스트 뿌려주기, paging, 클릭 시 chatContent 업데이트
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;

@Controller
@ServerEndpoint("/broadcasting")
public class WebSocketServer {
	
	//private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	private static Map<String, Session> client = Collections.synchronizedMap(new HashMap<String, Session>());
	
	@OnMessage	//msg글자 중 첫 번째 자리는 테이블 번호, 마지막 두 자리는 ip주소입니다.
	public void onMessage(String msg, Session session) throws Exception {
		String senderNo = msg.substring(0, 1);
		String receiverNo = msg.substring(1, 2);
		//여기를 어떻게 해결해야 메세지를 상대방과 제대로 주고받을 수 있습니다. 쿼리는 문제 없음. ㄹㅇ
		if(msg.length() <= 4) {
			client.put(senderNo, session);
			System.out.println(senderNo + ", " + session + "들어왓다~");
		} else {
			Set<String> clientKeySet = client.keySet();
			if(receiverNo == "a") {
				for(String key : clientKeySet) {
					client.get(key).getBasicRemote().sendText(msg);
				}
				System.out.println("전체채팅 보냄~");
			} else {
				if(client.get(receiverNo) != null) {
					client.get(senderNo).getBasicRemote().sendText(msg);
					client.get(receiverNo).getBasicRemote().sendText(msg);
					System.out.println("접속사람에게 1대1 채팅 보냄~");
				}
			}
		}
		
		/*if(msg.length() > 4) {
			for(Session sess : clients) {
				sess.getBasicRemote().sendText(msg);
				System.out.println("msg : " + msg);
			}
		} else {
			System.out.println("msg : " + msg);
		}*/
	}
	
	@OnOpen
	public void onOpen(Session session) {
		//clients.add(session);
	}
	
	@OnClose
	public void onClose(Session session) {
		System.out.println("session close : " + session);
		//clients.remove(session);
		client.values().removeAll(Collections.singleton(session));
	}
	
	@OnError
	public void onError(Session session, Throwable throwable) {
		throwable.printStackTrace();
	}
}