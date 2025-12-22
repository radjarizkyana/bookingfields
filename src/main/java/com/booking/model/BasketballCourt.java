package com.booking.model;

public class BasketballCourt extends Field {

    public BasketballCourt(int id, String name, double rate) {
        super(id, name, rate);
    }

    @Override
    public String getFieldType() {
        return "Basketball";
    }
}
