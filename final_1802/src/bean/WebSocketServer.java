package bean;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
/*import org.apache.tomcat.websocket.WsSession;*/

@ServerEndpoint("/client")
public class WebSocketServer {
	
	private static List<Session> clients = Collections.synchronizedList(new ArrayList<Session>());
	
	@OnError
	public void onError(Throwable error) {
		System.out.println(error.toString());
	}
	
	@OnMessage
	public void onMessage(String msg, Session session) throws Exception{
		System.out.println("온메세지");
		String r = "<div class='textBlock col-md-12 col-xs 12'>"
				 + "<div class='receive'>"
				 + "<h6>No. " + session.getId() + "</h6>"
				 + "<div class='chatReceiveBox'>";
		
		System.out.println(session.getId());
		r += msg + "</div></div></div>";
		System.out.println("receive message : " + r);
		for (Session s : clients) {
			System.out.println(s.getId());
			s.getBasicRemote().sendText(r);
		}
		System.out.println("온메세지끝");
	}
	@OnOpen
	public void onOpen(Session s) {
		System.out.println(s.getUserProperties().get("javax.websocket.Endpoint.remoteAddress"));
		System.out.println("session open : " + s.getId());
		clients.add(s);
	}
	@OnClose
	public void onClose(Session s) {
		System.out.println("session close : " + s);
		clients.remove(s);
	}
}

/*public static InetSocketAddress getRemoteAddress(WsSession session) {
    if(session == null){
        return null;
    }

    Async async = session.getAsyncRemote();
    InetSocketAddress addr = (InetSocketAddress) getFieldInstance(async, 
            "base#sos#socketWrapper#socket#sc#remoteAddress");
 
    return addr;
}

private static Object getFieldInstance(Object obj, String fieldPath) {
    String fields[] = fieldPath.split("#");
    for(String field : fields) {
        obj = getField(obj, obj.getClass(), field);
        if(obj == null) {
            return null;
        }
    }

    return obj;
}

private static Object getField(Object obj, Class<?> clazz, String fieldName) {
    for(;clazz != Object.class; clazz = clazz.getSuperclass()) {
        try {
        	Field field;
            field = clazz.getDeclaredField(fieldName);
            field.setAccessible(true);
            return field.get(obj);
        } catch (Exception e) {
        }            
    }
    return null;
}*/