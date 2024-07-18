<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 게시글</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        .post-card {
            margin-bottom: 20px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            cursor: pointer;
            transition: box-shadow 0.2s;
        }
        .post-card:hover {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .post-card .card-header {
            font-size: 1.25rem;
            font-weight: bold;
            background-color: #f8f9fa;
            border-bottom: 1px solid #e0e0e0;
            color: #000;
        }
        .post-card .card-body {
            white-space: pre-wrap; /* 줄바꿈 유지 */
            color: #6c757d;
        }
        .post-card .card-footer {
            font-size: 0.875rem;
            color: #6c757d;
            text-align: right;
        }
        .sidebar .nav-link.active {
            font-weight: bold;
            color: #007bff;
        }
        .content {
            min-height: calc(100vh - 56px - 56px); /* Adjust this value as needed */
        }
        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            text-align: center;
            background-color: #f8f9fa;
            padding: 1rem 0;
        }
        main {
            flex: 1 0 auto;
        }
    </style>
</head>
<body class="d-flex flex-column">
<jsp:include page="/WEB-INF/views/header.jsp" />
<div class="container-fluid flex-grow-1">
    <div class="row">
        <nav class="col-md-3 col-lg-2 d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item"><a class="nav-link" href="/mypage/profile">개인정보 수정</a></li>
                    <li class="nav-item"><a class="nav-link" href="/mypage/reservations">이용권/좌석 정보</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/mypage/gathers">작성글 관리</a></li>
                </ul>
            </div>
        </nav>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="content">
                <h1 class="mb-4">내 게시글</h1>
                <div class="btn-group mb-3" role="group" aria-label="Status Filter">
                    <a href="?status=all" class="btn btn-outline-primary ${status == 'all' ? 'active' : ''}">전체</a>
                    <a href="?status=recruiting" class="btn btn-outline-primary ${status == 'recruiting' ? 'active' : ''}">모집중</a>
                    <a href="?status=completed" class="btn btn-outline-primary ${status == 'completed' ? 'active' : ''}">모집완료</a>
                </div>
                <c:forEach items="${gathers}" var="gather"><div class="card post-card" onclick="location.href='/gather/${gather.id}'"><div class="card-header"><c:out value="${gather.title}" /></div><div class="card-body"><c:out value="${gather.content}" /></div><div class="card-footer">작성일: <c:out value="${gather.date}" /></div></div></c:forEach>
                <c:if test="${gathers == null || gathers.isEmpty()}"><div class="card post-card"><div class="card-body text-center">스터디를 모집하고 함께 공부하세요.</div></div></c:if>
            </div>
        </main>
    </div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>
