package bean;
// chatHeader에서 tableList Map을 사용해서 리스트 뿌려주기, paging, 클릭 시 chatContent 업데이트
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
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
@ServerEndpoint("/index")
public class IndexWebSocket {
	
	private static Map<String, Session> clients = Collections.synchronizedMap(new HashMap<String, Session>());
	
		/* 클라이언트로부터 메시지가 도착했을 때 */
	@OnMessage	//msg글자 중 첫 번째 자리는 테이블 번호, 마지막 두 자리는 ip주소입니다.
	public void onMessage(String msg, Session session) throws Exception {
		String ipCut = msg.substring(0,2);
		System.out.println("indexWebSocket msg : " + msg);
		System.out.println("ipCut 0, 2: " + ipCut);
		if(ipCut.length() == 3) {
			ipCut = msg.substring(1,3);
			System.out.println("length 3일 때 substring 1, 3 : " + ipCut);
		}
		if(msg.length() == 2 || msg.length() == 3) {
			if(clients.containsKey(ipCut) == false) {
				clients.put(ipCut, session);
				System.out.println("클라이언트는 ? : "  + clients.get(ipCut).getId());
			}
		} else {
			if(clients.containsKey(ipCut) == false ){
				clients.put(ipCut, session);
			}
			Set<String> keySet = clients.keySet();
			for(String key : keySet) {
				if(key.equals(ipCut)) {
					System.out.println("key : " + key);
					System.out.println("msg substring 0 2 : " + ipCut);
					clients.get(key).getBasicRemote().sendText(msg);
					break;
				}
			}
		}
	}
	
	/* 클라이언트에서 서버로 접속할 때*/
	@OnOpen
	public void onOpen(Session s) {
		System.out.println("session //open : " + s);
	}
	
	/* 에러날 때 */
	@OnError
	public void onError(Session session, Throwable throwable) {
		//throwable.printStackTrace();
	}
	
	/* 접속이 끊겼을 때 */
	@OnClose
	public void onClose(Session session) {
		System.out.println("session //close : " + session);
		clients.values().removeAll(Collections.singleton(session));
	}
	
}