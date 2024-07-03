<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스터디 모집 작성</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 20px;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        .editor-toolbar {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<div class="container">
    <div class="alert alert-success" role="alert">
        <i class="fas fa-info-circle"></i> 스터디 모집 예시를 참고해 작성해주세요. 꼼꼼히 작성하면 멋진 스터디 팀원을 만날 수 있을거에요.
    </div>
    <h1 class="h4 mb-4">제목에 핵심 내용을 요약해보세요.</h1>
    <form action="/gather/write" method="post">
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="스터디 제목을 입력하세요" required>
        </div>
        <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control" id="content" name="content" rows="10" placeholder="스터디 내용을 입력하세요" required>
[개발 스터디 모집 내용 예시]

- 스터디 주제 :
- 스터디 목표 :
- 예상 스터디 일정(횟수) :
- 예상 커리큘럼 간략히 :
- 예상 모집인원 :
- 스터디 소개와 개설 이유 :
- 스터디 관련 주의사항 :
- 스터디에 지원할 수 있는 방법을 남겨주세요. (이메일, 카카오 오픈채팅방, 구글폼 등) :
            </textarea>
        </div>
        <div class="d-flex justify-content-end">
            <button type="button" class="btn btn-secondary mr-2" onclick="location.href='/gather'">취소</button>
            <button type="submit" class="btn btn-success">등록</button>
        </div>
    </form>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
