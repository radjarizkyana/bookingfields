package com.booking.model;

public class BadmintonCourt extends Field {

    public BadmintonCourt(int id, String name, double rate) {
        super(id, name, rate);
    }

    @Override
    public String getFieldType() {
        return "Badminton";
    }
}
