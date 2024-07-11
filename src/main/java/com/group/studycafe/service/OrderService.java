package com.group.studycafe.service;

import com.group.studycafe.domain.Order;
import com.group.studycafe.dto.OrderRequest;
import com.group.studycafe.repository.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class OrderService {

    private final OrderRepository orderRepository;

    public Order saveOrder(OrderRequest orderRequest) {
        Order order = orderRequest.toOrder();
        return orderRepository.save(order);
    }

    public Order findOrderById(Long id) {
        return orderRepository.findById(id).orElse(null);
    }
}
