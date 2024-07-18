<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
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
        .sidebar-sticky {
            position: sticky;
            top: 0;
            height: calc(100vh - 48px);
            padding-top: 0.5rem;
            overflow-x: hidden;
            overflow-y: auto;
        }
        .content {
            margin-top: 20px;
        }
        .form-control {
            max-width: 100%;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        .btn-primary {
            width: 100%;
            max-width: 100%;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
                            이용권/좌석 정보
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

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">개인정보수정</h1>
            </div>

            <div class="content">
                <div class="row">
                    <div class="col-md-6">
                        <div class="signup-form">
                            <h3></h3>
                            <form id="profileForm" action="${pageContext.request.contextPath}/mypage/profile" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="password">비밀번호</label>
                                    <input type="password" class="form-control ${passwordError != null ? 'is-invalid' : ''}" id="password" name="password" placeholder="비밀번호를 입력해주세요" minlength="8" maxlength="20" required>
                                    <div class="invalid-feedback">
                                        <c:if test="${passwordError != null}">
                                            ${passwordError}
                                        </c:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email">이메일</label>
                                    <input type="email" class="form-control ${emailError != null ? 'is-invalid' : ''}" id="email" name="email" placeholder="이메일을 입력해주세요" minlength="5" maxlength="50" value="${user.email}" required>
                                    <div class="invalid-feedback">
                                        <c:if test="${emailError != null}">
                                            ${emailError}
                                        </c:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="phone">전화번호</label>
                                    <input type="text" class="form-control ${phoneError != null ? 'is-invalid' : ''}" id="phone" name="phone" placeholder="전화번호를 입력해주세요" minlength="10" maxlength="11" value="${user.phone}" required>
                                    <div class="invalid-feedback">
                                        <c:if test="${phoneError != null}">
                                            ${phoneError}
                                        </c:if>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary">수정</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp" />

<script>
    $(document).ready(function() {
        $('#profileForm').on('submit', function(e) {
            e.preventDefault();

            var form = $(this);
            var url = form.attr('action');

            $.ajax({
                type: "POST",
                url: url,
                data: form.serialize(),
                success: function(data) {
                    alert("개인정보가 수정되었습니다.");
                    $('html').html(data);
                },
                error: function() {
                    alert("수정 중 오류가 발생했습니다.");
                }
            });
        });
    });
</script>

</body>
</html>
