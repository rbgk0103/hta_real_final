package bean;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/Web")
public class WebSocketServerAuc {

   private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());

   @OnMessage // 메세지(입찰)가 보내졌을때 호출되는 이벤트
   public void onMessage(String msg, Session session) throws Exception {
      System.out.println("messag : " + msg);

      String[] Stt = msg.split("/");
      
      for (Session sess : clients) {
         msg = Stt[0] + "/" + Stt[1];
         sess.getBasicRemote().sendText(msg);
         System.out.println("Auc_sess" + sess.getBasicRemote().hashCode());
      }
   }

   @OnOpen // WebSocket이 실행되면 호출되는 이벤트
   public void onOpen(Session session) {
      System.out.println("onpen : " + session);
      clients.add(session);
   }

   @OnClose // WebSocket이 닫혔을때 호출되는 이벤트
   public void onClose(Session session) {
      System.out.println("Auc_close : " + session);
      clients.remove(session);
   }

   @OnError // WebSocket에 에러가 떴을때 호출되는 이벤트
   public void onError(Session session, Throwable throwable) {
      throwable.printStackTrace();
   }

}