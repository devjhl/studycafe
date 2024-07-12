<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>좌석 배치도</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .content {
            flex: 1;
        }
        .seat {
            width: 60px;
            height: 60px;
            margin: 5px;
            cursor: pointer;
            background-color: #d6d8db;
            border: 1px solid #000;
            display: inline-block;
            text-align: center;
            line-height: 60px;
            color: black;
        }
        .seat.unavailable {
            background-color: #6c757d;
            cursor: not-allowed;
        }
        .seat.selected {
            background-color: #28a745;
        }
        .seat.reserved {
            background-color: #dc3545;
            cursor: not-allowed;
        }
        .seat-container {
            display: grid;
            grid-template-columns: repeat(8, 1fr);
            gap: 10px;
            justify-content: center;
            margin-top: 20px;
            border: 1px solid #000;
            padding: 10px;
        }
        footer {
            background-color: #f8f9fa;
            padding: 10px 0;
            text-align: center;
            width: 100%;
            position: fixed;
            bottom: 0;
        }
        .legend {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .legend div {
            display: flex;
            align-items: center;
            margin: 0 10px;
        }
        .legend div span {
            width: 20px;
            height: 20px;
            display: inline-block;
            margin-right: 5px;
        }
        .legend .available span {
            background-color: #d6d8db;
        }
        .legend .unavailable span {
            background-color: #6c757d;
        }
        .legend .reserved span {
            background-color: #dc3545;
        }
        .legend .selected span {
            background-color: #28a745;
        }
    </style>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="/">Study Cafe</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/reservation">예약하기</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/gather">모집게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/logout">로그아웃</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/mypage">마이페이지</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5 content">
    <h2 class="text-center">좌석 배치도</h2>
    <div class="seat-container" id="seatContainer">
        <!-- 좌석이 동적으로 추가될 자리 -->
    </div>
    <div class="text-center mt-4">
        <button class="btn btn-primary" id="reserveButton">예약하기</button>
    </div>
    <div class="legend">
        <div class="available"><span></span>선택 가능</div>
        <div class="unavailable"><span></span>이용 불가</div>
        <div class="reserved"><span></span>내 예약</div>
        <div class="selected"><span></span>선택됨</div>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <span>스터디 카페 & 스터디 모임 게시판 &copy; 2024</span>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    let userInfo = {
        userId: '1'
    };
    let hasOrder = false; // 초기화

    $(document).ready(function() {
        // 서버에서 이용권 구매 여부를 확인하는 요청
        fetch('/api/v1/checkOrder')
            .then(response => response.json())
            .then(data => {
                hasOrder = data.hasOrder; // 서버에서 받아온 값을 할당
            })
            .catch(error => {
                console.error('Error checking order:', error);
            });

        fetch('/api/v1/seats')
            .then(response => response.json())
            .then(data => {
                console.log('Seats data:', data); // 데이터 확인용 로그

                const seatContainer = $('#seatContainer');

                data.forEach(seat => {
                    const seatDiv = $('<div></div>')
                        .addClass('seat')
                        .text(seat.id)
                        .attr('data-seat-id', seat.id);
                    if (seat.reserved) {
                        if (Number(seat.userId) === Number(userInfo.userId)) {
                            seatDiv.addClass('reserved');
                        } else {
                            seatDiv.addClass('unavailable');
                        }
                    }
                    seatContainer.append(seatDiv);
                });

                // 좌석 클릭 이벤트 바인딩
                $('.seat').on('click', function () {
                    if (!hasOrder) {
                        alert('이용권 구매 후 이용해주세요.');
                        return;
                    }
                    if ($(this).hasClass('reserved') || $(this).hasClass('unavailable')) {
                        alert('이 좌석은 선택할 수 없습니다.');
                        return;
                    }
                    if ($('.seat.selected').length > 0 && !$(this).hasClass('selected')) {
                        alert('하나의 좌석만 선택할 수 있습니다.');
                        return;
                    }
                    $(this).toggleClass('selected');
                });
            })
            .catch(error => console.error('Error loading seats:', error));

        // 예약 버튼 클릭 이벤트
        $('#reserveButton').on('click', async function() {
            if (!hasOrder) {
                alert('이용권 구매 후 이용해주세요.');
                return;
            }
            const selectedSeat = $('.seat.selected').first();
            if (!selectedSeat.length) {
                alert('예약할 좌석을 선택하세요.');
                return;
            }

            const reservationRequest = {
                seatId: selectedSeat.data('seat-id'),
                userId: userInfo.userId
            };

            try {
                const response = await fetch('/api/v1/seats/reserve', {
                    method: 'POST',
                    headers: {'Content-Type': 'application/json'},
                    body: JSON.stringify(reservationRequest)
                });

                if (response.ok) {
                    selectedSeat.removeClass('selected').addClass('reserved');
                    alert('좌석이 예약되었습니다.');
                } else {
                    const errorText = await response.text();
                    alert('예약 실패: ' + errorText);
                }
            } catch (error) {
                console.error('Error during reservation request:', error);
                alert('예약 요청에 실패했습니다. 다시 시도해주세요.');
            }
        });
    });
</script>
</body>
</html>
