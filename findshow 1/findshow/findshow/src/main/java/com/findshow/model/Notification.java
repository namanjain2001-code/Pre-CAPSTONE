package com.findshow.model;

import java.time.LocalDate;
import java.time.LocalTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Notification {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer notificationId;
	
	@Column(name = "notification_title", nullable = false)
	private String title;
	
	@Column(name = "notification_message", nullable = false)
	private String message;
	
	@Column(name = "notification_date", nullable = false)
	private LocalDate today; 
	
	@Column(name = "notification_time", nullable = false)
    private LocalTime now;
    
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private Users user;
    
    
    public Notification() {
		today = LocalDate.now();
		now = LocalTime.now();
	}
	
	public Integer getNotificationId() {
		return notificationId;
	}




	public void setNotificationId(Integer notificationId) {
		this.notificationId = notificationId;
	}




	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public LocalDate getToday() {
		return today;
	}

	public void setToday(LocalDate today) {
		this.today = today;
	}

	public LocalTime getNow() {
		return now;
	}

	public void setNow(LocalTime now) {
		this.now = now;
	}


	public Users getUser() {
		return user;
	}


	public void setUser(Users user) {
		this.user = user;
	}
	
	@Override
	public String toString() {
	    return "Notification{" +
	            "id=" + notificationId +
	            ", message='" + message + '\'' +
	            ", date=" + today +
	            '}';
	}

	

	
	
	
	
    
}
