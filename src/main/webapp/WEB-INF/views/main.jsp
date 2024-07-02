<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스터디 카페 & 스터디 모임 게시판</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .header {
            background-color: #f8f9fa;
            padding: 20px;
        }
        .main-banner img {
            width: 100%;
            height: auto;
        }
        .section-title {
            margin-top: 30px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
        }
        .card {
            margin-bottom: 20px;
        }
        .footer {
            background-color: #f8f9fa;
            padding: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="#">Study Cafe</a>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#reservation">예약하기</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#study">스터디</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#study-recruitment">모집게시판</a>
                </li>
                <c:choose>
                    <c:when test="${isLogin}">
                        <a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/login">로그인</a>
                        </li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container">
    <!-- Main Banner -->
    <div id="mainCarousel" class="carousel slide mb-5" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://via.placeholder.com/1200x600" class="d-block w-100" alt="Main Banner 1">
                <div class="carousel-caption d-none d-md-block">
                    <h5>스터디 카페 & 스터디 모임</h5>
                    <p>함께 성장하고 배우는 공간</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://via.placeholder.com/1200x600" class="d-block w-100" alt="Main Banner 2">
                <div class="carousel-caption d-none d-md-block">
                    <h5>스터디 카페 & 스터디 모임</h5>
                    <p>함께 성장하고 배우는 공간</p>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#mainCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#mainCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <!-- Notices and Study Spots -->
    <div class="row mb-5">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">공지사항</div>
                <div class="card-body">
                    <img src="https://via.placeholder.com/500x400" alt="Notices">
                    <p class="card-text mt-2">최신 공지사항을 확인하세요.</p>
                    <a href="#" class="btn btn-primary">더보기</a>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">스터디 지점 안내</div>
                <div class="card-body">
                    <img src="https://via.placeholder.com/500x400" alt="Study Spots">
                    <p class="card-text mt-2">가까운 스터디 지점을 찾아보세요.</p>
                    <a href="#" class="btn btn-primary">더보기</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Study Recruitment -->
    <div class="card mb-5">
        <div class="card-header">스터디 모집 공고</div>
        <div class="card-body">
            <div id="recruitCarousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="card">
                            <img src="https://via.placeholder.com/600x400" alt="Recruitment 1">
                            <div class="card-body">
                                <h5 class="card-title">자바 코딩테스트 준비</h5>
                                <p class="card-text">모집중 3/10명</p>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card">
                            <img src="https://via.placeholder.com/600x400" alt="Recruitment 2">
                            <div class="card-body">
                                <h5 class="card-title">파이썬 데이터 분석</h5>
                                <p class="card-text">모집중 5/10명</p>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#recruitCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#recruitCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>

    <!-- Event Section -->
    <div class="card mb-5">
        <div class="card-header">이벤트</div>
        <div class="card-body">
            <div id="eventCarousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="card">
                            <img src="https://via.placeholder.com/600x400" alt="Event 1">
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card">
                            <img src="https://via.placeholder.com/600x400" alt="Event 2">
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#eventCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#eventCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <span>스터디 카페 & 스터디 모임 게시판 &copy; 2024</span>
    </div>
</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
