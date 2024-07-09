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
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 20px;
            border: 1px solid #000;
            padding: 10px;
        }
        .row {
            width: 100%;
            display: flex;
            justify-content: center;
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
<jsp:include page="/WEB-INF/views/header.jsp" />
<div class="container mt-5 content">
    <h2 class="text-center">좌석 배치도</h2>
    <div class="seat-container" id="seatContainer">
        <!-- 좌석 데이터는 JavaScript로 로드됩니다. -->
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
<jsp:include page="/WEB-INF/views/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        let userInfo = {
        userId: '${user.id}'
    };
        $(document).ready(function() {
        // 좌석 데이터를 서버에서 로드
        fetch('/api/v1/seats')
            .then(response => response.json())
            .then(data => {
                const seatContainer = $('#seatContainer');
                const rows = 6;
                const cols = 8;
                let seatIndex = 0;

                // Initialize rows
                for (let i = 0; i < rows; i++) {
                    seatContainer.append('<div class="row"></div>');
                }

                // Fill seats
                seatContainer.children('.row').each(function () {
                    for (let j = 0; j < cols; j++) {
                        if (seatIndex < data.length) {
                            const seat = data[seatIndex];
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
                            $(this).append(seatDiv);
                            seatIndex++;
                        }
                    }
                });

                // 좌석 클릭 이벤트 바인딩
                $('.seat').on('click', function () {
                    if ($(this).hasClass('reserved') || $(this).hasClass('unavailable')) {
                        alert('이 좌석은 선택할 수 없습니다.');
                        return;
                    }
                    $(this).toggleClass('selected');
                });
            })
            .catch(error => console.error('Error loading seats:', error));

        // 예약 버튼 클릭 이벤트
        $('#reserveButton').on('click', async function() {
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
