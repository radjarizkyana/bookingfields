package com.booking.model;

import com.booking.service.IBookable;

public abstract class Field implements IBookable {

    protected int fieldId;
    protected String name;
    protected double hourlyRate;

    public Field(int fieldId, String name, double hourlyRate) {
        this.fieldId = fieldId;
        this.name = name;
        this.hourlyRate = hourlyRate;
    }

    public int getFieldId() {
        return fieldId;
    }

    public String getName() {
        return name;
    }

    public double getHourlyRate() {
        return hourlyRate;
    }

    @Override
    public double calculateCost(int hours) {
        return hourlyRate * hours;
    }

    public abstract String getFieldType();
}
