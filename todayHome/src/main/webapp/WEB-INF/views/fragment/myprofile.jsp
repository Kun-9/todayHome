<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

    /*
	   ----------------
		 myinfo
	   ----------------
	   */
    .myinfo-wrapper {
        position: sticky;
        top: 0;
        align-self: flex-start;
        min-width: 280px;
        padding: 10px 0;
    }

    .myinfo {
        padding: 30px 25px 18px;
        border: 1px solid #d7d7d7;
        border-radius: 5px;
        box-shadow: 0 0 8px -6px #000000;
    }

    .myinfo .myinfo-profile {
        position: relative;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: 0px;
    }

    .myinfo .share-icon {
        position: absolute;
        top: -10px;
        right: -10px;
        cursor: pointer;
    }

    .myinfo .myinfo-profile .image-wrapper {
        width: 120px;
        height: 120px;
        margin-bottom: 20px;
    }

    .myinfo .myinfo-profile .image-wrapper img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
        border-radius: 50%;
    }

    .myinfo .myinfo-profile h2 {
        margin: 0;
        margin-bottom: 15px;
    }

    .myinfo .myinfo-profile .follow-wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0;
        margin-bottom: 20px;
    }

    .myinfo .myinfo-profile .follow-wrapper dt,
    .myinfo .myinfo-profile .follow-wrapper dd {
        margin: 0;
        font-size: 13px;
        margin-right: 8px;
        line-height: 1;
    }

    .myinfo .myinfo-profile .follow-wrapper dt {
        color: #828C94;
    }

    .myinfo .myinfo-profile .follow-wrapper dd {
        color: #525B61;
        font-weight: 600;
    }

    .myinfo .myinfo-profile .follow-wrapper dd:nth-of-type(1)::after {
        display: inline-block;
        content: '';
        height: 10px;
        border-right: 1px solid #d1d1d1;
        margin-left: 8px;
    }

    .myinfo .myinfo-profile .follow-wrapper dd:nth-of-type(2) {
        margin-right: 0;
    }

    .myinfo .myinfo-profile .setting {
        background-color: #ffffff;
        color: #292929;
        font-size: 12px;
        padding: 7px 16px 8px;
        border: 1px solid #d1d1d1;
        border-radius: 4px;
        cursor: pointer;
    }

    .myinfo .myinfo-profile .setting:hover {
        opacity: .6;
    }

    .myinfo .line {
        border-bottom: 1px solid #d1d1d1;
        margin: 20px 0;
    }

    .myinfo .myinfo-history {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .myinfo .myinfo-history .myinfo-history-item {
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: center;
        cursor: pointer;
        gap: 5px;
    }

    .myinfo .myinfo-history .myinfo-history-item span {
        color: #424242;
        font-size: 13px;
    }

    .myinfo .myinfo-history .myinfo-history-item em {
        font-style: normal;
        font-weight: 600;
        color: #525B61;
    }

    .myinfo .myinfo-history .myinfo-history-scrap {

    }

    .myinfo-wrapper .reward-box {
        display: block;
        text-decoration: none;

        color: #3F474D;
        font-size: 14px;
        background-color: #EFFBFF;
        padding: 15px 0;
        border-radius: 5px;
        margin-top: 14px;
        text-align: center;
    }

    .myinfo-wrapper .reward-box strong {
        font-weight: 600;
        color: #35C5F0;
    }

    /*
	----------------
	  myinfo-list
	----------------
	*/
    .myinfo-list {
        flex-grow: 1;
    }

    .myinfo-list .myinfo-list-pictures {
        margin-bottom: 100px;
    }

    .myinfo-list .myinfo-list-pictures .picture-header,
    .myinfo-list .myinfo-list-house .house-header {
        display: flex;
        justify-content: flex-start;
        align-items: center;
        margin-bottom: 10px;
    }

    .myinfo-list .myinfo-list-pictures .picture-header h2,
    .myinfo-list .myinfo-list-house .house-header h2 {
        font-size: 18px;
        margin: 0;
        margin-right: 8px;
    }

    .myinfo-list .myinfo-list-pictures .picture-header strong,
    .myinfo-list .myinfo-list-house .house-header strong {
        color: #35C5F0;
        font-size: 18px;
    }

    .myinfo-list .myinfo-list-pictures .picture-list,
    .myinfo-list .myinfo-list-house .house-list {
        text-decoration: none;

        display: flex;
        justify-content: center;
        align-items: center;
        border: 1px dashed #d9d9d9;
        height: 180px;
        color: #757575;
        font-size: 13px;
        font-weight: 600;
    }
</style>

		<c:choose>
			<c:when test="${sessionScope.sessionInfo.memberId == member.memberId}">
			<div class="myinfo-wrapper">
				<div class="myinfo">
					<div class="myinfo-profile">
						<div class="share-icon">
							<i class="bi bi-share"></i>
						</div>
						<div class="image-wrapper">
							<img alt="" src="${pageContext.request.contextPath}/resources/picture/member/${member.profileImgName}">
						</div>
						<h2>${member.nickName}</h2>
						<dl class="follow-wrapper">
							<dt class="follower">팔로워</dt>
							<dd class="follower-data" onclick="location.href='${pageContext.request.contextPath}/mypage/${member.memberId }/follower'">${followerCount}</dd>
							<dt class="following">팔로잉</dt>
							<dd class="follower-data" onclick="location.href='${pageContext.request.contextPath}/mypage/${member.memberId }/followee'">${followeeCount}</dd>
						</dl>
						<button class="setting" type="button" onclick="location.href='${pageContext.request.contextPath}/mypage/${member.memberId}/edit'">설정</button>
					</div>

					<p class="line"></p>

					<div class="myinfo-history">
						<div class="myinfo-history-scrap myinfo-history-item">
							<i class="bi bi-bookmark-check"></i> <span>스크랩북</span>
							<em>9</em>
						</div>
						<div class="myinfo-history-like myinfo-history-item">
							<i class="bi bi-heart"></i> <span>좋아요</span>
							<em>1</em>
						</div>
						<div class="myinfo-history-coupon myinfo-history-item">
							<i class="bi bi-ticket"></i> <span>내
                           쿠폰</span> <em>${couponCount}</em>
						</div>
					</div>
				</div>

				<a class="reward-box" href="#"> <b>취향 공유하고 </b><strong>리워드
					받기</strong>
				</a>
			</div>
			</c:when>
				<c:otherwise>
			<div class="myinfo-wrapper" style="width: 210px">
				<div class="myinfo" style="width: 210px">
					<div class="myinfo-profile">
						<div class="share-icon">
							<i class="bi bi-share"></i>
						</div>
						<div class="image-wrapper">
							<img alt="" src="${pageContext.request.contextPath}/resources/picture/member/default-profile.png">
						</div>
						<h2>${member.nickName}</h2>
						<dl class="follow-wrapper">
							<dt class="follower">팔로워</dt>
							<dd class="follower-data" onclick="location.href='${pageContext.request.contextPath}/mypage/${member.memberId }/follower'">${followerCount}</dd>
							<dt class="following">팔로잉</dt>
							<dd class="follower-data" onclick="location.href='${pageContext.request.contextPath}/mypage/${member.memberId }/followee'">${followeeCount}</dd>
						</dl>
						<button class="setting" style="border-color: #35c5f0; background-color: #35c5f0; color: #fff;" type="button">팔로우</button>
					</div>
				</div>
			</div>
				</c:otherwise>
			</c:choose>