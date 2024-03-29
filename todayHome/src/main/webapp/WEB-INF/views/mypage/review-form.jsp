<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<jsp:include page="/WEB-INF/views/fragment/static-header.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review.css">
	<title>Home</title>

	<style>

	</style>
</head>
<body>
<script>
    $(function () {
        // 여기에서 메뉴 선택
        // 첫번째 파라미터 (커뮤니티, 쇼핑 중 선택)
        // 두번째 파라미터 (서브 메뉴 중 몇번째인지 선택)
		// 두번째 파라미터에 null 입력시 메뉴바 숨김
        selectCurrentMenu(0, null);

        // 마이페이지일때 메뉴
		// 메인메뉴, 서브메뉴 숫자 입력
		// 첫번째 파라미터에 0 입력시 숨김
		selectMyPage(3,1);
    });
</script>

<jsp:include page="/WEB-INF/views/fragment/menubar.jsp"/>

<div class="main-container">
	<div class="content review-home">
		<div class="review-home-search">
			<div class="review-home-search-title"> 내가 사용하는 상품 리뷰 쓰기</div>
			<form class="review-home-search-form">
				<div class="review-home-search-form-wrap flex-row">
					<input placeholder="브랜드명 혹은 상품명 입력" class="form-control review-home-search-form-input">
					<button class="review-home-button" type="submit">검색</button>
				</div>
			</form>

			<div class="flex-col" style="margin-top: 30px; gap: 10px">
				<c:forEach items="${productList}" var="review">
					<div class="picture-container flex-row" style="justify-content: space-between; width: 100%">
						<div class="flex-row" style="gap: 15px; align-items: center;">
							<div class="picture-img-container">
								<img class="follow-user-item-img"
									 src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/161866122047151511.jpeg?w=1440">
							</div>
							<div class="picture-text-container">
								<div class="picture-text brand">${review.brandName}</div>
								<div class="picture-text name">${review.productName}</div>
								<div class="picture-text option">${review.stockString}</div>
								<div class="picture-text point">포토 500P 일반 100P</div>
							</div>
						</div>

						<div class="flex-col" style="padding-right: 5px; gap: 5px; justify-content: center; text-align: center">
							<div style="font-size: 14px">오늘의집 구매</div>
							<div class="review-write-btn" onclick="openReviewModal('${review.productId}', '${review.brandName}', '${review.productName}', '${review.stockString}','${review.orderItemId}')">리뷰쓰기</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<div class="modal fade" id="reviewModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-dialog-centered" style="padding: 10px">
				<div style="text-align: center; position: relative; width: 100%; padding: 30px 0">
					<h5 class="modal-title" id="staticBackdropLabel">리뷰 쓰기</h5>
					<button style="position: absolute; right: 10px; top: 10px" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form class="modal-body flex-col" action="${pageContext.request.contextPath}/reviews/write" method="post" id="reviewForm" style="width: 100%;" enctype="multipart/form-data">
					<div id="reviewModalProduct"></div>

					<div style="margin-top: 40px;">
						<div style="text-align: center">별점 평가</div>
						<div class="rating-container-bundle " style="margin-top: 10px" id="rate-container">
							<div class="rating-container">
								<input type="hidden" name="rating" id="rating" value="0">
								<input type="hidden" name="productId" id="product-id" value="">
								<input type="hidden" name="orderItemId" id="order-item-id" value="">
								<div class="starBundle">
									<i class="fa-regular fa-star rate"></i>
									<i class="fa-regular fa-star rate"></i>
									<i class="fa-regular fa-star rate"></i>
									<i class="fa-regular fa-star rate"></i>
									<i class="fa-regular fa-star rate"></i>
								</div>
							</div>
						</div>
					</div>

					<div class="review-picture-container">
						<input type="file" name="reviewImg" id="reviewImg" accept="image/*" class="photoAttach">
						<label for="reviewImg" class="" style="width: 100%; border: 1px solid #63BDE6; border-radius: 4px; background-color: white; padding: 7px 0; color: #63BDE6; text-align: center">사진 첨부하기</label>
					</div>
					<textarea class="form-control" name="content" style="height: 150px; width: 100%; margin-top: 30px;" placeholder="20자 이상 입력해주세요."></textarea>
					<div class="review-content"></div>
				</form>

				<div class="modal-footer-custom">
					<button type="button" class="comment-submit-btn" onclick="submitComment()">완료</button>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/fragment/footer.jsp"/>

