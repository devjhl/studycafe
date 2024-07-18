package com.group.studycafe.dto;

import com.group.studycafe.domain.Comment;
import lombok.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@NoArgsConstructor
@Data
public class CommentDto {
    private Long id;
    private Long gatherId;
    private String username;
    private String body;
    private String createdAt;

    public CommentDto(Long id, Long gatherId, String username, String body, String createdAt) {
        this.id = id;
        this.gatherId = gatherId;
        this.username = username;
        this.body = body;
        this.createdAt = createdAt;
    }

    public static CommentDto createCommentDto(Comment comment) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedCreatedAt = comment.getCreatedAt().format(formatter);

        return new CommentDto(
                comment.getId(),
                comment.getGather().getId(),
                comment.getUsername(),
                comment.getBody(),
                formattedCreatedAt
        );
    }
}
