package com.booking.service;

import com.booking.model.*;
import java.util.ArrayList;
import java.util.List;

public class BookingManager {

    private final List<Field> fields;

    public BookingManager() {
        fields = new ArrayList<>();

        fields.add(new FutsalField(1, "Lapangan 1 - Futsal", 150000));
        fields.add(new BadmintonCourt(2, "Lapangan 2 - Badminton", 100000));
        fields.add(new BasketballCourt(3, "Lapangan 3 - Basket", 200000));
    }

    public List<Field> getAllFields() {
        return new ArrayList<>(fields); 
        
    }
    
    public Field getFieldById(int id) {
        for (Field f : fields) {
            if (f.getFieldId() == id) {
                return f;
            }
        }
        return null;
    }
}
