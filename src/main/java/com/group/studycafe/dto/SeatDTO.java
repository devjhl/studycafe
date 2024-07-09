package com.group.studycafe.dto;

import lombok.Data;

@Data
public class SeatDTO {
    private Long id;
    private boolean reserved;
    private Long userId;

    public SeatDTO(Long id, boolean reserved, Long userId) {
        this.id = id;
        this.reserved = reserved;
        this.userId = userId;
    }

}
