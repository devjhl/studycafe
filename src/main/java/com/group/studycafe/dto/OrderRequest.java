package com.group.studycafe.dto;

import com.group.studycafe.domain.Order;
import com.group.studycafe.domain.OrderTicketNames;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class OrderRequest {
    private Long id;
    private String username;
    private String email;
    private String phone;
    private List<String> ticketNames;
    private int total_price;
    private String createdAt;

    // Getters and Setters

    public Order toOrder() {
        Order order = new Order();
        order.setId(this.id);
        order.setUsername(this.username);
        order.setEmail(this.email);
        order.setPhone(this.phone);
        order.setTotal_price(this.total_price);
        order.setCreatedAt(this.createdAt);

        List<OrderTicketNames> orderTickets = new ArrayList<>();
        for (String ticketName : this.ticketNames) {
            OrderTicketNames orderTicket = new OrderTicketNames();
            orderTicket.setOrder(order); // Order 객체 설정
            orderTicket.setTicketNames(ticketName);
            orderTickets.add(orderTicket);
        }
        order.setOrderTickets(orderTickets);
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

        List<String> ticketNames = new ArrayList<>();
        for (OrderTicketNames orderTicket : order.getOrderTickets()) {
            ticketNames.add(orderTicket.getTicketNames());
        }
        orderRequest.setTicketNames(ticketNames);
        return orderRequest;
    }
}
