package com.booking.model;

public class Booking {
    private int id;
    private int userId;
    private int fieldId;
    private String bookingDate;
    private String startTime;
    private String endTime;
    private int hours;
    private double totalCost;
    private String status; 

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    public int getFieldId() { return fieldId; }
    public void setFieldId(int fieldId) { this.fieldId = fieldId; }
    
    public String getBookingDate() { return bookingDate; }
    public void setBookingDate(String bookingDate) { this.bookingDate = bookingDate; }
    
    public String getStartTime() { return startTime; }
    public void setStartTime(String startTime) { this.startTime = startTime; }
    
    public String getEndTime() { return endTime; }
    public void setEndTime(String endTime) { this.endTime = endTime; }
    
    public int getHours() { return hours; }
    public void setHours(int hours) { this.hours = hours; }
    
    public double getTotalCost() { return totalCost; }
    public void setTotalCost(double totalCost) { this.totalCost = totalCost; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}