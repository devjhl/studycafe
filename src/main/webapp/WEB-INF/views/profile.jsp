<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            text-align: center;
            background-color: #f8f9fa;
            padding: 1rem 0;
        }
        .nav-tabs {
            margin-top: 20px;
        }
        .sidebar-sticky {
            position: sticky;
            top: 0;
            height: calc(100vh - 48px);
            padding-top: 0.5rem;
            overflow-x: hidden;
            overflow-y: auto;
        }
        .content {
            margin-top: 20px;
        }
        .form-control {
            max-width: 100%;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        .btn-primary {
            width: 100%;
            max-width: 100%;
        }
        .invalid-feedback {
            color: red;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<div class="container-fluid">
    <div class="row">
        <nav class="col-md-3 col-lg-2 d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="/mypage/profile">
                            개인정보 수정
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/mypage/reservations">
                            이용권/좌석 정보
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/mypage/gathers">
                            작성글 관리
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">개인정보수정</h1>
            </div>

            <div class="content">
                <div class="row">
                    <div class="col-md-6">
                        <div class="signup-form">
                            <h3></h3>
                            <form id="profileForm" action="${pageContext.request.contextPath}/mypage/profile" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="password">비밀번호</label>
                                    <input type="password" class="form-control <c:if test="${not empty passwordError}">is-invalid</c:if>" id="password" name="password" placeholder="비밀번호를 입력해주세요" minlength="8" maxlength="20" required>
                                    <div class="invalid-feedback">
                                        <c:out value="${passwordError}" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email">이메일</label>
                                    <input type="email" class="form-control <c:if test="${not empty emailError}">is-invalid</c:if>" id="email" name="email" placeholder="이메일을 입력해주세요" minlength="5" maxlength="50" value="${user.email}" required>
                                    <div class="invalid-feedback">
                                        <c:out value="${emailError}" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="phone">전화번호</label>
                                    <input type="text" class="form-control <c:if test="${not empty phoneError}">is-invalid</c:if>" id="phone" name="phone" placeholder="전화번호를 입력해주세요" minlength="10" maxlength="11" value="${user.phone}" required>
                                    <div class="invalid-feedback">
                                        <c:out value="${phoneError}" />
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary">수정</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>
