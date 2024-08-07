package com.group.studycafe.domain;

import com.group.studycafe.dto.CommentDto;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Entity
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name="gather_id")
    private Gather gather;

    @Column
    private String username;

    @Column
    private String body;

    @Column
    private LocalDateTime createdAt;

    @Transient // 데이터베이스에 저장되지 않음을 명시
    private String formattedCreatedAt;

    public Comment(Gather gather, String username, String body) {
        this.gather = gather;
        this.username = username;
        this.body = body;
        this.createdAt = LocalDateTime.now();
        this.formattedCreatedAt = this.createdAt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public static Comment createComment(CommentDto dto, Gather gather) {
        if (dto.getId() != null)
            throw new IllegalArgumentException("댓글 생성 실패! 댓글의 id가 없어야 합니다.");
        if (dto.getGatherId() != gather.getId())
            throw new IllegalArgumentException("댓글 생성 실패! 게시글의 id가 잘못됐습니다.");
        return new Comment(gather, dto.getUsername(), dto.getBody());
    }

    public void patch(CommentDto dto) {
        if (this.id != dto.getId())
            throw new IllegalArgumentException("댓글 수정 실패! 잘못된 id가 입력됐습니다.");
        if (dto.getUsername() != null)
            this.username = dto.getUsername();
        if (dto.getBody() != null)
            this.body = dto.getBody();
    }

    // getter와 setter 추가
    public String getFormattedCreatedAt() {
        return formattedCreatedAt;
    }

    public void setFormattedCreatedAt(String formattedCreatedAt) {
        this.formattedCreatedAt = formattedCreatedAt;
    }
}
