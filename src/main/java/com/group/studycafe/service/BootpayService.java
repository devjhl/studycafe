package com.group.studycafe.service;

import com.group.studycafe.dto.PaymentCheckResponse;
import org.springframework.stereotype.Service;

@Service
public class BootpayService {

    public PaymentCheckResponse checkPayment(String receiptId) {
        // 부트페이 API와 통신하여 결제 정보를 확인합니다.
        // 이 부분은 실제 부트페이 API 문서를 참고하여 구현합니다.

        // 예제 응답 데이터
        PaymentCheckResponse response = new PaymentCheckResponse();
        response.setCode(0);  // 정상 처리된 경우 0
        response.setMessage("결제가 정상적으로 처리되었습니다.");
        return response;
    }
}
