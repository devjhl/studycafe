<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스터디 모집</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        .search-bar {
            margin-bottom: 20px;
        }
        .search-bar input {
            width: calc(100% - 100px);
        }
        .search-bar button {
            width: 100px;
        }
        .study-card {
            border: 1px solid #e0e0e0;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
        }
        .study-card .badge {
            margin-right: 5px;
        }
        .study-card .footer {
            display: flex;
            justify-content: space-between;
        }
    </style>

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<div class="container mt-5">
    <nav class="nav nav-tabs">
        <a class="nav-item nav-link active" href="#">전체</a>
        <a class="nav-item nav-link" href="#">모집중</a>
        <a class="nav-item nav-link" href="#">모집완료</a>
    </nav>
    <div class="container mt-5">
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="관심 스터디를 검색해보세요!">
            <div class="input-group-append">
                <button class="btn btn-success" type="button">검색</button>
            </div>
        </div>
    </div>
    <div class="btn-group mb-3" role="group" aria-label="Sorting buttons">
        <button type="button" class="btn btn-outline-secondary">최신순</button>
        <button type="button" class="btn btn-outline-secondary">정확도순</button>
        <button type="button" class="btn btn-outline-secondary">댓글많은순</button>
        <button type="button" class="btn btn-outline-secondary">좋아요순</button>
    </div>
    <button class="btn btn-primary float-right mb-3" onclick="location.href='/gather/write'">글쓰기</button>
    <div class="clearfix"></div>

    <div class="study-card">
        <div class="d-flex justify-content-between">
            <h5 class="card-title">
                <span class="badge badge-success">모집중</span>
                CKA 스터디 모집합니다.
            </h5>
            <small class="text-muted">6시간 전</small>
        </div>
        <p class="card-text">자격증 준비 스터디</p>
        <div>
            <span class="badge badge-primary">ABC</span>
            <span class="badge badge-primary">자격증</span>
        </div>
        <div class="footer mt-3">
            <div>
                <span class="mr-2"><i class="fas fa-heart"></i> 10</span>
                <span class="mr-2"><i class="fas fa-comment"></i> 5</span>
                <span><i class="fas fa-eye"></i> 61</span>
            </div>
        </div>
    </div>

    <div class="study-card">
        <div class="d-flex justify-content-between">
            <h5 class="card-title">
                <span class="badge badge-success">모집중</span>
                같이 7월 목표 100% 달성해요!
            </h5>
            <small class="text-muted">17시간 전</small>
        </div>
        <p class="card-text">안녕하세요!</p>
        <div>
            <span class="badge badge-primary">목표달성</span>
            <span class="badge badge-primary">커뮤니티</span>
        </div>
        <div class="footer mt-3">
            <div>
                <span class="mr-2"><i class="fas fa-heart"></i> 20</span>
                <span class="mr-2"><i class="fas fa-comment"></i> 15</span>
                <span><i class="fas fa-eye"></i> 219</span>
            </div>

        </div>
    </div>

    <div class="study-card">
        <div class="d-flex justify-content-between">
            <h5 class="card-title">
                <span class="badge badge-success">모집중</span>
                개발과외 모집
            </h5>
            <small class="text-muted">20시간 전</small>
        </div>
        <p class="card-text">안녕하세요, 현재 서울에서 풀스택 개발자로 재직중인 개발자입니다.</p>
        <div>
            <span class="badge badge-primary">개발</span>
            <span class="badge badge-primary">과외</span>
        </div>
        <div class="footer mt-3">
            <div>
                <span class="mr-2"><i class="fas fa-heart"></i> 5</span>
                <span class="mr-2"><i class="fas fa-comment"></i> 0</span>
                <span><i class="fas fa-eye"></i> 148</span>
            </div>

        </div>
    </div>

    <div class="study-card">
        <div class="d-flex justify-content-between">
            <h5 class="card-title">
                <span class="badge badge-success">모집중</span>
                강남역 모각코 모집
            </h5>
            <small class="text-muted">23시간 전</small>
        </div>
        <p class="card-text">[개발 스터디 모집 내용 예시] 스터디 주제 : 모각코 예상 스터디 일정</p>
        <div>
            <span class="badge badge-primary">강남</span>
            <span class="badge badge-primary">모각코</span>
            <span class="badge badge-primary">개발</span>
        </div>
        <div class="footer mt-3">
            <div>
                <span class="mr-2"><i class="fas fa-heart"></i> 6</span>
                <span class="mr-2"><i class="fas fa-comment"></i> 1</span>
                <span><i class="fas fa-eye"></i> 184</span>
            </div>
        </div>
    </div>

</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
