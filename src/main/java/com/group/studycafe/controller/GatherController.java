package com.group.studycafe.controller;

import com.group.studycafe.config.UserInfo;
import com.group.studycafe.domain.Comment;
import com.group.studycafe.domain.Gather;
import com.group.studycafe.domain.GatherWithCommentCount;
import com.group.studycafe.domain.Status;
import com.group.studycafe.dto.CommentDto;
import com.group.studycafe.dto.LikeDto;
import com.group.studycafe.service.CommentService;
import com.group.studycafe.service.GatherService;
import com.group.studycafe.service.LikeService;
import com.group.studycafe.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@RequestMapping("/gather")
@Controller
public class GatherController {

    private final GatherService gatherService;
    private final UserService userService;
    private final CommentService commentService;
    private final LikeService likeService;

    @GetMapping("")
    public String gather(Model model,
                         @RequestParam(defaultValue = "0") int page,
                         @RequestParam(required = false) String keyword,
                         @RequestParam(required = false) String status,
                         @RequestParam(defaultValue = "date") String sort) {
        String loginUsername = UserInfo.getCurrentUsername();

        try {
            Sort sorting = Sort.by(sort.equals("comments") ? "commentCount" : sort).descending();
            Pageable pageable = PageRequest.of(page, 10, sorting);
            Page<Gather> gatherPage;

            if (keyword != null && !keyword.isEmpty()) {
                if (status != null && !status.isEmpty()) {
                    gatherPage = gatherService.searchGathersByStatus(keyword, status, pageable);
                } else {
                    gatherPage = gatherService.searchGathers(keyword, pageable);
                }
                model.addAttribute("keyword", keyword);
            } else {
                if (status != null && !status.isEmpty()) {
                    gatherPage = gatherService.findByStatus(status, pageable);
                } else {
                    gatherPage = gatherService.findAll(pageable);
                }
            }

            List<GatherWithCommentCount> gatherWithCommentCounts = gatherPage.getContent().stream()
                    .map(gather -> {
                        Long commentCount = commentService.countCommentsByGatherId(gather.getId());
                        return new GatherWithCommentCount(gather, commentCount);
                    })
                    .collect(Collectors.toList());

            if (sort.equals("comments")) {
                gatherWithCommentCounts.sort((g1, g2) -> g2.getCommentCount().compareTo(g1.getCommentCount()));
            }

            model.addAttribute("loginUsername", loginUsername);
            model.addAttribute("gatherList", gatherWithCommentCounts);
            model.addAttribute("user", loginUsername);
            model.addAttribute("totalPages", gatherPage.getTotalPages());
            model.addAttribute("currentPage", page);
            model.addAttribute("status", status);
            model.addAttribute("sort", sort);
            return "list";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "An error occurred while fetching the data.");
            return "error"; // 에러 페이지로 리다이렉트
        }
    }

    @GetMapping("/{id}")
    public String detailGather(@PathVariable Long id, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "5") int size, Model model) {
        Gather gather = gatherService.findById(id);
        Page<Comment> commentPage = commentService.getCommentsByGatherId(id, PageRequest.of(page, size));

        // 현재 로그인된 사용자 정보 가져오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentUsername = null;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            currentUsername = ((UserDetails) authentication.getPrincipal()).getUsername();
        }

        boolean userHasLiked = false;
        if (currentUsername != null) {
            userHasLiked = likeService.userHasLiked(id, currentUsername);
        }

        gather.setUserHasLiked(userHasLiked);
        model.addAttribute("gather", gather);
        model.addAttribute("comments", commentPage.getContent());
        model.addAttribute("username", currentUsername);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", commentPage.getTotalPages());

        return "detailGather";
    }


    @PostMapping("/api/likeGather")
    public ResponseEntity<String> likeGather(@RequestBody LikeDto likeDto) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentUsername = ((UserDetails) authentication.getPrincipal()).getUsername();
        likeService.likeGather(likeDto.getGatherId(), currentUsername);
        return ResponseEntity.ok("success");
    }

    @GetMapping("/write")
    public String write() {
        return "writeGather";
    }

    @PostMapping("/write")
    public String writeGather(@ModelAttribute Gather gather, Model model) {
        String loginUsername = UserInfo.getCurrentUsername();

        gather.setUsername(loginUsername);
        gather.setStatus(String.valueOf(Status.모집중));
        gatherService.save(gather);
        model.addAttribute("gather", gather);
        return "redirect:/gather";
    }

    @GetMapping("/updateGather/{id}")
    public String updateGather(@PathVariable Long id, Model model) {
        Gather gather = gatherService.findById(id);
        model.addAttribute("gather", gather);
        return "updateGather";
    }
}
