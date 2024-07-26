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
import org.springframework.web.bind.annotation.RequestParam;

@RequiredArgsConstructor
@Controller
public class UserController {

    private final UserService userService;

    @GetMapping("/login")
    public String loginForm(@RequestParam(value = "error", required = false) String error,
                            Model model) {
        if (error != null) {
            model.addAttribute("errorMessage", "아이디 또는 비밀번호가 올바르지 않습니다.");
            System.out.println("에러 메시지 설정됨: 아이디 또는 비밀번호가 올바르지 않습니다.");
        } else {
            System.out.println("에러 메시지 없음");
        }
        return "loginForm"; // 로그인 페이지
    }



    @GetMapping("/signup")
    public String signupForm(Model model) {
        return "signupForm"; // 회원가입 페이지
    }

    @PostMapping("/signup")
    public String signup(@Valid SignupUserDto userDto, BindingResult bindingResult, Model model) {
        boolean hasErrors = false;

        // 아이디 중복 체크
        if (userService.isUsernameTaken(userDto.getUsername())) {
            model.addAttribute("usernameError", "이미 사용 중인 아이디입니다.");
            hasErrors = true;
        }

        // 이메일 중복 체크
        if (userService.isEmailTaken(userDto.getEmail())) {
            model.addAttribute("emailError", "이미 사용 중인 이메일입니다.");
            hasErrors = true;
        }

        // 전화번호 중복 체크
        if (userService.isPhoneTaken(userDto.getPhone())) {
            model.addAttribute("phoneError", "이미 사용 중인 전화번호입니다.");
            hasErrors = true;
        }

        if (bindingResult.hasErrors() || hasErrors) {
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
