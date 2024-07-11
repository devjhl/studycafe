package com.group.studycafe.repository;

import com.group.studycafe.domain.OrderTicketNames;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderTicketRepository extends JpaRepository<OrderTicketNames, Long> {

    @Query("SELECT otn FROM OrderTicketNames otn WHERE otn.order.id = :orderId")
    List<OrderTicketNames> findByOrderId(@Param("orderId") Long orderId);
}
