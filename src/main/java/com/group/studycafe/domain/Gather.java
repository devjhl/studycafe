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
    @Column(updatable = false)
    private LocalDateTime date;
    private String status; // 모집중 , 모집완료

    public String getFormattedCreateDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return this.date.format(formatter);
    }
}
