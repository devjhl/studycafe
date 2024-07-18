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
        .content {
            min-height: 80vh;
            display: flex;
            align-items: flex-start; /* Changed from center to flex-start */
            justify-content: center;
            flex-direction: column;
            padding-bottom: 80px; /* Ensure there's space for footer */
        }
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
        .info-container {
            display: flex;
            flex-direction: column;
            width: 100%;
        }
        .info-section {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
            gap: 10px;
            margin-bottom: 20px;
        }
        .info-card {
            flex: 0 0 200px;
            margin: 10px;
        }
        .section-title {
            margin-top: 30px;
            margin-bottom: 20px;
            border-bottom: 2px solid #dee2e6;
            padding-bottom: 10px;
            font-size: 1.5rem;
            font-weight: bold;
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
                <h1 class="h2">마이페이지</h1>
            </div>
            <div class="content">
                <div class="info-container">
                    <div class="section-title">이용권 정보</div>
                    <div id="reservations-content" class="info-section">
                        <c:forEach var="order" items="${orderList}">
                            <c:if test="${not empty orderTicketNamesMap[order.id]}">
                                <div class="card mb-3 info-card">
                                    <div class="card-header"></div>
                                    <div class="card-body">
                                        <h5 class="card-title"></h5>
                                        <ul>
                                            <c:forEach var="ticket" items="${orderTicketNamesMap[order.id]}">
                                                <c:if test="${not empty ticket.ticketNames}">
                                                    <li>${ticket.ticketNames}</li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="section-title">좌석 내역</div>
                    <div id="seats-content" class="info-section">
                        <c:forEach var="seat" items="${reservedSeats}">
                            <div class="card mb-3 info-card">
                                <div class="card-header">
                                    좌석 위치: ${seat.id}
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
