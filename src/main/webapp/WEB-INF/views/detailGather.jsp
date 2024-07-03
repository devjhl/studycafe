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
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<div class="container mt-5">
    <div class="post-header">
        <h1>${gather.title}</h1>
        <p class="text-muted">작성일 ${gather.date.date} <span class="ml-2">조회수 ${gather.views}</span></p>
    </div>
    <div class="post-content">
        <p><strong>${gather.username}</strong></p>
        <pre>
            ${gather.content}
        </pre>
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
                <img src="https://via.placeholder.com/40" class="mr-3 rounded-circle" alt="User Avatar">
                <div class="media-body">
                    <h6 class="mt-0">aaa</h6>
                    댓글 내용이 여기에 표시됩니다.
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
