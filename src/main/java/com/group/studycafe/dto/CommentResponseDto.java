package com.group.studycafe.dto;

import lombok.Getter;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Getter
public class CommentResponseDto {
    private Long id;
    private String content;
    private String createdDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm"));
    private String username;
    private Long gatherId;

    /* Entity -> Dto*//*
    public CommentResponseDto(Comments comments) {
        this.id = comments.getId();
        this.content = comments.getContent();
        this.createdDate = comments.getCreatedDate();
        this.username = comments.getUser().getUsername();
        this.gatherId = comments.getGather().getId();
    }*/



}