<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 확인</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #f8f9fa;
            padding: 10px 0;
            text-align: center;
        }
        .card-header {
            background-color: #007bff;
            color: white;
        }
        .container {
            margin-top: 20px;
        }
        .card-body p {
            font-size: 1.2em;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h4 class="my-0 font-weight-normal">주문 확인</h4>
                </div>
                <div class="card-body">
                    <p class="text-success">주문이 성공적으로 완료되었습니다.</p>
                    <p><strong>이름:</strong> <span id="username">${order.username}</span></p>
                    <p><strong>이메일:</strong> <span id="email">${order.email}</span></p>
                    <p><strong>전화번호:</strong> <span id="phone">${order.phone}</span></p>
                    <p><strong>이용권:</strong></p>
                    <ul>
                        <c:forEach items="${orderTicketNames}" var="ticket">
                            <li>${ticket.ticketNames}</li>
                        </c:forEach>
                    </ul>
                    <p><strong>총 결제 금액:</strong> <span id="totalPrice">${order.total_price}</span>원</p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <div class="container">
        <span>스터디 카페 & 스터디 모임 게시판 © 2024</span>
    </div>
</div>
</body>
</html>
