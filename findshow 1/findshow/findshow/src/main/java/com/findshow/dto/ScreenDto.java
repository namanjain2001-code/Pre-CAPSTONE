package com.findshow.dto;

import java.util.List;
import com.findshow.model.Show;
import com.findshow.model.Theatre;
import com.findshow.model.Screen.ScreenType;

public class ScreenDto {

    private int screenId;
    private int screenNumber;
    private int screenCapacity;
    private ScreenType screenType;
    private Theatre theatre;
    private List<ShowDto> shows;

    // Default constructor
    public ScreenDto() {}

    // Constructor with parameters
    public ScreenDto(int screenId, int screenNumber, int screenCapacity, ScreenType screenType, Theatre theatre) {
        this.screenId = screenId;
        this.screenNumber = screenNumber;
        this.screenCapacity = screenCapacity;
        this.screenType = screenType;
        this.theatre = theatre;
    }

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

    public Theatre getTheatre() {
        return theatre;
    }

    public void setTheatre(Theatre theatre) {
        this.theatre = theatre;
    }

    public List<ShowDto> getShows() {
        return shows;
    }

    public void setShows(List<ShowDto> list) {
        this.shows = list;
    }
}
