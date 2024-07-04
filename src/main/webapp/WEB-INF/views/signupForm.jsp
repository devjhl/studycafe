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
            display: none;
            color: red;
        }
        .is-invalid + .invalid-feedback {
            display: block;
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
                    <input type="text" class="form-control ${usernameError != null ? 'is-invalid' : ''}" id="username" name="username" placeholder="아이디를 입력해주세요" value="${userDto != null ? userDto.username : ''}" minlength="5" maxlength="13" required>
                    <div class="invalid-feedback">
                        <c:if test="${usernameError != null}">
                            ${usernameError}
                        </c:if>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" class="form-control ${passwordError != null ? 'is-invalid' : ''}" id="password" name="password" placeholder="비밀번호를 입력해주세요" value="${userDto != null ? userDto.password : ''}" minlength="8" maxlength="20" required>
                    <div class="invalid-feedback">
                        <c:if test="${passwordError != null}">
                            ${passwordError}
                        </c:if>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email">이메일</label>
                    <input type="email" class="form-control ${emailError != null ? 'is-invalid' : ''}" id="email" name="email" placeholder="이메일을 입력해주세요" value="${userDto != null ? userDto.email : ''}" minlength="5" maxlength="50" required>
                    <div class="invalid-feedback">
                        <c:if test="${emailError != null}">
                            ${emailError}
                        </c:if>
                    </div>
                </div>
                <div class="form-group">
                    <label for="phone">전화번호</label>
                    <input type="text" class="form-control ${phoneError != null ? 'is-invalid' : ''}" id="phone" name="phone" placeholder="전화번호를 입력해주세요" value="${userDto != null ? userDto.phone : ''}" required>
                    <div class="invalid-feedback">
                        <c:if test="${phoneError != null}">
                            ${phoneError}
                        </c:if>
                    </div>
                </div>
                <div class="form-group">
                    <label for="profile">프로필</label>
                    <input type="file" class="form-control-file" id="profile" name="profile" accept="image/*">
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
