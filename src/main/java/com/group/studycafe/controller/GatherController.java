package com.group.studycafe.controller;

import com.group.studycafe.config.UserInfo;
import com.group.studycafe.domain.Gather;
import com.group.studycafe.domain.Status;
import com.group.studycafe.service.GatherService;
import com.group.studycafe.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@RequestMapping("/gather")
@Controller
public class GatherController {

    private final GatherService gatherService;
    private final UserService userService;

    @GetMapping("")
    public String gather(Model model,
                         @RequestParam(defaultValue = "0") int page,
                         @RequestParam(required = false) String keyword) {
        String loginUsername = UserInfo.getCurrentUsername();

        try {
            Pageable pageable = PageRequest.of(page, 10, Sort.by("date").descending());
            Page<Gather> gatherPage;

            if (keyword != null && !keyword.isEmpty()) {
                gatherPage = gatherService.searchGathers(keyword, pageable);
                model.addAttribute("keyword", keyword);
            } else {
                gatherPage = gatherService.findAll(pageable);
            }
            model.addAttribute("gatherList", gatherPage.getContent());
            model.addAttribute("user", loginUsername);
            model.addAttribute("totalPages", gatherPage.getTotalPages());
            model.addAttribute("currentPage", page);
            return "list";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "An error occurred while fetching the data.");
            return "error"; // 에러 페이지로 리다이렉트
        }
    }
    @GetMapping("/{id}")
    public String detailGather(@PathVariable Long id, Model model) {
        Gather gather = gatherService.findById(id);
        System.out.println("gather: " + gather);
        model.addAttribute("gather", gather);
        return "detailGather";
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

}
