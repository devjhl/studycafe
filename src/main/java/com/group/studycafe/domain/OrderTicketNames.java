package com.group.studycafe.domain;

import jakarta.persistence.*;
import lombok.Data;
import lombok.ToString;

@Data
@Entity
@Table(name = "order_tickets")
@ToString(exclude = "order")
public class OrderTicketNames {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "order_id", nullable = false)
    private Order order;

    @Column(name = "ticket_names", nullable = false)
    private String ticketNames;
}
