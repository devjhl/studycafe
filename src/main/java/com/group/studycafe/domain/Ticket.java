package com.group.studycafe.domain;

import lombok.Data;

@Data
public class Ticket {
    private int id;
    private String title;
    private int price;
    private int period;

    public Ticket(int id, String title, int price, int period) {
        this.id = id;
        this.title = title;
        this.price = price;
        this.period = period;
    }
}