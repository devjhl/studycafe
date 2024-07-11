package com.group.studycafe.dto;

import com.group.studycafe.domain.Order;
import lombok.Data;

import java.util.Date;
@Data
public class OrderRequest {
    private String username;
    private String email;
    private String phone;
    private int total_price;
    private String createdAt;

    // Getters and Setters

    public Order toOrder() {
        Order order = new Order();
        order.setUsername(this.username);
        order.setEmail(this.email);
        order.setPhone(this.phone);
        order.setTotal_price(this.total_price);
        order.setCreatedAt(this.createdAt);
        return order;
    }
}
