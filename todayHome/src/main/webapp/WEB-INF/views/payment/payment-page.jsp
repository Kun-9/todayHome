<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<jsp:include page="/WEB-INF/views/fragment/static-header.jsp"/>
	<title>주문/결제</title>

	<style>
        .cart-img {
            width: 70px;
            height: 70px;
            border-radius: 5px;
        }

        .cart-img-container {
            width: 70px;
            height: 70px;
            border-radius: 5px;
        }

        .cart-item-container {
            width: 100%;
            background-color: white;
        }

        .follow-check-input {
            width: 22px;
            height: 22px;
            margin: 0;
        }

        .follow-check-input:hover {
            cursor: pointer;
        }

        .following-feed-btn-container {
            position: sticky;
            top: 100px;

        }

        .coupon-banner {
            justify-content: space-between;
            border: 1px solid #469DC9;
            border-radius: 5px;
            padding: 10px 16px;
            background-color: white;
            font-weight: 700;
            font-size: 14px;
            color: rgb(0, 159, 206);
            margin-bottom: 15px;
            align-items: center;

        }

        .quantity-btn {
            color: rgb(47, 52, 56);
            font-size: 20px
        }

        .quantity-btn:hover {
            cursor: pointer;
            color: #97999B;
        }

        .bi-x:hover {
            cursor: pointer;
            color: #C1C5C9;
        }

        .purchase-btn {
            width: 100%;
            padding: 15px 10px;
            background-color: #35c5f0;
            color: white;
            font-weight: 700;
            font-size: 17px;
            text-align: center;
            border-radius: 5px;
        }

        .purchase-btn:hover {
            cursor: pointer;
            background-color: #4EAAD6;
        }

        .flex-check-default:checked {
            background-color: #65C2EC;
            border: none;
        }

        .payment-obj-container {
            /*border: 1px solid black;*/
            margin-top: 50px;
        }

        .payment-obj-label {
            font-size: 20px;
            font-weight: bold;
        }

        .sub-label {
            gap: 10px;
            align-items: center;
            font-weight: 400;
            font-size: 12px;
            color: #424242;
        }

        .border-line {
            width: 100%;
            border-bottom: #F5F5F5 1px solid;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 10% 35% 5% 35%;
			align-items: center;
        }

        .remain-point {
			color: rgb(53, 197, 240);
			font-size: 15px;
            font-weight: bold;
            margin-left: 5px;
        }

		.point-color {
            color: rgb(53, 197, 240);
            font-size: 15px;
            font-weight: bold;
            margin-left: 5px;
		}

        .payment-form-grid-input {
			border: 1px solid #DBDBDB;
			border-radius: 3px;
			padding: 5px 10px;
        }

        .payment-method-container {
            display: flex;
            flex-direction: column;
            height: 100%;
			aspect-ratio: 1/1.5;
            align-items: center;
            position: relative;
            box-sizing: border-box;
            text-align: center;
            background-color: rgb(255, 255, 255);
            border-width: 1px 1px 1px 0;
            padding: 15px 1px 15px 0px;

            border-right-color: rgb(234, 235, 239);
            border-bottom-color: rgb(234, 235, 239);
            border-top-color: rgb(234, 235, 239);

            border-right-style: solid;
            border-top-style: solid;
            border-bottom-style: solid;
            transition: background-color 0.2s ease 0s;
            word-break: keep-all;
            cursor: pointer;
        }

        .payment-method-bundle {
            display: flex;
            flex-wrap: wrap;
            /*border-top: 1px solid rgb(234, 235, 239);*/
            border-left: 1px solid rgb(234, 235, 239);
			height: 150px;

            /*style="margin-top: 20px; display: grid; grid-template-columns: repeat(7, 1fr); grid-auto-rows: ;*/
        }

        .payment-form-grid-input-label {
			font-size: 15px;
			color: rgb(117, 117, 117);
        }

        .delivery-cost-label {
			color: rgb(130, 140, 148);
			font-size: 14px;
        }

        .delivery-cost-container {
            font-size: 14px;
        }

        .payment-result-label {
            font-weight: 400;
            color: rgb(130, 140, 148);
        }
	</style>
</head>
<body>
<script>
    $(function () {
        // 여기에서 메뉴 선택
        // 첫번째 파라미터 (커뮤니티, 쇼핑 중 선택)
        // 두번째 파라미터 (서브 메뉴 중 몇번째인지 선택, 서브메뉴는 첫번째 메뉴 선택시 자동으로 변경됨)
        // 0 이면 아무것도 하이리이팅 X
        // 두번째 파라미터에 null 입력시 서브메뉴 없앰
        selectCurrentMenu(0, null)
    });s
