package com.sp.app.domain.member;

public class Notification {
	private Long notificationId;
	private Long memberId;
	private int type;
	private String message;
	private String regDate;
	private boolean isRead;
	private String parameter1;
	private String parameter2;
	private String parameter3;

	

	
	@Override
	public String toString() {
		return "Notification [notificationId=" + notificationId + ", memberId=" + memberId + ", type=" + type
				+ ", message=" + message + ", regDate=" + regDate + ", isRead=" + isRead + ", parameter1=" + parameter1
				+ ", parameter2=" + parameter2 + ", parameter3=" + parameter3 + "]";
	}
	public Long getNotificationId() {
		return notificationId;
	}
	public void setNotificationId(Long notificationId) {
		this.notificationId = notificationId;
	}
	public Long getMemberId() {
		return memberId;
	}
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public boolean isRead() {
		return isRead;
	}
	public void setRead(boolean isRead) {
		this.isRead = isRead;
	}
	public String getParameter1() {
		return parameter1;
	}
	public void setParameter1(String parameter1) {
		this.parameter1 = parameter1;
	}
	public String getParameter2() {
		return parameter2;
	}
	public void setParameter2(String parameter2) {
		this.parameter2 = parameter2;
	}
	public String getParameter3() {
		return parameter3;
	}
	public void setParameter3(String parameter3) {
		this.parameter3 = parameter3;
	}	

	public Notification() {
		
	}

	public Notification(Long memberId, int type, String message, String parameter1, String parameter2, String parameter3) {
		this.memberId = memberId;
		this.type = type;
		this.message = message;
		this.parameter1 = parameter1;
		this.parameter2 = parameter2;
		this.parameter3 = parameter3;
	}

	public Notification(Long notificationId, Long memberId, int type, String message, String parameter1,
	                    String parameter2, String parameter3) {
	
		this.notificationId = notificationId;
		this.memberId = memberId;
		this.type = type;
		this.message = message;
		this.parameter1 = parameter1;
		this.parameter2 = parameter2;
		this.parameter3 = parameter3;
	}
	
	
	public Notification(Long notificationId) {
		this.notificationId = notificationId;
	}

	public Notification(Long memberId, int type, String message, String regDate, boolean isRead, String parameter1, String parameter2, String parameter3) {
		this.memberId = memberId;
		this.type = type;
		this.message = message;
		this.regDate = regDate;
		this.isRead = isRead;
		this.parameter1 = parameter1;
		this.parameter2 = parameter2;
		this.parameter3 = parameter3;


	}
}
