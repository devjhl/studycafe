package com.group.studycafe.domain;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

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
    private int likes;
    private String status; // 모집중 , 모집완료
    private int commentCount; // 댓글수

    @Temporal(TemporalType.TIMESTAMP)
    private Date date;

    @PrePersist
    protected void onCreate() {
        date = new Date();
    }
}
