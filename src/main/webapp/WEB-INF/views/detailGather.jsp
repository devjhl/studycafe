<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            top: 150px;
            right: calc((100% - 800px) / 2 - 50px);
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
        .btn-status-complete {
            background-color: #d3d3d3;
            color: #fff;
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
        <c:if test="${username == gather.username}">
            <a class="btn btn-warning btn-edit" href="/gather/updateGather/${gather.id}">수정</a>
        <button class="btn btn-danger btn-delete" id="deleteBtn">삭제</button>
        </c:if>
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
        <c:if test="${username == gather.username}">
            <button class="btn ${gather.status == '모집완료' ? 'btn-status-complete' : 'btn-status'}" id="statusBtn" data-gather-id="${gather.id}">${gather.status}</button>
        </c:if>
        <button class="btn btn-like" id="likeBtn" data-gather-id="${gather.id}"><i class="fas fa-heart"></i> ${gather.likes}</button>
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

    document.addEventListener('DOMContentLoaded', (event) => {
        document.getElementById('deleteBtn').addEventListener('click', () => {
            const gatherId = ${gather.id};

            if (confirm('정말 이 게시글을 삭제하시겠습니까?')) {
                fetch('/api/deleteGather/' + gatherId, {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                    .then(response => {
                        if (response.ok) {
                            alert('게시글이 삭제되었습니다.');
                            window.location.href = '/gather';
                        } else {
                            throw new Error('Network response was not ok.');
                        }
                    })
                    .catch(error => {
                        console.error('There has been a problem with your fetch operation:', error);
                    });
            }
        });
    });


    document.addEventListener('DOMContentLoaded', (event) => {
        document.getElementById('statusBtn').addEventListener('click', () => {
            const gatherId = ${gather.id}
                fetch('/api/updateStatus/' + gatherId, {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                })
                    .then(response => {
                        if (response.ok) {
                            return response.text();
                        } else {
                            throw new Error('Network response was not ok.');
                        }
                    })
                    .then(data => {
                        document.getElementById('statusBtn').classList.remove('btn-status');
                        document.getElementById('statusBtn').classList.add('btn-status-complete');
                        document.getElementById('statusBtn').innerText = '모집완료';
                    })
                    .catch(error => {
                        alert('Error updating status: ' + error.message);
                    });
        });
    });






    document.getElementById('likeBtn').addEventListener('click', function() {
        const gatherId = this.getAttribute('data-gather-id');
        $.ajax({
            type: 'POST',
            url: '/api/likeGather',
            data: { id: gatherId },
            success: function(response) {
                document.getElementById('likeBtn').innerHTML = '<i class="fas fa-heart"></i> ' + response;
            },
            error: function(error) {
                console.error('좋아요 업데이트 실패: ', error);
            }
        });
    });
</script>
</body>
</html>
