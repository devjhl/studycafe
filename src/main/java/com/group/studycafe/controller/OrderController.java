package com.group.studycafe.controller;

import com.group.studycafe.domain.Order;
import com.group.studycafe.dto.OrderRequest;
import com.group.studycafe.repository.OrderRepository;
import com.group.studycafe.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1")
public class OrderController {

    @Autowired
    private OrderRepository orderRepository;

    @PostMapping("/order")
    public ResponseEntity<?> createOrder(@RequestBody OrderRequest orderRequest) {
        try {
            Order order = new Order();
            order.setUsername(orderRequest.getUsername());
            order.setEmail(orderRequest.getEmail());
            order.setPhone(orderRequest.getPhone());
            order.setTotal_price(orderRequest.getTotalPrice());
            order.setCreated_at(orderRequest.getCreatedAt());

            orderRepository.save(order);

            return ResponseEntity.status(HttpStatus.CREATED).body(order);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("주문 저장 중 오류가 발생했습니다.");
        }
    }
}
