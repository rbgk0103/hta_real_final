package bean;

import java.util.Date;

public class ChatVo {

	Date chat_date;
	String chat_text;
	String chat_sender;
	String chat_receiver;
	
	public Date getChat_date() {
		return chat_date;
	}
	public void setChat_date(Date chat_date) {
		this.chat_date = chat_date;
	}
	public String getChat_text() {
		return chat_text;
	}
	public void setChat_text(String chat_text) {
		this.chat_text = chat_text;
	}
	public String getChat_sender() {
		return chat_sender;
	}
	public void setChat_sender(String chat_sender) {
		this.chat_sender = chat_sender;
	}
	public String getChat_receiver() {
		return chat_receiver;
	}
	public void setChat_receiver(String chat_receiver) {
		this.chat_receiver = chat_receiver;
	}
}
