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
        .comment-actions {
            margin-top: 10px;
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
            <form id="commentForm">
                <div class="form-group">
                    <input type="hidden" id="commentUsername" value="${username}">
                    <input type="text" class="form-control" id="commentBody" placeholder="댓글을 작성해보세요.">
                </div>
                <button type="submit" class="btn btn-primary">댓글 작성</button>
            </form>
            <div class="mt-3" id="commentsList">
                <c:forEach items="${commentDtos}" var="comment">
                    <div class="media mb-3" data-comment-id="${comment.id}">
                        <img src="/img/user.png" class="mr-3 rounded-circle" alt="User Avatar" style="width: 40px;">
                        <div class="media-body">
                            <h6 class="mt-0">${comment.username}</h6>
                            <p class="comment-body">${comment.body}</p>
                            <input type="text" class="form-control comment-body-edit" style="display:none;" value="${comment.body}">
                            <c:if test="${username == comment.username}">
                                <div class="comment-actions">
                                    <button class="btn btn-secondary btn-sm btn-edit-comment" data-comment-id="${comment.id}">수정</button>
                                    <button class="btn btn-primary btn-sm btn-save-comment" data-comment-id="${comment.id}" style="display:none;">저장</button>
                                    <button class="btn btn-danger btn-sm btn-delete-comment" data-comment-id="${comment.id}">삭제</button>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
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

        document.getElementById('statusBtn').addEventListener('click', () => {
            const gatherId = ${gather.id};
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

        document.getElementById('commentsList').addEventListener('click', function(event) {
            if (event.target.classList.contains('btn-edit-comment')) {
                const commentElement = event.target.closest('.media');
                const commentBodyElement = commentElement.querySelector('.comment-body');
                const commentBodyEditElement = commentElement.querySelector('.comment-body-edit');
                const saveButton = commentElement.querySelector('.btn-save-comment');
                const editButton = event.target;
                const deleteButton = commentElement.querySelector('.btn-delete-comment'); // 삭제 버튼

                commentBodyElement.style.display = 'none';
                commentBodyEditElement.style.display = 'block';
                saveButton.style.display = 'inline-block';
                editButton.style.display = 'none'; // 수정 버튼 숨기기
                deleteButton.style.display = 'none'; // 삭제 버튼 숨기기
            } else if (event.target.classList.contains('btn-save-comment')) {
                const commentElement = event.target.closest('.media');
                const commentId = event.target.getAttribute('data-comment-id');
                const commentBodyEditElement = commentElement.querySelector('.comment-body-edit');
                const commentBody = commentBodyEditElement.value;
                const commentUsername = document.getElementById('commentUsername').value; // username 가져오기
                const gatherId = ${gather.id}; // gatherId 가져오기

                fetch('/api/gather/comments/' + commentId, {
                    method: 'PATCH',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ id: commentId, body: commentBody, username: commentUsername, gatherId: gatherId }) // 필요한 모든 필드 추가
                })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok.');
                        }
                        return response.json();
                    })
                    .then(data => {
                        const commentBodyElement = commentElement.querySelector('.comment-body');
                        commentBodyElement.innerText = data.body;

                        commentBodyElement.style.display = 'block';
                        commentBodyEditElement.style.display = 'none';
                        event.target.style.display = 'none';

                        // 수정 버튼 및 삭제 버튼 다시 보이게 설정
                        commentElement.querySelector('.btn-edit-comment').style.display = 'inline-block';
                        commentElement.querySelector('.btn-delete-comment').style.display = 'inline-block';
                    })
                    .catch(error => {
                        console.error('댓글 수정 실패:', error);
                        alert('댓글 수정에 실패했습니다: ' + error.message);
                    });
            } else if (event.target.classList.contains('btn-delete-comment')) {
                const commentId = event.target.getAttribute('data-comment-id');
                if (confirm('정말 이 댓글을 삭제하시겠습니까?')) {
                    fetch('/api/gather/comments/' + commentId, {
                        method: 'DELETE',
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok.');
                            }
                            event.target.closest('.media').remove();
                        })
                        .catch(error => {
                            console.error('댓글 삭제 실패:', error);
                            alert('댓글 삭제에 실패했습니다: ' + error.message);
                        });
                }
            }
        });
    });
</script>
</body>
</html>
