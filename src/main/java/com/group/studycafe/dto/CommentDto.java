package com.group.studycafe.dto;

import com.group.studycafe.domain.Comment;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CommentDto {
    private Long id;
    private Long gatherId;
    private String username;
    private String body;

    public static CommentDto createCommentDto(Comment comment) {
        return new CommentDto(
                comment.getId(),
                comment.getGather().getId(),
                comment.getUsername(),
                comment.getBody()
        );
    }
}
