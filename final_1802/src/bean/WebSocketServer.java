package bean;
// chatHeader에서 tableList Map을 사용해서 리스트 뿌려주기, paging, 클릭 시 chatContent 업데이트
import java.util.Collections;
import java.util.HashSet;
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
	
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	boolean chatSwitch;
	
	@OnMessage	//msg글자 중 첫 번째 자리는 테이블 번호, 마지막 두 자리는 ip주소입니다.
	public void onMessage(String msg, Session session) throws Exception {
		if(msg.length() > 4) {
			for(Session sess : clients) {
				sess.getBasicRemote().sendText(msg);
				System.out.println("msg : " + msg);
			}
		} else {
			System.out.println("msg : " + msg);
		}
	}
	
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session);
	}
	
	@OnClose
	public void onClose(Session session) {
		System.out.println("session close : " + session);
		clients.remove(session);
	}
	
	@OnError
	public void onError(Session session, Throwable throwable) {
		throwable.printStackTrace();
	}
}