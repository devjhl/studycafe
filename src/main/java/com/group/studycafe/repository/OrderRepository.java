package com.group.studycafe.repository;

import com.group.studycafe.domain.Order;
import com.group.studycafe.domain.OrderTicketNames;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    List<Order> findAllByUsername(String username);
}