<script>
    function openReviewModal(productId, brandName, productName, stockString, orderItemId) {

        let $reviewModalProduct = $('#reviewModalProduct');
        let tag = `<div class="flex-row" style="gap: 15px; align-items: center;">
							<div class="picture-img-container">
								<img class="follow-user-item-img"
									 src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/161866122047151511.jpeg?w=1440">
							</div>
							<div class="picture-text-container">
								<div class="picture-text brand">` + brandName + `</div>
								<div class="picture-text name">` + productName + `</div>
								<div class="picture-text option">` + stockString + `</div>
							</div>
						</div>`

        $reviewModalProduct.empty();
		$reviewModalProduct.html(tag)
		$('#product-id').val(productId);
        $('#order-item-id').val(orderItemId);

		$('#reviewModal').modal('toggle');
	}

</script>

<script>
    let starBundles = document.getElementsByClassName('starBundle')[0];
    let STAR_COLOR_DEFAULT = '#63BDE6'
    let STAR_COLOR_HOVER = '#95D9F1'
    let commentForm = document.getElementById('reviewForm');

    let rateValue = 0

    // let starBundle = document.getElementsByClassName('rate');
    // let rating=0, lastStarIsFull

    let rating = -1;
    let lastStarIsFull = true

    function submitComment() {

        // 평점 댓글일 때,
        if (rateValue === '0') {
            alert('점수를 입력해주세요.')
            return
        }

        if (!commentForm.content.value) {
            if (!confirm('내용이 없습니다. 평점만 등록하시겠습니까?')) {
                return
            }
        } else {
            if (!confirm('리뷰를 등록하시겠습니까?')) {
                return
            }
        }

        commentForm.submit();
    }

    function getRating() {
        rateValue = rating + (lastStarIsFull ? 1 : 0.5);
        $('#rating').val(rateValue);
    }

    let starBundle = starBundles.getElementsByTagName('i');
    for (let i = 0; i < 5; i++) {
        starBundle[i].addEventListener('mousemove', function (e) {
            // 별 원상복구
            resetStar(starBundle)

            for (let j = 0; j <= i; j++) {
                starBundle[j].classList.replace('fa-regular', 'fa-solid')
                starBundle[j].style.color = STAR_COLOR_HOVER
            }

            let rect = starBundle[i].getBoundingClientRect();
            // 클릭한 x좌표
            let x = e.clientX - rect.left;

            if (x < rect.width / 2) {
                // 왼쪽 클릭한 경우
                starBundle[i].classList.replace('fa-star', 'fa-star-half-stroke');
            } else {
                // 오른쪽 클릭한 경우
                starBundle[i].classList.replace('fa-regular', 'fa-solid')
            }
        });

        // 마우스 땠을때 초기화
        starBundle[i].addEventListener('mouseout', function (e) {
            resetStar(starBundle)

            if (rating === -1) return;

            for (let j = 0; j <= rating; j++) {
                starBundle[j].classList.replace('fa-regular', 'fa-solid')
            }

            // lastStarIsFull이 true라면 마지막 별을 변경
            if (!lastStarIsFull) {
                starBundle[rating].classList.replace('fa-star', 'fa-star-half-stroke');
            }
        });

        // 실제로 클릭했을 때 이벤트
        starBundle[i].addEventListener('click', function (e) {
            // 현재 별 등급을 유지
            // i가 눌렸다면 i+1점
            // i-1까지 꽉찬 별, i번째 별이 반별인지 꽉찬 별인지만 적용한다.
            rating = i
            lastStarIsFull = true
            lastStarIsFull = !starBundle[i].classList.contains('fa-star-half-stroke')

            getRating();
        });
    }

    function resetStar(starBundle) {
        for (const star of starBundle) {
            star.classList.replace('fa-solid', 'fa-regular')
            star.classList.replace('fa-star-half-stroke', 'fa-star');
            star.style.color = STAR_COLOR_DEFAULT
        }
    }

</script>
</body>
</html>
