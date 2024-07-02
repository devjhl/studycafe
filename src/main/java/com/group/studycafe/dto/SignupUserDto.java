package com.group.studycafe.dto;

import jakarta.validation.constraints.*;
import lombok.Data;

@Data
public class SignupUserDto {
    @NotEmpty(message = "아이디를 입력해주세요")
    @Size(min = 5, max = 13, message = "아이디는 5자에서 13자 사이여야 합니다.")
    private String username;

    @NotEmpty(message = "비밀번호를 입력해주세요")
    @Size(min = 8, max = 20, message = "비밀번호는 8자에서 20자 사이여야 합니다.")
    private String password;

    @NotEmpty(message = "이메일을 입력해주세요")
    @Email(message = "유효한 이메일 주소를 입력해주세요")
    @Size(min = 5, max = 50, message = "이메일은 5자에서 50자 사이여야 합니다.")
    private String email;

    @NotEmpty(message = "핸드폰 번호를 입력해주세요")
    @Pattern(regexp = "^[0-9]{10,11}$", message = "핸드폰 번호는 10자리 또는 11자리 숫자여야 합니다.")
    private String phone;


}
