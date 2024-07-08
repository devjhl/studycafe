package com.group.studycafe.controller;

import com.group.studycafe.dto.PaymentCheckRequest;
import com.group.studycafe.dto.PaymentCheckResponse;
import com.group.studycafe.service.BootpayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/api/v1/bootpay")
public class BootpayController {

    @Autowired
    private BootpayService bootpayService;

    @PostMapping("/check")
    public ResponseEntity<PaymentCheckResponse> checkPayment(@RequestBody PaymentCheckRequest request) {
        PaymentCheckResponse response = bootpayService.checkPayment(request.getReceiptId());
        return ResponseEntity.ok(response);
    }
}
