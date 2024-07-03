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
    private int likes;
    private Date date;
    private String status; // 모집중 , 모집완료
}
