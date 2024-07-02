<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>로그인</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .login-container {
            max-width: 400px;
            margin: 0 auto;
            padding-top: 50px;
        }
        .login-form {
            padding: 20px;
            background: #f7f7f7;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px #0000001f;
        }
        .login-form h3 {
            text-align: center;
            margin-bottom: 20px;
        }
        .login-form .form-group {
            margin-bottom: 15px;
        }
        .login-form .btn {
            width: 100%;
        }
        .login-form .signup-link {
            text-align: center;
            display: block;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<div class="login-container">
    <div class="login-form">
        <h3>로그인</h3>
        <!-- 에러 메시지 표시 -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                    ${errorMessage}
            </div>
        </c:if>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label for="username">아이디</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="아이디를 입력하세요" required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
            </div>
            <button type="submit" class="btn btn-primary">로그인</button>
            <a href="${pageContext.request.contextPath}/signup" class="signup-link">회원가입</a>
        </form>
    </div>
</div>

<%--<jsp:include page="/WEB-INF/views/footer.jsp" />--%>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>