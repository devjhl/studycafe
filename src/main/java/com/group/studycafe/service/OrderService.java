package com.group.studycafe.service;

import com.group.studycafe.domain.Order;
import com.group.studycafe.repository.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class OrderService {

    private final OrderRepository orderRepository;

    public Order saveOrder(Order order) {
        return orderRepository.save(order);
    }

    // 사용자명으로 모든 주문을 찾아 리스트로 반환합니다.
    public List<Order> findOrdersByUsername(String username) {
        List<Order> orders = orderRepository.findAllByUsername(username);
        return orders;
    }

    public Order findOrderById(Long id) {
        return orderRepository.findById(id).orElse(null);
    }

    public Order findById(Long orderId) {
        Order order = orderRepository.findById(orderId).orElse(null);
        return order;
    }
}
