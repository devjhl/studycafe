package com.group.studycafe.dto;

import com.group.studycafe.domain.Order;
import lombok.Data;

import java.util.Date;
@Data
public class OrderRequest {
    private Long id;
    private String username;
    private String email;
    private String phone;
    private int total_price;
    private String createdAt;

    // Getters and Setters

    public Order toOrder() {
        Order order = new Order();
        order.setId(this.id); // id 설정
        order.setUsername(this.username);
        order.setEmail(this.email);
        order.setPhone(this.phone);
        order.setTotal_price(this.total_price);
        order.setCreatedAt(this.createdAt);
        return order;
    }

    public static OrderRequest fromOrder(Order order) {
        OrderRequest orderRequest = new OrderRequest();
        orderRequest.setId(order.getId());
        orderRequest.setUsername(order.getUsername());
        orderRequest.setEmail(order.getEmail());
        orderRequest.setPhone(order.getPhone());
        orderRequest.setTotal_price(order.getTotal_price());
        orderRequest.setCreatedAt(order.getCreatedAt());
        return orderRequest;
    }
}
