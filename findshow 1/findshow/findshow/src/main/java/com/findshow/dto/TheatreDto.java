package com.findshow.dto;


import java.util.List;

import com.findshow.dto.ScreenDto;  // Assuming ScreenDto is in a different package

public class TheatreDto {

    private String theatreName;
    private String theatreLocation;
    private int noOfScreens;
    private List<ScreenDto> screens;

    // Default constructor
    public TheatreDto() {}

    // Constructor with parameters
    public TheatreDto(String theatreName, String theatreLocation, int noOfScreens, List<ScreenDto> screens) {
        this.theatreName = theatreName;
        this.theatreLocation = theatreLocation;
        this.noOfScreens = noOfScreens;
        this.screens = screens;
    }

    // Getters and Setters

    public String getTheatreName() {
        return theatreName;
    }

    public void setTheatreName(String theatreName) {
        this.theatreName = theatreName;
    }

    public String getTheatreLocation() {
        return theatreLocation;
    }

    public void setTheatreLocation(String theatreLocation) {
        this.theatreLocation = theatreLocation;
    }

    public int getNoOfScreens() {
        return noOfScreens;
    }

    public void setNoOfScreens(int noOfScreens) {
        this.noOfScreens = noOfScreens;
    }

    public List<ScreenDto> getScreens() {
        return screens;
    }

    public void setScreens(List<ScreenDto> screens) {
        this.screens = screens;
    }
}
