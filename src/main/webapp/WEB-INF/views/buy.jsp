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
    let userInfo = {
        username: '${user.username}',
        email: '${user.email}',
        phone: '${user.phone}'
    };

    $(document).ready(function() {
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

        function addSelectedTicket(title, price) {
            const $selectedTicket = $('<div>', {class: 'selected_ticket'});
            const $ticketInfo = $('<div>', {class: 'ticket_info'});
            const $dot = $('<div>', {class: 'dot'});
            const $ticketTitle = $('<div>', {class: 'ticket_title', text: title});
            const $ticketPrice = $('<div>', {class: 'ticket_price', text: price + '원'});
            const $ticketQuantity = $('<input>', {type: 'number', class: 'ticket_quantity', value: 1, min: 1});
            const $removeButton = $('<button>', {
                type: 'button',
                class: 'btn btn-sm btn-danger remove_ticket',
                text: 'x'
            });

            $ticketInfo.append($dot, $ticketTitle, $ticketPrice);
            $selectedTicket.append($ticketInfo, $ticketQuantity, $removeButton);
            $('#selectedTickets').append($selectedTicket);
            updateTotalPrice();
        }

        $('.ticket_time').on('click', function (event) {
            event.preventDefault();
            const title = $(this).data('title');
            const price = $(this).data('price');
            addSelectedTicket(title, price);
        });

        $(document).on('click', '.remove_ticket', function () {
            $(this).closest('.selected_ticket').remove();
            updateTotalPrice();
        });

        $(document).on('change', '.ticket_quantity', function () {
            updateTotalPrice();
        });

        $('#pay_btn').on('click', function() {
            const totalPrice = parseInt($('#total_price').text());
            console.log("Total price on click: ", totalPrice); //
            if (isNaN(totalPrice) || totalPrice <= 0) {
                alert("결제할 금액이 없습니다.");
                return;
            }

            const requestData = {
                price: totalPrice,
                application_id: "668b746a6a325f79257ef328",
                name: '이용권 결제',
                pg: 'kakao',
                method: 'easy',
                show_agree_window: 0,
                items: [{
                    item_name: '이용권',
                    qty: 1,
                    unique: '123',
                    price: totalPrice
                }],
                user_info: userInfo,
                order_id: '고유 주문번호',
                params: {callback1: 'value1', callback2: 'value2', customvar1234: 'custom'},
                account_expire_at: '2024-12-31',
                extra: {
                    start_at: '2024-01-01',
                    end_at: '2024-12-31',
                    vbank_result: 1,
                    quota: '0,2,3'
                }
            };

            BootPay.request(requestData)
                .error(function (data) {
                    console.error('결제 오류:', data);
                    alert('결제 요청에 실패했습니다. 다시 시도해주세요.');
                })
                .cancel(function (data) {
                    console.log('결제 취소:', data);
                    alert('결제가 취소되었습니다.');
                })
                .ready(function (data) {
                    console.log('결제 준비 완료:', data);
                })
                .confirm(function (data) {
                    console.log('결제 승인 요청:', data);
                    BootPay.transactionConfirm(data); // 결제 승인
                })
                .close(function (data) {
                    console.log('결제 창 닫힘:', data);
                })
                .done(function (data) {
                    console.log('결제 완료:', data);
                    alert('결제 완료되었습니다.');

                    const orderData = {
                        username: userInfo.username,
                        email: userInfo.email,
                        phone: userInfo.phone,
                        total_price: totalPrice,
                        created_at: new Date().toISOString()
                    };
                    fetch('/api/v1/order', {
                        method: 'POST',
                        headers: {'Content-Type': 'application/json'},
                        body: JSON.stringify(orderData)
                    })
                        .then(orderResponse => {
                            if (orderResponse.ok) {
                                return orderResponse.json();
                            } else {
                                return orderResponse.text().then(errorText => {
                                    throw new Error(`주문 저장 중 오류가 발생했습니다: ${errorText}`);
                                });
                            }
                        })
                        .then(data => {
                            const id = data.id;
                            window.location.href = '/api/v1/order/orderConfirmation/'+id;
                        })
                        .catch(error => {
                            console.error('주문 저장 오류:', error);
                            alert('주문 저장에 실패했습니다. 다시 시도해주세요.');
                        });
                });
        });
    });

</script>

</body>
</html>
