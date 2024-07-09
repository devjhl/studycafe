package com.group.studycafe.dto;

import com.group.studycafe.domain.Gather;
import com.group.studycafe.domain.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommentRequestDto {
    private Long id;
    private String content;
    private String createdDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm"));
    private User user;
    private Gather gather;

    // Dto -> Entity
    /*public Comments toEntity() {
        Comments comments = Comments.builder()
                .id(id)
                .content(content)
                .createdDate(createdDate)
                .user(user)
                .gather(gather)
                .build();
        return comments;
    }*/
}