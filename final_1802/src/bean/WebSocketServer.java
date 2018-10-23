package bean;

import java.util.Collections;
import java.util.HashMap;
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
	
	// 세션 목록 관리, 메세지 보낼 때 사용
	private static Map<String, Session> client = Collections.synchronizedMap(new HashMap<String, Session>());
	
	@OnMessage	//msg글자 중 첫 번째 자리는 보낸 테이블번호, 두 번째는 받는 테이블 번호, 마지막 두 자리는 ip주소입니다.
	public void onMessage(String msg, Session session) throws Exception {
		String senderNo = msg.substring(0, 1);		//보낸 테이블 번호
		String receiverNo = msg.substring(1, 2);	//받는 테이블 번호
		
		if(msg.length() <= 4) {		//jsp에서 onopen으로 메세지 보낸 사람의 정보만 보낼 때
			if(client.containsKey(senderNo) == false) {	//보낸 테이블 가 session map에 없을 경우
				client.put(senderNo, session);	//세션 추가
			}
		} else {	//정보만 보낸 게 아닌 메세지를 함께 보냈을 경우
			Set<String> clientKeySet = client.keySet();	//페이지가 켜져있는 테이블 번호 목록
			if(receiverNo.equals("a")) {	//받는 테이블 번호가 전체일 경우
				for(String key : clientKeySet) {	//페이지가 켜져있는 모든 테이블에 반복
					client.get(key).getBasicRemote().sendText(msg);	//세션 하나씩 메세지를 전송
				}
			} else {	//받는 테이블 번호가 a가 아닌 숫자일 경우(1:1 채팅)
				if(client.get(receiverNo) != null) {	//받는 테이블이 페이지에 접속한 경우
					client.get(senderNo).getBasicRemote().sendText(msg);	//보낸 테이블의 웹페이지에 전송	
					client.get(receiverNo).getBasicRemote().sendText(msg);	//받는 테이블의 웹페이지에 전송
				} else {	//받는 테이블이 접속하지 않은 경우
					client.get(senderNo).getBasicRemote().sendText(msg);	//보낸 테이블의 웹페이지에만 전송
				}
			}
		}
	}
	
	@OnOpen
	public void onOpen(Session session) {	//클라이언트(Session)가 서버에 접속이 성공한 경우
	}
	
	@OnClose
	public void onClose(Session session) {	//세션이 종료된 경우
		client.values().removeAll(Collections.singleton(session));	//접속한 세션 map 목록에서 삭제
	}
	
	@OnError
	public void onError(Session session, Throwable throwable) {	//웹소켓 오류가 있을 경우
		throwable.printStackTrace();	//콘솔에 출력
	}
}