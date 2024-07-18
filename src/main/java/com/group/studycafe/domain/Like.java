package com.group.studycafe.domain;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "user_likes")
public class Like {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String username;

    @ManyToOne
    @JoinColumn(name = "gather_id")
    private Gather gather;

    public void setGather(Gather gather) {
        this.gather = gather;
    }
}
