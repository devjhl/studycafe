package com.group.studycafe.controller;

import com.group.studycafe.domain.User;
import com.group.studycafe.dto.ModifyUserDto;
import com.group.studycafe.service.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequiredArgsConstructor
@RequestMapping("/mypage")
@Controller
public class MypageController {

    private final UserService userService;

    @GetMapping("")
    public String mypage() {
        return "mypage";
    }

    @GetMapping("/posts")
    public String posts() {
        return "posts";
    }

    @GetMapping("/profile")
    public String profile(@AuthenticationPrincipal User user, Model model) {
        ModifyUserDto modifyUserDto = new ModifyUserDto();
        modifyUserDto.setEmail(user.getEmail());
        modifyUserDto.setPhone(user.getPhone());

        model.addAttribute("userDto", modifyUserDto);
        return "profile";
    }

    @PostMapping("/profile")
    public String updateProfile(@Valid ModifyUserDto modifyUserDto, BindingResult bindingResult, @AuthenticationPrincipal User user, Model model, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            bindingResult.getFieldErrors().forEach(fieldError ->
                    model.addAttribute(fieldError.getField() + "Error", fieldError.getDefaultMessage())
            );
            return "profile";
        }

        userService.updateUser(modifyUserDto, user);  //
        redirectAttributes.addFlashAttribute("message", "개인정보가 수정되었습니다.");
        return "redirect:/mypage/profile";
    }

    @GetMapping("/reservations")
    public String reservations() {
        return "reservations";
    }
}
