package com.group.studycafe.domain;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
public class Seat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private boolean reserved = false;
    private LocalDateTime reservedAt;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
}
