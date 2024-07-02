package com.group.studycafe.controller;

import com.group.studycafe.dto.SignupUserDto;
import com.group.studycafe.service.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@RequiredArgsConstructor
@Controller
public class UserController {

    private final UserService userService;

    @GetMapping("/login")
    public String loginForm(Model model) {
        return "loginForm"; // 로그인 페이지
    }

    @GetMapping("/signup")
    public String signupForm(Model model) {
        return "signupForm"; // 회원가입 페이지
    }

    @PostMapping("/signup")
    public String signup(@Valid SignupUserDto userDto, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            // 바인딩 오류를 모델에 추가
            bindingResult.getFieldErrors().forEach(fieldError ->
                    model.addAttribute(fieldError.getField() + "Error", fieldError.getDefaultMessage())
            );
            model.addAttribute("userDto", userDto);
            return "signupForm";
        }
        userService.save(userDto);
        return "redirect:/login";
    }
}
