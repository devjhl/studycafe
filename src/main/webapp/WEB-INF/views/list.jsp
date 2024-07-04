<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .container {
            flex: 1;
        }
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
            transition: background-color 0.3s;
            cursor: pointer;
        }
        .study-card:hover {
            background-color: #f0f0f0;
        }
        .study-card .badge {
            margin-right: 5px;
        }
        .study-card .footer {
            display: flex;
            justify-content: space-between;
        }
        .footer {
            background-color: #f8f9fa;
            padding: 20px;
            text-align: center;
            margin-top: auto;
        }
        .pagination {
            justify-content: center;
        }
    </style>
    <script>
        function goToDetail(id) {
            location.href = '${pageContext.request.contextPath}/gather/' + id;
        }
    </script>
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
        <form action="/gather" method="get" class="input-group mb-3">
            <input type="text" class="form-control" name="keyword" placeholder="관심 스터디를 검색해보세요!" value="${keyword}">
            <div class="input-group-append">
                <button class="btn btn-success" type="submit">검색</button>
            </div>
        </form>
    </div>
    <div class="btn-group mb-3" role="group" aria-label="Sorting buttons">
        <button type="button" class="btn btn-outline-secondary">최신순</button>
        <button type="button" class="btn btn-outline-secondary">정확도순</button>
        <button type="button" class="btn btn-outline-secondary">댓글많은순</button>
        <button type="button" class="btn btn-outline-secondary">좋아요순</button>
    </div>
    <c:if test="${loginUsername != null}">
    <button class="btn btn-primary float-right mb-3" onclick="location.href='/gather/write'">글쓰기</button>
    </c:if>
    <div class="clearfix"></div>
    <c:forEach var="gather" items="${gatherList}">
        <div class="study-card" onclick="goToDetail(${gather.id})">
            <div class="d-flex justify-content-between">
                <h5 class="card-title">
                    <span class="badge badge-success">${gather.status}</span>
                        ${gather.title}
                </h5>
                <small class="text-muted"><strong>${gather.username}</strong> <fmt:formatDate value="${gather.date}" pattern="yyyy-MM-dd HH:mm:ss"/></small>
            </div>
            <p class="card-text">${gather.content}</p>
            <div class="footer mt-3">
                <div>
                    <span class="mr-2"><i class="fas fa-heart"></i> ${gather.likes}</span>
                    <span class="mr-2"><i class="fas fa-comment"></i> 0</span>
                    <span><i class="fas fa-eye"></i> ${gather.views}</span>
                </div>
            </div>
        </div>
    </c:forEach>
    <nav>
        <ul class="pagination">
            <!-- 이전 페이지 버튼 수정 -->
            <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                <a class="page-link" href="${pageContext.request.contextPath}/gather?page=${currentPage - 1}&keyword=${keyword}">이전</a>
            </li>
            <!-- 페이지 번호 버튼 수정 -->
            <c:forEach var="i" begin="1" end="${totalPages}">
                <li class="page-item ${currentPage + 1 == i ? 'active' : ''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/gather?page=${i - 1}&keyword=${keyword}">${i}</a>
                </li>
            </c:forEach>
            <!-- 다음 페이지 버튼 수정 -->
            <li class="page-item ${currentPage + 1 >= totalPages ? 'disabled' : ''}">
                <a class="page-link" href="${pageContext.request.contextPath}/gather?page=${currentPage + 1}&keyword=${keyword}">다음</a>
            </li>
        </ul>
    </nav>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>
