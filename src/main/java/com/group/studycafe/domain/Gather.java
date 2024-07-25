package com.group.studycafe.domain;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Table(name = "gather")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Gather {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String content;
    private String username;
    private int views;
    private int likes; // 좋아요 수
    private String status;
    private int commentCount;

    @Temporal(TemporalType.TIMESTAMP)
    private Date date;

    @Transient
    private boolean userHasLiked; // 좋아요 여부

    @PrePersist
    protected void onCreate() {
        date = new Date();
    }
}
