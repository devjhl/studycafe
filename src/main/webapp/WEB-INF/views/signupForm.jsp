<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>회원가입</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
        .content {
            display: flex;
            flex-direction: column;
            min-height: 100%;
        }
        .signup-container {
            max-width: 500px;
            margin: auto;
            padding-top: 50px;
            flex-grow: 1;
        }
        .signup-form {
            padding: 40px;
            background: #f7f7f7;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px #0000001f;
        }
        .signup-form h3 {
            text-align: center;
            margin-bottom: 30px;
        }
        .signup-form .form-group {
            margin-bottom: 20px;
        }
        .signup-form .btn {
            width: 100%;
            padding: 10px;
        }
        .invalid-feedback {
            color: red;
            display: block; /* 항상 표시되게 변경 */
        }
        .footer {
            background-color: #f8f9fa;
            padding: 20px;
            text-align: center;
            margin-top: auto;
        }
    </style>
</head>
<body>
<div class="content">
    <jsp:include page="/WEB-INF/views/header.jsp" />
    <div class="signup-container">
        <div class="signup-form">
            <h3>회원가입</h3>
            <form action="${pageContext.request.contextPath}/signup" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="username">아이디</label>
                    <input type="text" class="form-control <c:if test="${not empty usernameError}">is-invalid</c:if>" id="username" name="username" placeholder="아이디를 입력해주세요" value="${userDto != null ? userDto.username : ''}" minlength="5" maxlength="13" required>
                    <div class="invalid-feedback">
                        <c:out value="${usernameError}" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" class="form-control <c:if test="${not empty passwordError}">is-invalid</c:if>" id="password" name="password" placeholder="비밀번호를 입력해주세요" minlength="8" maxlength="20" required>
                    <div class="invalid-feedback">
                        <c:out value="${passwordError}" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="email">이메일</label>
                    <input type="email" class="form-control <c:if test="${not empty emailError}">is-invalid</c:if>" id="email" name="email" placeholder="이메일을 입력해주세요" value="${userDto != null ? userDto.email : ''}" minlength="5" maxlength="50" required>
                    <div class="invalid-feedback">
                        <c:out value="${emailError}" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="phone">전화번호</label>
                    <input type="text" class="form-control <c:if test="${not empty phoneError}">is-invalid</c:if>" id="phone" name="phone" placeholder="전화번호를 입력해주세요" value="${userDto != null ? userDto.phone : ''}" minlength="10" maxlength="11" required>
                    <div class="invalid-feedback">
                        <c:out value="${phoneError}" />
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">가입</button>
            </form>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/footer.jsp" />
</div>
<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
