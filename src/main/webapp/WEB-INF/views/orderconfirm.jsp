<%--
  Created by IntelliJ IDEA.
  User: NICOM
  Date: 2024-07-08
  Time: 오후 3:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 확인</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="card">
        <div class="card-header">
            <h4 class="my-0 font-weight-normal">주문 확인</h4>
        </div>
        <div class="card-body">
            <p>주문이 성공적으로 완료되었습니다.</p>
            <p><strong>이름:</strong> <span id="username">{{order.username}}</span></p>
            <p><strong>이메일:</strong> <span id="email">{{order.email}}</span></p>
            <p><strong>주소:</strong> <span id="addr">{{order.addr}}</span></p>
            <p><strong>전화번호:</strong> <span id="phone">{{order.phone}}</span></p>
            <p><strong>총 결제 금액:</strong> <span id="totalPrice">{{order.totalPrice}}</span>원</p>
        </div>
    </div>
</div>
</body>
</html>
