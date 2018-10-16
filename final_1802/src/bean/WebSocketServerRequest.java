package bean;
// chatHeader에서 tableList Map을 사용해서 리스트 뿌려주기, paging, 클릭 시 chatContent 업데이트
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

@Controller
@ServerEndpoint("/request")
public class WebSocketServerRequest {
	
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	//키 : 테이블 번호 한 자리 + ip주소 두 자리
	//값 : 세션
	
	
	/* 클라이언트로부터 메시지가 도착했을 때 */
	@OnMessage	//msg글자 중 첫 번째 자리는 테이블 번호, 마지막 두 자리는 ip주소입니다.
	public void onMessage(String msg, Session session) throws Exception {
//		String tableNo = msg.substring(0, 1);
		String ipCut = msg.substring(msg.length()-2, msg.length());
		System.out.println("msg : " + msg);
		
		/* 
		 * onOpen일 때 테이블 번호 한 자리 + ip주소 두 자리를 msg로 보내는데,
		 * msg가 3자리일 경우 메세지를 보내지 않습니다.
		*/
//		if(msg.length() > 3) {
			for(Session sess : clients) {
					sess.getBasicRemote().sendText(msg);
				System.out.println("sess: " + sess.getBasicRemote().hashCode());
			}
//		} 
	}
	
	/* 클라이언트에서 서버로 접속할 때*/
	@OnOpen
	public void onOpen(Session s) {
		clients.add(s);
	}
	
	
	/* 접속이 끊겼을 때 */
	@OnClose
	public void onClose(Session s) {
		System.out.println("session close : " + s);
		clients.remove(s);
	}
}