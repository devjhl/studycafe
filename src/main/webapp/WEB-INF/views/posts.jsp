<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .content {
            min-height: 80vh; /* Adjust this value as needed */
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
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
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
                            예약 관리
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/mypage/posts">
                            작성글 관리
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

    </div>
</div>

<script>
</script>
<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>
