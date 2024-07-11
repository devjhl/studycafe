package com.group.studycafe.service;

import com.group.studycafe.domain.OrderTicketNames;
import com.group.studycafe.repository.OrderTicketRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class OrderTicketNamesService {

    private final OrderTicketRepository orderTicketRepository;

    public List<OrderTicketNames> findOrderTicketsByOrderId(Long orderId) {
        return orderTicketRepository.findByOrderId(orderId);
    }
}
