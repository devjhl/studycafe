package com.group.studycafe.controller;

import com.group.studycafe.config.UserInfo;
import com.group.studycafe.domain.Gather;
import com.group.studycafe.service.GatherService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RequiredArgsConstructor
@RequestMapping("/gather")
@Controller
public class GatherController {

    private final GatherService gatherService;

    @GetMapping("")
    public String gather(Model model,
                         @RequestParam(defaultValue = "0") int page,
                         @RequestParam(required = false) String keyword) {
        String loginUsername = UserInfo.getCurrentUsername();
        try {
            Pageable pageable = PageRequest.of(page, 10, Sort.by("date").descending());
            Page<Gather> gatherPage;

            if (keyword != null && !keyword.isEmpty()) {
                gatherPage = gatherService.searchGathers(keyword , pageable);
                model.addAttribute("keyword", keyword);
            } else {
                gatherPage = gatherService.findAll(pageable);
            }
            model.addAttribute("gatherList",gatherPage.getContent());
            model.addAttribute("user", loginUsername);
            model.addAttribute("totalPages", gatherPage.getTotalPages());
            model.addAttribute("currentPage", page);
            return "redirect:/gather";
        }catch (Exception e){
            e.printStackTrace();
        }
        return "list";
    }

    @GetMapping("/write")
    public String write() {
        return "writeGather";
    }
}
