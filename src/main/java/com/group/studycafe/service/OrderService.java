package com.group.studycafe.service;

import com.group.studycafe.domain.Order;
import com.group.studycafe.dto.OrderRequest;
import com.group.studycafe.repository.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class OrderService {

    private final OrderRepository orderRepository;
    private static final Logger logger = LoggerFactory.getLogger(OrderService.class);



    public Order saveOrder(Order order) {
        return orderRepository.save(order);
    }

    public Order findOrderById(Long id) {
        return orderRepository.findById(id).orElse(null);
    }

    public Order findOrderByUsername(String username) {
        return orderRepository.findByUsername(username);
    }

    public Order findById(Long orderId) {
        logger.debug("Finding Order by orderId: {}", orderId);
        Order order = orderRepository.findById(orderId).orElse(null);
        logger.debug("Found Order: {}", order);
        return order;
    }




}