</script>

<jsp:include page="/WEB-INF/views/fragment/menubar.jsp"/>
<div class="main-container" style="margin-top: 110px;">
	<div class="content flex-row">

		<div class="flex-col" style="width: 65%;">
			<div style="padding-top: 40px; font-size: 24px; font-weight: bold;">주문/결제</div>

			<div class="flex-col payment-obj-container">
				<div class="flex-row" style="align-items: center; justify-content: space-between; margin-bottom: 10px;">
					<div class="flex-row" style="align-items: center">
						<div class="payment-obj-label">배송지</div>
					</div>

					<div class="flex-row sub-label">
						<div>변경</div>
					</div>
				</div>

				<div class="border-line"></div>

				<div class="flex-row" style="gap: 5px; font-size: 18px; margin-top: 15px; align-items: center">
					<%-- 사용자 이름 --%>
					<div class="name" style="font-weight: bold; font-size: 18px">신동근</div>
					<div style="font-size: 12px; color: #65C2EC; font-weight: 700; border: 1px solid #65C2EC; padding: 0 8px; border-radius: 20px">기본배송지</div>
				</div>

				<%-- 사용자 주소 --%>
				<div style="margin-top: 10px; color: rgb(41, 41, 41)">서울 광진구 동일로11길 11호</div>

				<%-- 사용자 전화번호 --%>
				<div style="font-size: 15px; color: rgb(117, 117, 117)"><span class="name">신동근</span><span class="phone" style="margin-left: 10px;">010-2222-3333</span></div>
				<select style="margin-top: 15px; padding: 10px 15px; border-radius: 4px; border: 1px solid rgb(219, 219, 219)">
					<option>부재시 문앞에 놓아주세요</option>
					<option>기타 등등</option>
				</select>
			</div>

			<div class="flex-col payment-obj-container">
				<div class="flex-row" style="align-items: center; margin-bottom: 10px">
					<div class="payment-obj-label">주문자</div>
				</div>

				<div class="border-line"></div>

				<div class="flex-col" style="gap: 15px; margin-top: 20px">
					<div class="form-grid">
						<div class="payment-form-grid-input-label">이름</div>
						<input class="payment-form-grid-input" type="text">
					</div>

					<div class="form-grid">
						<div class="payment-form-grid-input-label">이메일</div>
						<input class="payment-form-grid-input" type="text">
						<div style="text-align: center">@</div>
						<input class="payment-form-grid-input" type="text">
					</div>

					<div class="form-grid">
						<div class="payment-form-grid-input-label">휴대전화</div>
						<div style="display: grid; grid-template-columns: 35% 65%;">
							<div style="padding-right: 8px;">
								<input style="width: 100%" class="payment-form-grid-input" type="text">
							</div>

							<input class="payment-form-grid-input" type="text">
						</div>
					</div>
				</div>
			</div>

			<div class="flex-col payment-obj-container" >
				<div class="flex-row" style="align-items: center; margin-bottom: 10px">
					<div class="payment-obj-label">주문상품</div>
					<div style="margin-left: 10px;"><span>3</span>건</div>
				</div>

				<div class="border-line" style=""></div>

				<%-- 상품 컨테이너 --%>
				<div class="flex-col" style="border: 1px solid #EAEBEF; border-radius: 5px; margin-top: 20px;">
					<div class="flex-row" style="justify-content: space-between; align-items: center; border-bottom: #F5F5F5 2px solid; padding: 10px 20px; font-size: 15px; font-weight: 500; background-color: #F7F8FA">
						<div>데데리트</div>
						<div class="delivery-cost-container">
							<span class="delivery-cost-label">배송비</span>
							<span class="delivery-cost-value-container"><span class="delivery-cost-value">3,000</span>원</span>
						</div>
					</div>

					<div class="flex-row" style="gap: 20px; padding: 20px">
						<div class="flex-col" style="gap: 10px; width: 100%">
							<div class="flex-row" style="gap: 15px">
								<div class="cart-img-container">
									<img class="cart-img" src="https://bucketplace-v2-development.s3.amazonaws.com/uploads/productions/168256978840040031.jpg">
								</div>
								<div class="flex-col" style="flex: 1; gap: 8px">
									<div style="font-size: 15px; font-weight: 500; line-height: 21px; overflow-wrap: break-word; transition: opacity 0.1s">미드센추리 스테인레스 이동식 수납 카트 2size</div>
									<div class="flex-row" style="font-size: 14px; line-height: 15px; color: #757575; gap: 5px">
										<div>사이즈 : 대형(25cm)</div>
										<%-- 옵션 추가시 추가 --%>
										<div>|</div>
										<div>색상 : 화이트</div>
										<%------------------%>
									</div>

									<div class="flex-row" style="font-size: 11px; line-height: 15px; color: #757575; gap: 5px; align-items: center">
										<div style="line-height: 20px; font-weight: 700; font-size: 16px; color: black"><span>33,800</span>원</div>
										<div>|</div>
										<div>1개</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>

			<div class="flex-col payment-obj-container">
				<div class="flex-row" style="align-items: center; justify-content: space-between; margin-bottom: 10px;">
					<div class="flex-row" style="align-items: center">
						<div class="payment-obj-label">장바구니 쿠폰</div>
					</div>

					<div class="flex-row" style="font-size: 15px; color: rgb(117, 117, 117)">
						<div>사용 가능한 쿠폰이 없습니다</div>
					</div>
				</div>

				<div class="border-line"></div>

				<div class="flex-col" style="gap: 5px; font-size: 16px; margin-top: 15px; background-color: #F7F8FA">
					<div class="flex-col" style="padding: 20px">

						<div style="text-align: right; font-size: 14px; color: rgb(164, 172, 179);">쿠폰 코드가 있으신가요?</div>
						<div class="flex-row" style="margin-top: 20px">
							<input style="border-radius: 4px; border: 1px solid #DBDBDB; width: 250px" type="text">
							<div style="background-color: #65C2EC; padding: 8px 15px; border-radius: 4px; color: white; margin-left: 10px">확인</div>
						</div>
					</div>
				</div>
			</div>

			<div class="flex-col payment-obj-container">
				<div class="flex-row" style="align-items: center">
					<div class="payment-obj-label">포인트</div>
				</div>

				<div class="border-line" style="margin-top: 15px;"></div>


				<div class="flex-col" >
					<div class="flex-row" style="margin-top: 20px">
						<input style="border-radius: 4px; border: 1px solid #DBDBDB; width: 250px" type="text">
						<div style="padding: 8px 15px; border-radius: 4px; color: #65C2EC; border: 1px solid #65C2EC; margin-left: 10px">전액사용</div>
					</div>
					<div style="margin-top: 10px; font-size: 15px">
						사용 가능 포인트 <span class="remain-point">871</span><span class="point-color">P</span>
					</div>
				</div>
			</div>

			<div class="flex-col payment-obj-container">
				<div class="flex-row" style="align-items: center">
					<div class="payment-obj-label">결제 수단</div>
				</div>

				<div class="border-line" style="margin: 15px 0;"></div>


				<div class="flex-col" >
					<div class="payment-method-bundle">
