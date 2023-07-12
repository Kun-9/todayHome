<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<style>
    .my-page-item {
        position: relative;
    }

    .selected-my-page-item {
        color: rgb(53, 197, 240);
    }

    .triangle {
        width: 0px;
        height: 0px;
        border-bottom: 10px solid #666666;
        border-left: 6px solid transparent;
        border-right: 6px solid transparent;
        border-top: 15px solid #666666;
    }

    .select-arrow {
        position: relative;
        width: 0;
        height: 0;
        border-left: 5px solid transparent;
        border-right: 5px solid transparent;
        border-bottom: 12px solid #EBEDEF;
    }

    .select-arrow::before {
        content: '';
        position: absolute;
        top: 2px;
        left: -5px;
        width: 0;
        height: 0;
        border-left: 5px solid transparent;
        border-right: 5px solid transparent;
        border-bottom: 12px solid white;
    }

    .arrow-container {
        position: absolute;
        left: 50%;
        bottom: -1px;
        transform: translate(-50%, 0)
    }

    .my-page-menubar-main {
        /*padding: 0 92px;*/
        border-top: 1px solid #EBEDEF;
        display: none;
        margin: 0;
    }

    .my-page-menubar-sub {
        border-top: 1px solid #EBEDEF;
        display: none;
        margin: 0;
    }
    
    .cart-cnt {
	    color: white;
	    font-size: 10px;
	    font-weight: 700
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menubar.css">


<header>
    <div class="menubar-container">
        <div class="menubar-item-bundle" style="gap: 30px">
            <img class="logo" src="${pageContext.request.contextPath}/resources/picture/logo.png" onclick="location.href='${pageContext.request.contextPath}/home'">
            <div class="menubar-item" onclick="location.href='${pageContext.request.contextPath}/home'">커뮤니티</div>
            <div class="menubar-item" onclick="location.href='${pageContext.request.contextPath}/shop/home'">쇼핑</div>
        </div>

        <div class="menubar-item-bundle" style="gap: 18px">

            <%-- 통합 검색바 --%>
            <div class="search-input-bundle">
                <input class="search-box" type="text" placeholder="통합검색">
                <i class="bi bi-search"></i>
            </div>

            <%-- 로그인 --%>
			<c:if test="${sessionScope.sessionInfo.userRole == 1 || sessionScope.sessionInfo.userRole == 2 && not empty sessionScope.sessionInfo}">
				<i class="bi bi-bookmark menubar-icon"></i>
				
				<div style="position: relative">
				 <i class="bi bi-bell menubar-icon" onclick="location.href='${pageContext.request.contextPath}/notification'"></i>
				<c:if test="${sessionScope.notificationCount != 0 && not empty sessionScope.sessionInfo}">
					<div class="cart-badge">
						<span class="cart-cnt">${sessionScope.notificationCount}</span>
					</div>
				</c:if>
	
			</div>
			</c:if>
            <%--            --%>

            <div style="position: relative">
                <i class="bi bi-cart menubar-icon" onclick="location.href='${pageContext.request.contextPath}/cart/list'"></i>

                <%-- 장바구니에 상품 없을시 표시 X --%>
               <c:if test="${sessionScope.dataCartCount != 0 && not empty sessionScope.sessionInfo}">
	                <div class="cart-badge">
	                    <span class="cart-cnt">${sessionScope.dataCartCount}</span>
	                </div>
               </c:if>
         

            </div>
            <%-- 로그인 --%>
			<c:if test="${sessionScope.sessionInfo.userRole == 1 || not empty sessionScope.sessionInfo}">
				<div class="btn-group" role="group">
					<c:if test="${empty sessionScope.sessionInfo.profileImgName}">
					<img class="menubar-profile-img dropdown-toggle" src="${pageContext.request.contextPath}/resources/picture/default-profile.png" onclick="location.href='#'"
						 data-bs-toggle="dropdown"
						 aria-expanded="false">
					</c:if>
					<c:if test="${not empty sessionScope.sessionInfo.profileImgName}">
					<img class="menubar-profile-img dropdown-toggle" src="${pageContext.request.contextPath}/resources/picture/member/${sessionScope.sessionInfo.profileImgName}" onclick="location.href='#'"
						 data-bs-toggle="dropdown"
						 aria-expanded="false">
					</c:if>

					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/${sessionScope.sessionInfo.memberId}">마이페이지</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/order">나의 쇼핑</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/event/list">이벤트</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/seller/join">판매자 신청</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/seller/login">판매자 페이지</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/qnalist">고객센터</a></li>
						<li><a class="dropdown-item" href="javascript:void(0)" onclick="logout()" >로그아웃</a></li>
					</ul>
				</div>
			</c:if>
            <%----%>

<%--            로그인 아닐시--%>
			<c:if test="${sessionScope.sessionInfo.userRole == 0 || empty sessionScope.sessionInfo}">
				<div class="menubar-text"><a style="text-decoration: none; color: black" href="${pageContext.request.contextPath}/login">로그인</a></div>
				<div class="menubar-text"><a style="text-decoration: none; color: black" href="${pageContext.request.contextPath}/join">회원가입</a></div>
				<div class="menubar-text"><a style="text-decoration: none; color: black" href="${pageContext.request.contextPath}/login">고객센터</a></div>
			</c:if>

            <div class="btn-group" role="group">
                <button type="button" class="btn dropdown-toggle write-btn" data-bs-toggle="dropdown"
                        aria-expanded="false">글쓰기
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/community/picture/write">사진/동영상 올리기</a></li>
                    <li><a class="dropdown-item" href="#">집들이 글쓰기</a></li>
<%--                    <li><a class="dropdown-item" href="#">노하우 글쓰기</a></li>--%>
                    <li><a class="dropdown-item" href="#">상품 리뷰 쓰기</a></li>
                </ul>
            <c:if test="${sessionScope.sessionInfo.userRole == 2 && not empty sessionScope.sessionInfo}">
				<div class="p-2">
					<a href="${pageContext.request.contextPath}/admin" title="관리자"><i class="bi bi-gear"></i></a>
				</div>					
			</c:if>
            </div>
        </div>
    </div>

    <div class="sub-menubar-container">
        <div class="sub-menubar">
            <div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/home'">홈</div>
            <div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/community/follow/feed'">팔로잉</div>
            <div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/community/picture/picture-list'">사진</div>
            <div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/community/house-warming/list'">집들이</div>
            <div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/event/list'">이벤트</div>
        </div>
    </div>

    <div class="sub-menubar-container">
        <div class="sub-menubar">
            <div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/shop/home'">쇼핑홈</div>
            <div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/shop/category/1'">카테고리</div>
            <div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/shop/ranks'">베스트</div>
            <div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/shop/today-deals'">오늘의딜</div>
        </div>
    </div>

    <div class="my-page-menubar-main">
        <div class="sub-menubar" style="justify-content: center; font-weight: 700; line-height: 30px; font-size: 18px">
            <div class="sub-item my-page-item" onclick="location.href='${pageContext.request.contextPath}/mypage/all'">프로필
                <div class="arrow-container"></div>
            </div>
            <div class="sub-item my-page-item" onclick="location.href='${pageContext.request.contextPath}/community/follow/feed'">나의 쇼핑
                <div class="arrow-container"></div>
            </div>
            <div class="sub-item my-page-item" onclick="location.href='${pageContext.request.contextPath}/reviews/write'">나의 리뷰
                <div class="arrow-container"></div>
            </div>
            <div class="sub-item my-page-item" onclick="location.href='${pageContext.request.contextPath}/mypage/edit'">설정
                <div class="arrow-container"></div>
            </div>
        </div>
    </div>

    <div class="my-page-menubar-sub">
        <div class="sub-menubar" style="justify-content: center;">
            <div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/mypage/${sessionScope.sessionInfo.memberId}'">모두보기</div>
            <div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/mypage/${sessionScope.sessionInfo.memberId}/photo'">사진</div>
            <div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/mypage/${sessionScope.sessionInfo.memberId}/houses'">집들이</div>
            <div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/mypage/${sessionScope.sessionInfo.memberId}/book'">스크랩북</div>
            <div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/mypage/${sessionScope.sessionInfo.memberId}/like'">좋아요</div>
        </div>
    </div>

	<div class="my-page-menubar-sub">
		<div class="sub-menubar" style="justify-content: center;">
			<div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/mypage/order'">주문배송내역 조회</div>
			<div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/community/follow/feed'">상품 스크랩북</div>
			<div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/community/picture/list'">나의문의내역</div>
			<div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/mypage/point'">포인트</div>
			<div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/mypage/notice'">공지사항</div>
			<div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/community/house-warming/list'">고객센터</div>
		</div>
	</div>

	<div class="my-page-menubar-sub">
		<div class="sub-menubar" style="justify-content: center;">
			<div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/reviews/write'">리뷰쓰기</div>
			<div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/reviews/my-reviews/best'">내가 작성한 리뷰</div>
		</div>
	</div>

	<div class="my-page-menubar-sub">
		<div class="sub-menubar" style="justify-content: center;">
			<div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/mypage/${sessionScope.sessionInfo.memberId}/edit'">회원정보수정</div>
			<div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/mypage/${sessionScope.sessionInfo.memberId}/pwd'">비밀번호 변경</div>
			<div class="sub-item" onclick="location.href='${pageContext.request.contextPath}/community/follow/feed'">사용자 숨기기 설정</div>
		</div>
	</div>

</header>

<script>
    function logout(){
        let f = document.createElement('form');
        f.setAttribute('method', 'post');
        f.setAttribute('action', '${pageContext.request.contextPath}' + '/logout')

        document.body.appendChild(f);
        f.submit();
    }
</script>