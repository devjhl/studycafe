<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
            margin-bottom: 10px; /* 간격 조절 */
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
        .btn-like.disabled {
            background-color: #ddd;
            cursor: not-allowed;
        }
        .btn-share {
            background-color: #4caf50;
            color: white;
        }
        .comment-actions {
            margin-top: 10px;
        }
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .page-item {
            margin: 0 5px;
            cursor: pointer;
        }
        .page-item.disabled {
            cursor: not-allowed;
            color: #ddd;
        }
        .page-link {
            padding: 10px;
            color: #007bff;
            text-decoration: none;
        }
        .page-link.active {
            background-color: #007bff;
            color: white;
            border-radius: 5px;
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
            <p class="text-muted">작성일 ${formattedDateTime} <span class="ml-2">조회수 ${gather.views}</span></p>
        </div>
        <div class="post-content">
            <pre>${gather.content}</pre>
        </div>
        <c:if test="${username == gather.username}">
            <a class="btn btn-warning btn-edit" href="/gather/updateGather/${gather.id}">수정</a>
            <button class="btn btn-danger btn-delete" id="deleteBtn">삭제</button>
        </c:if>
        <hr>
        <div class="comment-box">
            <h5>댓글</h5>
            <c:if test="${username == 'anonymousUser'}">
                <form id="commentForm">
                    <div class="form-group">
                        <input type="text" class="form-control" id="commentBody2" placeholder="댓글 작성을 하려면 로그인 해주세요" disabled>
                    </div>
                </form>
            </c:if>
            <c:if test="${username != 'anonymousUser'}">
                <form id="commentForm">
                    <div class="form-group">
                        <input type="hidden" id="commentUsername" value="${username}">
                        <input type="text" class="form-control" id="commentBody" placeholder="댓글을 작성해보세요.">
                    </div>
                    <button type="submit" class="btn btn-primary">댓글 작성</button>
                </form>
            </c:if>
            <div class="mt-3" id="commentsList">
                <c:forEach items="${comments}" var="comment">
                    <div class="media mb-3" data-comment-id="${comment.id}">
                            <%--<img src="/img/user.png" class="mr-3 rounded-circle" alt="User Avatar" style="width: 40px;">--%>
                        <div class="media-body">
                            <h6 class="mt-0">${comment.username}</h6>
                            <p class="text-muted">${comment.formattedCreatedAt}</p>
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
            <c:if test="${totalPages > 1}">
                <div class="pagination">
                    <c:if test="${currentPage > 0}">
                        <button class="page-item" onclick="loadComments(${currentPage - 1})">이전</button>
                    </c:if>
                    <c:forEach begin="0" end="${totalPages - 1}" var="i">
                        <span class="page-item ${i == currentPage ? 'page-link active' : 'page-link'}" onclick="loadComments(${i})">${i + 1}</span>
                    </c:forEach>
                </div>
            </c:if>
        </div>
    </div>
    <div class="sidebar">
        <c:if test="${username == gather.username}">
            <button class="btn ${gather.status == '모집완료' ? 'btn-status-complete' : 'btn-status'}" id="statusBtn" data-gather-id="${gather.id}">${gather.status == '모집완료' ? '모집중' : '모집완료'}</button>
        </c:if>
        <c:if test="${username != 'anonymousUser'}">
            <button class="btn btn-like" id="likeBtn" data-gather-id="${gather.id}">
                <i class="fas fa-heart"></i><span id="likeCount">${gather.likes}</span>
            </button>
        </c:if>
        <button class="btn btn-share" id="shareBtn"><i class="fas fa-share-alt"></i> 공유</button>
    </div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script>
    function loadComments(page) {
        const urlParams = new URLSearchParams(window.location.search);
        urlParams.set('page', page);
        window.location.search = urlParams.toString();
    }

    document.addEventListener('DOMContentLoaded', (event) => {
        // 삭제 버튼 이벤트 핸들러
        const deleteBtn = document.getElementById('deleteBtn');
        if (deleteBtn) {
            deleteBtn.addEventListener('click', () => {
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
        }

        // 모집 상태 버튼 이벤트 핸들러
        const statusBtn = document.getElementById('statusBtn');
        if (statusBtn) {
            statusBtn.addEventListener('click', () => {
                const gatherId = statusBtn.getAttribute('data-gather-id');
                fetch('/api/updateStatus/' + gatherId, {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                })
                    .then(response => {
                        if (response.ok) {
                            statusBtn.innerText = statusBtn.innerText === '모집중' ? '모집완료' : '모집중';
                            statusBtn.classList.toggle('btn-status');
                            statusBtn.classList.toggle('btn-status-complete');
                        } else {
                            throw new Error('Network response was not ok.');
                        }
                    })
                    .catch(error => {
                        console.error('Error updating status: ' + error.message);
                    });
            });
        }

        // 좋아요 버튼 이벤트 핸들러
        const likeBtn = document.getElementById('likeBtn');
        if (likeBtn) {
            likeBtn.addEventListener('click', () => {
                const gatherId = likeBtn.getAttribute('data-gather-id');
                fetch('/gather/api/likeGather', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ gatherId: gatherId })
                })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.json();
                    })
                    .then(data => {
                        document.getElementById('likeCount').textContent = data.likes;
                        likeBtn.classList.toggle('disabled', data.userHasLiked);
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });
            });
        }

        // 댓글 작성 이벤트 핸들러
        document.getElementById('commentForm').addEventListener('submit', function(event) {
            event.preventDefault();
            const gatherId = ${gather.id};
            const commentBody = document.getElementById('commentBody').value;
            const commentUsername = document.getElementById('commentUsername').value;
            if (commentBody.trim() === '') {
                alert('댓글을 입력해주세요.');
                return;
            }

            fetch('/api/gather/' + gatherId + '/comments', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ body: commentBody, username: commentUsername, gatherId: gatherId })
            })
                .then(response => {
                    if (!response.ok) {
                        return response.json().then(error => { throw new Error(error.error); });
                    }
                    return response.json();
                })
                .then(data => {
                    const commentList = document.getElementById('commentsList');
                    const newComment = document.createElement('div');
                    newComment.classList.add('media', 'mb-3');
                    newComment.setAttribute('data-comment-id', data.id);

                    /* const img = document.createElement('img');
                     img.src = '/img/user.png';
                     img.classList.add('mr-3', 'rounded-circle');
                     img.style.width = '40px';*/

                    const mediaBody = document.createElement('div');
                    mediaBody.classList.add('media-body');

                    const username = document.createElement('h6');
                    username.classList.add('mt-0');
                    username.innerText = data.username;

                    const commentDate = document.createElement('p');
                    commentDate.classList.add('text-muted');
                    commentDate.innerText = new Date(data.createdAt).toLocaleString();

                    const commentBodyP = document.createElement('p');
                    commentBodyP.classList.add('comment-body');
                    commentBodyP.innerText = data.body;

                    const commentBodyEdit = document.createElement('input');
                    commentBodyEdit.type = 'text';
                    commentBodyEdit.classList.add('form-control', 'comment-body-edit');
                    commentBodyEdit.style.display = 'none';
                    commentBodyEdit.value = data.body;

                    const commentActions = document.createElement('div');
                    commentActions.classList.add('comment-actions');

                    const editButton = document.createElement('button');
                    editButton.classList.add('btn', 'btn-secondary', 'btn-sm', 'btn-edit-comment');
                    editButton.setAttribute('data-comment-id', data.id);
                    editButton.innerText = '수정';

                    const saveButton = document.createElement('button');
                    saveButton.classList.add('btn', 'btn-primary', 'btn-sm', 'btn-save-comment');
                    saveButton.setAttribute('data-comment-id', data.id);
                    saveButton.style.display = 'none';
                    saveButton.innerText = '저장';

                    const deleteButton = document.createElement('button');
                    deleteButton.classList.add('btn', 'btn-danger', 'btn-sm', 'btn-delete-comment');
                    deleteButton.setAttribute('data-comment-id', data.id);
                    deleteButton.innerText = '삭제';

                    commentActions.appendChild(editButton);
                    commentActions.appendChild(saveButton);
                    commentActions.appendChild(deleteButton);

                    mediaBody.appendChild(username);
                    mediaBody.appendChild(commentDate);
                    mediaBody.appendChild(commentBodyP);
                    mediaBody.appendChild(commentBodyEdit);
                    mediaBody.appendChild(commentActions);

                    //newComment.appendChild(img);
                    newComment.appendChild(mediaBody);

                    commentList.prepend(newComment);
                    document.getElementById('commentBody').value = '';
                })
                .catch(error => {
                    console.error('댓글 작성 실패:', error);
                    alert('댓글 작성에 실패했습니다: ' + error.message);
                });
        });

        // 댓글 수정 및 삭제 이벤트 핸들러
        const commentsList = document.getElementById('commentsList');
        if (commentsList) {
            commentsList.addEventListener('click', function(event) {
                if (event.target.classList.contains('btn-edit-comment')) {
                    const commentElement = event.target.closest('.media');
                    const commentBodyElement = commentElement.querySelector('.comment-body');
                    const commentBodyEditElement = commentElement.querySelector('.comment-body-edit');
                    const editButton = commentElement.querySelector('.btn-edit-comment');
                    const saveButton = commentElement.querySelector('.btn-save-comment');

                    commentBodyElement.style.display = 'none';
                    commentBodyEditElement.style.display = 'block';
                    saveButton.style.display = 'inline-block';
                    editButton.style.display = 'none';
                } else if (event.target.classList.contains('btn-save-comment')) {
                    const commentElement = event.target.closest('.media');
                    const commentId = event.target.getAttribute('data-comment-id');
                    const commentBodyEditElement = commentElement.querySelector('.comment-body-edit');
                    const commentBody = commentBodyEditElement.value;
                    const commentUsername = document.getElementById('commentUsername').value;
                    const gatherId = ${gather.id};

                    fetch('/api/gather/comments/' + commentId, {
                        method: 'PATCH',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({ id: commentId, body: commentBody, username: commentUsername, gatherId: gatherId })
                    })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok.');
                            }
                            return response.json();
                        })
                        .then(data => {
                            const commentBodyElement = commentElement.querySelector('.comment-body');
                            const editButton = commentElement.querySelector('.btn-edit-comment');
                            const saveButton = commentElement.querySelector('.btn-save-comment');

                            commentBodyElement.innerText = data.body;

                            commentBodyElement.style.display = 'block';
                            commentBodyEditElement.style.display = 'none';
                            saveButton.style.display = 'none';
                            editButton.style.display = 'inline-block';
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
        }

        // 공유 버튼 이벤트 핸들러
        const shareBtn = document.getElementById('shareBtn');
        if (shareBtn) {
            shareBtn.addEventListener('click', function() {
                const url = window.location.href;
                navigator.clipboard.writeText(url)
                    .then(() => {
                        alert('링크가 클립보드에 복사되었습니다.');
                    })
                    .catch(err => {
                        console.error('링크 복사 실패: ', err);
                    });
            });
        }
    });
</script>
</body>
</html>