<%--						<div class="flex-col" style="border: 1px solid black; width: 100%; height: 100%; align-items: center; padding: 15px">--%>
<%--							<div style="font-size: 14px;">카드</div>--%>
<%--							<img src="https://image.ohou.se/i/bucketplace-v2-development/pg/168311599350498640.png?w=180&h=180&c=c&webp=1"} style="height: 60px; width: 60px;">--%>
<%--						</div>--%>

						<div class="flex-col payment-method-container">
							<div style="font-size: 14px;">카드</div>
							<img src="https://image.ohou.se/i/bucketplace-v2-development/pg/168311599350498640.png?w=180&h=180&c=c&webp=1" style="height: 60px; width: 60px;">
						</div>

						<div class="flex-col payment-method-container">
							<div style="font-size: 14px;">카드</div>
							<img src="https://image.ohou.se/i/bucketplace-v2-development/pg/168311599350498640.png?w=180&h=180&c=c&webp=1" style="height: 60px; width: 60px;">
						</div>

						<div class="flex-col payment-method-container">
							<div style="font-size: 14px;">카드</div>
							<img src="https://image.ohou.se/i/bucketplace-v2-development/pg/168311599350498640.png?w=180&h=180&c=c&webp=1" style="height: 60px; width: 60px;">
						</div>

						<div class="flex-col payment-method-container">
							<div style="font-size: 14px;">카드</div>
							<img src="https://image.ohou.se/i/bucketplace-v2-development/pg/168311599350498640.png?w=180&h=180&c=c&webp=1" style="height: 60px; width: 60px;">
						</div>

					</div>

					<div class="flex-col" style="padding: 10px; background-color: #F8F9FA; margin-top: 15px; font-size: 13px; color: rgb(130, 140, 148)">
						<div>- [6/5~11] 네이버페이 10만원이상 결제시 3,000P적립 + 신한카드로 10만원이상 결제시 3,000P적립 (총 6천P) (적립시점: 7/14일, 중도 취소분 미반영)</div>
						<div>- 네이버페이 기본적립 (네이버쇼핑 유입1% / 기타경로 0.2%) + 충전포인트결제 1.5% + 소득공제</div>
					</div>

				</div>
			</div>
		</div>

		<div style="flex: 1; padding-left: 40px; margin-top: 40px">
			<div class="flex-col following-feed-btn-container" style="padding-top: 20px;">
				<div style="width: 100%; border: 1px solid #EAEAEE; border-radius: 6px; ">
					<div class="flex-col" style="width:100%; padding: 30px 20px; gap: 10px">
						<div style="font-size: 20px; margin-bottom: 20px; font-weight: bold;">결제금액</div>

						<div class="flex-row" style="justify-content: space-between; font-size: 15px; font-weight: 400;" >
							<div class="payment-result-label">총 상품 금액</div>
							<div style="font-weight: 700;"><span>92,000</span>원</div>
						</div>

						<div class="flex-row" style="justify-content: space-between; font-size: 15px; font-weight: 400; color: #424242" >
							<div class="payment-result-label">배송비</div>
							<div><span>62,000</span>원</div>
						</div>

						<div class="flex-row" style="justify-content: space-between; font-size: 15px; font-weight: 400; color: #424242" >
							<div class="payment-result-label">쿠폰 사용</div>
							<div><span>620</span>원</div>
						</div>

						<div class="flex-row" style="justify-content: space-between; font-size: 15px; font-weight: 400; color: #424242" >
							<div class="payment-result-label">포인트 사용</div>
							<div><span>2,000</span>원</div>
						</div>

						<div class="border-line" style="margin-top: 15px;"></div>

						<div class="flex-col">
							<div class="flex-row" style="justify-content: space-between; font-size: 18px; font-weight: 700; margin-top: 15px; align-items: center" >
								<div style="">최종 결제 금액</div>
								<div style="font-size: 22px"><span style="color:#65C2EC;">1,031,300</span> 원</div>
							</div>

							<div style="text-align: right; font-size: 13px; color: rgb(66, 66, 66); line-height: 16px; margin-top: 5px;">
								<span style="font-weight: bold"><span>970</span> P</span> 적립 예정
							</div>
						</div>
					</div>

					<div class="border-line"></div>

					<div class="flex-row" style="align-items: center; padding: 20px">
						<div>
							<input class="form-check-input follow-check-input flex-check-default" type="checkbox" value="">
						</div>
						<div style="font-size: 15px; color: #424242; margin-left: 10px;">아래 내용에 모두 동의합니다. (필수)</div>
					</div>

					<div class="border-line"></div>

					<div class="flex-col" style="padding: 20px; gap: 20px">
						<div class="flex-row" style="align-items: center; ">
							<div>
								<input class="form-check-input follow-check-input flex-check-default" type="checkbox" value="">
							</div>
							<div style="font-size: 14px; color: rgb(101, 110, 117); margin-left: 10px;">개인정보 수집 이용 및 제 3자 제공 동의 (필수)</div>
						</div>

						<div class="flex-" style="font-size: 14px; color: rgb(101, 110, 117)">
							<div>본인은 만 14세 이상이며, 주문 내용을 확인하였습니다.</div>
							<div style="font-size: 12px; line-height: 20px; margin-top: 10px;">
								(주)버킷플레이스는 통신판매중개자로 거래 당사자가 아니므로, 판매자가 등록한 상품정보 및 거래 등에 대해 책임을 지지 않습니다 (단, ㈜버킷플레이스가 판매자로 등록 판매한 상품은 판매자로서 책임을 부담합니다).
							</div>
						</div>
					</div>
				</div>

				<div class="purchase-btn" style="margin-top: 20px;">
					<%-- 결제 가격 --%>
					<span>1,031,300</span>원 결제하기
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/fragment/footer.jsp"/>
</body>
</html>
