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
<jsp:include page="/WEB-INF/views/header.jsp" />
<!-- Main Content -->
<div class="container">
    <!-- Main Banner -->
    <div id="mainCarousel" class="carousel slide mb-5" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="${pageContext.request.contextPath}/img/big_banner.png" class="d-block w-100" alt="Main Banner 1">
                <div class="carousel-caption d-none d-md-block">
                    <h5>스터디 카페 & 스터디 모임</h5>
                    <p>함께 성장하고 배우는 공간</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/img/big_banner.png" class="d-block w-100" alt="Main Banner 2">
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
                    <img src="${pageContext.request.contextPath}/img/notice_banner.png" alt="Notices" class="img-fluid">
                    <p class="card-text mt-2">최신 공지사항을 확인하세요.</p>
                    <a href="#" class="btn btn-primary">더보기</a>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">스터디 지점 안내</div>
                <div class="card-body">
                    <img src="${pageContext.request.contextPath}/img/spot.jpg" alt="Study Spots" class="img-fluid">
                    <p class="card-text mt-2">가까운 스터디 지점을 찾아보세요.</p>
                    <a href="#" class="btn btn-primary">더보기</a>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
