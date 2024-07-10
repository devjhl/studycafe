package com.group.studycafe.controller;

import com.group.studycafe.config.UserInfo;
import com.group.studycafe.dto.CommentDto;
import com.group.studycafe.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/gather")
public class CommentApiController {
    @Autowired
    private CommentService commentService;

    // 1. 댓글 조회
    @GetMapping("/{gatherId}/comments")
    public ResponseEntity<List<CommentDto>> comments(@PathVariable Long gatherId) {
        List<CommentDto> dtos = commentService.comments(gatherId);
        return ResponseEntity.status(HttpStatus.OK).body(dtos);
    }

    @PostMapping("/{gatherId}/comments")
    public ResponseEntity<CommentDto> create(@PathVariable Long gatherId, @RequestBody CommentDto dto) {
        // 요청이 제대로 들어오는지 확인
        System.out.println("Received comment: " + dto); // 로그 추가

        // 로그인한 사용자 정보 가져오기
        //String loginUsername = UserInfo.getCurrentUsername();
        //dto.setUsername(loginUsername); // username 설정
        //dto.setGatherId(gatherId); // gatherId 설정

        // 서비스에 위임
        CommentDto createdDto = commentService.create(gatherId, dto);

        // 결과 응답
        return ResponseEntity.status(HttpStatus.OK).body(createdDto);
    }





    // 3. 댓글 수정
    @PatchMapping("/comments/{id}")
    public ResponseEntity<CommentDto> update(@PathVariable Long id, @RequestBody CommentDto dto) {
        // 서비스에 위임
        CommentDto updatedDto = commentService.update(id, dto);
        // 결과 응답
        return ResponseEntity.status(HttpStatus.OK).body(updatedDto);
    }

    // 4. 댓글 삭제
    @DeleteMapping("/comments/{id}")
    public ResponseEntity<CommentDto> delete(@PathVariable Long id) {
        CommentDto deleteDto = commentService.delete(id);
        return ResponseEntity.status(HttpStatus.OK).body(deleteDto);
    }
}
