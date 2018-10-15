package bean;

import java.util.Date;

public class TotalChatListVo {
	
	int table_no;
	String guest_gender;
	Date chat_date;
	String chat_sender;
	String chat_text;
	String chat_receiver;
	
	public int getTable_no() {
		return table_no;
	}
	
	public void setTable_no(int table_no) {
		this.table_no = table_no;
	}
	
	public String getGuest_gender() {
		return guest_gender;
	}
	
	public void setGuest_gender(String guest_gender) {
		this.guest_gender = guest_gender;
	}
	
	public Date getChat_date() {
		return chat_date;
	}
	
	public void setChat_date(Date chat_date) {
		this.chat_date = chat_date;
	}
	
	public String getChat_sender() {
		return chat_sender;
	}
	
	public void setChat_sender(String chat_sender) {
		this.chat_sender = chat_sender;
	}
	
	public String getChat_text() {
		return chat_text;
	}
	
	public void setChat_text(String chat_text) {
		this.chat_text = chat_text;
	}
	
	public String getChat_receiver() {
		return chat_receiver;
	}
	
	public void setChat_receiver(String chat_receiver) {
		this.chat_receiver = chat_receiver;
	}
}
