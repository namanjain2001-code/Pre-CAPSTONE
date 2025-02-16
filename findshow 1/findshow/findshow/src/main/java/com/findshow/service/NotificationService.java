package com.findshow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.findshow.model.Notification;
import com.findshow.repository.NotificationRepository;

@Service
public class NotificationService {
	
	
	private Notification notification = new Notification();
	@Autowired
    private NotificationRepository notificationRepository;
	
	public Notification loginNotification(String name) {
		notification.setTitle("You've Successfully Logged In!");
		notification.setMessage("Hello "+name+", you’ve just logged in to FINDSHOW! We’re happy to see you back. Dive right in and continue exploring movies and shows that match your taste. Enjoy your time with us!");
		
		return notification;
	}
	
	public Notification welcomeNotification(String name) {
		notification.setTitle("Welcome to FINDSHOW!");
		notification.setMessage("Hey "+name+", welcome to FINDSHOW! We're thrilled to have you join our community. Explore the latest movies, enjoy personalized recommendations, and stay up to date with all your favorite shows. Get ready to embark on a cinematic journey!");
		
		return notification;
	}
	
	public Notification tickitConfirmNotification(String name,String title, String Date, String Time, String location) {
		notification.setTitle("Your Movie Ticket is Confirmed!");
		notification.setMessage("Great news, "+name+" ! Your ticket for "+title+" on "+Date+" at "+Time+" is confirmed. Don’t forget to arrive at "+location+" ahead of time to catch all the action. We can't wait to see you there!");
		
		return notification;
	}
	
	public Notification reminderNotification(String name, String title, String time) {
		notification.setTitle("Your Movie is About to Begin!");
		notification.setMessage("Hi [User's Name], just a friendly reminder! [Movie Title] is starting soon at [Time]. Make sure you're ready to enjoy the show. Grab your snacks, sit back, and enjoy the movie magic!");
		
		return notification;
	}
	
	
	public Notification cancellationNotifications() {
		notification.setTitle("Movie Show Cancelled");
		notification.setMessage("We're sorry, [User's Name], but unfortunately, [Movie Title] scheduled for [Date] at [Time] has been cancelled. We understand this is disappointing, and we're working to reschedule the show. Please check your email for further details.");
		
		return notification;
	}
	
	public Notification refundNotification() {
		notification.setTitle("Refund Processed for Your Movie Ticket");
		notification.setMessage("Hi [User's Name], we’ve processed your refund for the movie [Movie Title]. The amount of [Amount] will be credited to your account shortly. We apologize for any inconvenience and hope to see you at another show soon!");
		
		return notification;
	}
	
	public List<Notification> getNotificationsByUserId(int userId) {
        return notificationRepository.findByUser_UserId(userId);
    }
	
	




}
