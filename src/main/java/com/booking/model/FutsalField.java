package com.booking.model;

public class FutsalField extends Field {

    public FutsalField(int id, String name, double rate) {
        super(id, name, rate);
    }

    @Override
    public String getFieldType() {
        return "Futsal";
    }
}
