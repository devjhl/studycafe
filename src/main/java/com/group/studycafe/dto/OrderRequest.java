package com.group.studycafe.dto;

import lombok.Data;

import java.util.Date;

@Data
public class OrderRequest {
    private String username;
    private String email;
    private String phone;
    private int totalPrice;
    private Date createdAt;
}