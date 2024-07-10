package com.group.studycafe.domain;

import com.group.studycafe.dto.CommentDto;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

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

    public static Comment createComment(CommentDto dto, Gather gather) {
        // 예외 발생
        if (dto.getId() != null)
            throw new IllegalArgumentException("댓글 생성 실패! 댓글의 id가 없어야 합니다.");
        if (dto.getGatherId() != gather.getId())
            throw new IllegalArgumentException("댓글 생성 실패! 게시글의 id가 잘못됐습니다.");
        // 엔티티 생성 및 반환
        return new Comment(
                dto.getId(),
                gather,
                dto.getUsername(),
                dto.getBody()
        );
    }

    public void patch(CommentDto dto) {
        if(this.id != dto.getId())
            throw new IllegalArgumentException("댓글 수정 실패! 잘못된 id가 입력됐습니다.");
        if (dto.getUsername() != null)
            this.username = dto.getUsername();
        if (dto.getBody() != null)
            this.body = dto.getBody();
    }
}
