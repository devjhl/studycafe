package com.group.studycafe.domain;

import java.util.List;

public class SeatReservationRequest {
    private List<Long> seatIds;

    // getters and setters
    public List<Long> getSeatIds() {
        return seatIds;
    }

    public void setSeatIds(List<Long> seatIds) {
        this.seatIds = seatIds;
    }
}
