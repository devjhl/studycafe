package com.group.studycafe.dto;

public class PaymentCheckResponse {
    private int code;
    private String message;

    // getter와 setter
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
