<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 상세보기</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 0 15px;
        }
        .post-header {
            border-bottom: 1px solid #e0e0e0;
            margin-bottom: 20px;
            padding-bottom: 10px;
        }
        .post-content {
            margin-bottom: 20px;
        }
        .comment-box {
            margin-top: 20px;
        }
        .footer {
            background-color: #f8f9fa;
            padding: 20px;
            text-align: center;
            margin-top: auto;
            width: 100%;
        }
        .sidebar {
            position: fixed;
            top: 150px; /* 원하는 위치에 맞게 조정 */
            right: calc((100% - 800px) / 2 - 50px); /* 게시글 옆에 위치하도록 조정 */
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
        }
        .sidebar .btn {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
        }
        .btn-status {
            background-color: #ddd;
        }
        .btn-like {
            background-color: #ff6b6b;
            color: white;
        }
        .btn-share {
            background-color: #4caf50;
            color: white;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<div class="container mt-5 content">
    <div>
        <div class="post-header">
            <h1>${gather.title}</h1>
            <p><strong>${gather.username}</strong></p>
            <p class="text-muted">작성일 <fmt:formatDate value="${gather.date}" pattern="yyyy-MM-dd HH:mm:ss"/> <span class="ml-2">조회수 ${gather.views}</span></p>
        </div>
        <div class="post-content">
            <pre>${gather.content}</pre>
        </div>
        <div class="comment-box">
            <h5>댓글</h5>
            <form>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="댓글을 작성해보세요.">
                </div>
                <button type="submit" class="btn btn-primary">댓글 작성</button>
            </form>
            <div class="mt-3">
                <div class="media mb-3">
                    <img src="/img/user.png" class="mr-3 rounded-circle" alt="User Avatar" style="width: 40px;">
                    <div class="media-body">
                        <h6 class="mt-0">aaa</h6>
                        댓글 내용이 여기에 표시됩니다.
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="sidebar">
        <button class="btn btn-status">모집중</button>
        <button class="btn btn-like"><i class="fas fa-heart"></i> 0</button>
        <button class="btn btn-share" id="shareBtn"><i class="fas fa-share-alt"></i> 공유</button>
    </div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script>
    document.getElementById('shareBtn').addEventListener('click', function() {
        const url = window.location.href;
        navigator.clipboard.writeText(url).then(function() {
            alert('현재 페이지 링크가 복사되었습니다.');
        }, function(err) {
            console.error('링크 복사 실패: ', err);
        });
    });
</script>
</body>
</html>
