<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이용권 구매</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
        }
        .text-center i {
            font-size: 24px;
            color: #555;
            margin-right: 8px;
        }
        .ticket-box, .reservation-box {
            width: 300px;
            height: 400px;
            background-color: #f7f7f7;
            border-radius: 20px;
            box-shadow: 0px 0px 10px 0px #0000001f;
            text-decoration: none;
            color: inherit;
        }
        .circle {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 30px 0;
            box-shadow: 0px 0px 10px 0px #0000001f;
        }
        .inner-circle {
            border: 1px solid #000;
            padding: 10px 20px;
            border-radius: 30px;
            font-weight: bold;
        }
        .yellow {
            background-color: #ffd700;
        }
        .blue {
            background-color: #1e90ff;
        }
        .info-area {
            margin-top: 20px;
        }
        footer {
            background-color: #f8f9fa;
            padding: 20px;
            text-align: center;
        }
        nav {
            background-color: #007bff;
        }
        nav .navbar-brand {
            color: #fff;
            font-weight: bold;
        }
        nav .navbar-nav .nav-link {
            color: #fff;
        }

    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />

<main>
    <div class="container">
        <div class="text-center my-5">
            <i class="fas fa-info-circle"></i>
            <span>모든 이용권은 이용권 구매 후 이용가능합니다.</span>
        </div>
        <div class="d-flex justify-content-center">
            <a href="${pageContext.request.contextPath}/reservation/buy" class="ticket-box mx-3 d-flex flex-column align-items-center text-center">
                <div class="circle yellow">
                    <div class="inner-circle">이용권 구매</div>
                </div>
                <div class="info-area">
                    <p>당일이용권(2/3/6시간)</p>
                    <p>기간이용권(2주/4주)</p>
                    <p>시간패키지(30/50/100시간)</p>
                </div>
            </a>
            <a href="${pageContext.request.contextPath}/reservation/book" class="ticket-box mx-3 d-flex flex-column align-items-center text-center">
                <div class="circle blue">
                    <div class="inner-circle">바로 예약</div>
                </div>
                <div class="info-area">
                    <p>구매한 이용권을 이용하여</p>
                    <p>바로 예약을 진행할 수 있습니다.</p>
                </div>
            </a>
        </div>
    </div>
</main>

<%--<jsp:include page="/WEB-INF/views/footer.jsp" />--%>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
