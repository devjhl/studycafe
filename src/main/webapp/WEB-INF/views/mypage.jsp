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
                        <a class="nav-link active" href="#">
                            마이페이지 홈
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            개인정보 수정
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            예약 관리
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
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

            <div id="mypage-home">
                <h2>마이페이지 홈</h2>
                <p></p>
            </div>
            <div id="mypage-profile" style="display:none;">
                <h2>개인정보 수정</h2>
                <p></p>
            </div>
            <div id="mypage-reservations" style="display:none;">
                <h2>예약 관리</h2>
                <p></p>
            </div>
            <div id="mypage-posts" style="display:none;">
                <h2>작성글 관리</h2>
                <p></p>
            </div>
        </main>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const links = document.querySelectorAll('.nav-link');
        const sections = {
            '마이페이지 홈': 'mypage-home',
            '개인정보 수정': 'mypage-profile',
            '예약 관리': 'mypage-reservations',
            '작성글 관리': 'mypage-posts'
        };

        links.forEach(link => {
            link.addEventListener('click', function(event) {
                event.preventDefault();
                links.forEach(l => l.classList.remove('active'));
                link.classList.add('active');
                for (let key in sections) {
                    document.getElementById(sections[key]).style.display = 'none';
                }
                document.getElementById(sections[link.textContent.trim()]).style.display = 'block';
            });
        });
    });
</script>
<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>
