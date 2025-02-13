package com.findshow.model;

import jakarta.persistence.*;
import java.util.List;

// Screens POJO class

@Entity
@Table(name = "screens")
public class Screen {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "screen_id")
    private int screenId;

    @Column(name = "screen_number")
    private int screenNumber;

    @ManyToOne
    @JoinColumn(name = "theatre_id")
    private Theatre theatre;

    
    @Column(name="screen_capacity")
    private int screenCapacity;
    
    public enum ScreenType {
        IMAX, REGULAR
    }
    @Enumerated(EnumType.STRING)
    @Column(name = "screen_type")
    private ScreenType screenType;




	// Getters and Setters

    public int getScreenId() {
        return screenId;
    }

    public void setScreenId(int screenId) {
        this.screenId = screenId;
    }

    public int getScreenNumber() {
        return screenNumber;
    }

    public void setScreenNumber(int screenNumber) {
        this.screenNumber = screenNumber;
    }

    public Theatre getTheatre() {
        return theatre;
    }

    public void setTheatre(Theatre theatre) {
        this.theatre = theatre;
    }


	public int getScreenCapacity() {
		return screenCapacity;
	}

	public void setScreenCapacity(int screenCapacity) {
		this.screenCapacity = screenCapacity;
	}

	public ScreenType getScreenType() {
		return screenType;
	}

	public void setScreenType(ScreenType screenType) {
		this.screenType = screenType;
	}


}
