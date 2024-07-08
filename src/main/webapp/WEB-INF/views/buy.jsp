<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이용권 구매</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js" type="application/javascript"></script>
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .content {
            flex: 1;
        }
        .selected_ticket {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }
        .selected_ticket .ticket_info {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .selected_ticket .ticket_info .dot {
            width: 10px;
            height: 10px;
            background-color: #ffc107;
            border-radius: 50%;
        }
        .selected_ticket .ticket_info .ticket_title {
            font-weight: bold;
        }
        .selected_ticket .ticket_price {
            font-size: 1.2em;
            font-weight: bold;
        }
        .total_container {
            font-size: 1.5em;
            font-weight: bold;
        }
        .card-body .total_container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 20px;
        }
        .ticket_time {
            cursor: pointer;
        }
        footer {
            background-color: #f8f9fa;
            padding: 10px 0;
            text-align: center;
            width: 100%;
            position: fixed;
            bottom: 0;
        }
        .btn-outline-primary {
            position: relative;
        }
        .btn-outline-primary input[type="radio"] {
            position: absolute;
            opacity: 0;
            cursor: pointer;
        }
        .btn-outline-primary input[type="radio"]:checked + span::before {
            content: '';
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="/">Study Cafe</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="/reservation">예약하기</a></li>
                <li class="nav-item"><a class="nav-link" href="#study">스터디</a></li>
                <li class="nav-item"><a class="nav-link" href="/gather">모집게시판</a></li>
                <li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
            </ul>
        </div>
    </div>
</nav>

<main class="container mt-5 content">
    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header bg-warning text-white">
                    <h4 class="my-0 font-weight-normal">좌석 이용권</h4>
                </div>
                <div class="card-body">
                    <div>
                        <h5>1회 이용권</h5>
                        <div class="btn-group btn-group-toggle" data-toggle="buttons">
                            <label class="btn btn-outline-primary ticket_time" data-title="2시간 이용권" data-price="50">
                                <input type="radio" name="options1" autocomplete="off"><span> 2시간(50원)</span>
                            </label>
                            <label class="btn btn-outline-primary ticket_time" data-title="3시간 이용권" data-price="70">
                                <input type="radio" name="options1" autocomplete="off"><span> 3시간(70원)</span>
                            </label>
                            <label class="btn btn-outline-primary ticket_time" data-title="6시간 이용권" data-price="100">
                                <input type="radio" name="options1" autocomplete="off"><span> 6시간(100원)</span>
                            </label>
                        </div>
                    </div>
                    <div class="mt-3">
                        <h5>기간 이용권</h5>
                        <div class="btn-group btn-group-toggle" data-toggle="buttons">
                            <label class="btn btn-outline-primary ticket_time" data-title="2주 이용권" data-price="80">
                                <input type="radio" name="options2" autocomplete="off"><span> 2주(80원)</span>
                            </label>
                            <label class="btn btn-outline-primary ticket_time" data-title="4주 이용권" data-price="90">
                                <input type="radio" name="options2" autocomplete="off"><span> 4주(90원)</span>
                            </label>
                        </div>
                    </div>
                    <div class="mt-3">
                        <h5>시간 패키지</h5>
                        <div class="btn-group btn-group-toggle" data-toggle="buttons">
                            <label class="btn btn-outline-primary ticket_time" data-title="30시간 이용권" data-price="110">
                                <input type="radio" name="options3" autocomplete="off"><span> 30시간(110원)</span>
                            </label>
                            <label class="btn btn-outline-primary ticket_time" data-title="50시간 이용권" data-price="120">
                                <input type="radio" name="options3" autocomplete="off"><span> 50시간(120원)</span>
                            </label>
                            <label class="btn btn-outline-primary ticket_time" data-title="100시간 이용권" data-price="130">
                                <input type="radio" name="options3" autocomplete="off"><span> 100시간(130원)</span>
                            </label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mb-4">
                <div class="card-header bg-warning text-white">
                    <h4 class="my-0 font-weight-normal">사물함 이용권</h4>
                </div>
                <div class="card-body">
                    <label class="btn btn-outline-primary ticket_time w-100 mb-2" data-title="2주 사물함 이용권" data-price="140">
                        <input type="radio" name="options4" autocomplete="off"><span> 2주(140원)</span>
                    </label>
                    <label class="btn btn-outline-primary ticket_time w-100 mb-2" data-title="4주 사물함 이용권" data-price="150">
                        <input type="radio" name="options4" autocomplete="off"><span> 4주(150원)</span>
                    </label>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <form action="#" method="post" id="selectedTicketsForm">
                <div class="card mb-4">
                    <div class="card-header">
                        <h4 class="my-0 font-weight-normal">선택한 이용권</h4>
                    </div>
                    <div class="card-body">
                        <div class="selected_tickets" id="selectedTickets"></div>
                        <div class="total_container mt-4">
                            <p>총 결제 금액</p>
                            <div class="total_price"><span id="total_price">0</span>원</div>
                        </div>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-body text-center">
                        <button type="button" class="btn btn-warning btn-lg" id="pay_btn">결제하기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</main>

<footer class="footer">
    <div class="container">
        <span>스터디 카페 &amp; 스터디 모임 게시판 © 2024</span>
    </div>
</footer>

<!-- 스크립트 경로 확인 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        // 총 결제 금액을 업데이트하는 함수
        function updateTotalPrice() {
            let totalPrice = 0;
            $('.selected_ticket').each(function () {
                const price = parseInt($(this).find('.ticket_price').text().replace('원', '').trim());
                const quantity = parseInt($(this).find('.ticket_quantity').val());
                if (!isNaN(price) && !isNaN(quantity)) {
                    totalPrice += price * quantity;
                }
            });
            $('#total_price').text(totalPrice);
        }

        // 선택된 이용권을 선택한 이용권 섹션에 추가하는 함수
        function addSelectedTicket(title, price) {
            // HTML 요소를 직접 생성하고 값을 설정
            const $selectedTicket = $('<div>', { class: 'selected_ticket' });
            const $ticketInfo = $('<div>', { class: 'ticket_info' });
            const $dot = $('<div>', { class: 'dot' });
            const $ticketTitle = $('<div>', { class: 'ticket_title', text: title });
            const $ticketPrice = $('<div>', { class: 'ticket_price', text: price + '원' });

            const $ticketQuantity = $('<input>', { type: 'number', class: 'ticket_quantity', value: 1, min: 1 });
            const $removeButton = $('<button>', { type: 'button', class: 'btn btn-sm btn-danger remove_ticket', text: 'x' });

            $ticketInfo.append($dot, $ticketTitle, $ticketPrice);
            $selectedTicket.append($ticketInfo, $ticketQuantity, $removeButton);

            console.log("Adding HTML:", $selectedTicket.html());
            $('#selectedTickets').append($selectedTicket);
            updateTotalPrice();
        }

        // 이용권 및 사물함 선택
        $('.ticket_time').off('click').on('click', function(event) {
            event.preventDefault();  // 이벤트의 기본 동작 방지
            const title = $(this).data('title');
            const price = $(this).data('price');
            console.log("Data attributes - Title:", title, "Price:", price);
            addSelectedTicket(title, price);
        });

        // 선택된 이용권 제거
        $(document).on('click', '.remove_ticket', function() {
            $(this).closest('.selected_ticket').remove();
            updateTotalPrice();
        });

        // 선택된 이용권 수량 변경
        $(document).on('change', '.ticket_quantity', function() {
            updateTotalPrice();
        });

        // 부트페이 결제 호출
        $('#pay_btn').on('click', async function() {
            const totalPrice = parseInt($('#total_price').text()); // 결제할 총 금액
            if (isNaN(totalPrice) || totalPrice <= 0) {
                alert("결제할 금액이 없습니다.");
                return;
            }

            const requestData = {
                price: totalPrice, // 결제할 금액
                application_id: "668b746", // 부트페이에서 제공하는 Application ID
                name: '이용권 결제', // 결제할 상품명
                pg: 'kakao', // 사용할 PG사
                method: 'easy', // 결제수단 (카카오페이)
                show_agree_window: 0, // 부트페이 정책에 동의하는 창을 띄울지 여부
                items: [
                    {
                        item_name: '이용권', // 상품명
                        qty: 1, // 수량
                        unique: '123', // 해당 상품을 구분짓는 primary key
                        price: totalPrice // 상품 가격
                    }
                ],
                user_info: {
                    username: '사용자 이름',
                    email: 'user@example.com',
                    addr: '사용자 주소',
                    phone: '010-1234-5678'
                },
                order_id: '고유 주문번호', // 주문번호
                params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
                account_expire_at: '2024-12-31', // 가상계좌는 해당 값까지 입금 가능
                extra: {
                    start_at: '2024-01-01', // 정기결제 사용시
                    end_at: '2024-12-31', // 정기결제 사용시
                    vbank_result: 1, // 가상계좌 이용시
                    quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월수 설정 가능, 0:일시불, 2:2개월 할부, 3:3개월 할부
                }
            };

            try {
                console.log('Requesting payment with data:', requestData);
                const response = await BootPay.request(requestData);
                console.log('Bootpay response:', response);

                switch (response.event) {
                    case "issued":
                        // 가상계좌 입금 완료 처리
                        break;
                    case "confirm":
                        // receipt_id를 dto에 담아서
                        const dto = {
                            receiptId: response.receipt_id,
                        };

                        //  '/api/v1/bootpay/check' 로 보낸다.
                        fetch("/api/v1/bootpay/check", {
                            method: "POST",
                            headers: {
                                "Content-type": "application/json",
                            },
                            body: JSON.stringify(dto),
                        })
                            .then((res) => res.json())
                            .then((result) => {
                                // 정상적으로 처리되었는지 메시지를 띄운다.
                                // 정상적으로 승인이 되면 코드에 0을 반환할 것이고,
                                if (result.code === 0) {
                                    // 결제창을 닫는다.
                                    BootPay.close();
                                    alert(result.message);

                                    // 결제 완료 화면으로 리디렉션
                                    window.location.href = "/orderConfirmation";
                                } else {
                                    alert(result.message);
                                }
                            })
                            .catch((err) => {
                                console.error('Error during fetching check:', err);
                            });
                        break;
                    case "done":
                        // 결제 완료 처리
                        alert("결제 완료되었습니다.");
                        window.location.href = "/orderConfirmation";
                        break;
                    case "cancel":
                        // 결제 취소 처리
                        alert("결제가 취소되었습니다.");
                        break;
                    default:
                        console.error('Unknown event:', response.event);
                        break;
                }
            } catch (error) {
                // 결제 진행중 오류 발생
                console.error('Error during payment request:', error);
            }
        });
    });
</script>
</body>
</html>
