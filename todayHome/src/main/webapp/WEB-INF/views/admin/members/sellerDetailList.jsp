<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/fragment/static-header.jsp"/>
<style type="text/css">
.seller-layout_header {
	text-align: center;
	margin-bottom: 80px;
}

.seller-layout_header_title {
	display: block;
	font-size: 40px;
	font-weight: 700;
	color: black;
}

.seller-layout_header_explain {
	text-align: left;
	display: flex;
	flex-wrap: wrap;
	box-sizing: border-box;
}

.seller-layout_header_explain_list {
	margin: 60px auto -30px;
	list-style-type: disc;
	font-size: 15px;
	color: black;
	line-height: 38px;
}

::marker {
	unicode-bidi: isolate;
	font-variant-numeric: tabular-nums;
	text-transform: none;
	text-indent: 0px !important;
	text-align: start !important;
	text-align-last: start !important;
}

.seller-layout_divider {
	margin-top: 60px;
	margin-bottom: 60px;
	border-bottom: 1px solid #dbdbdb;
}

.seller-layout_hr {
	margin: 0;
	border: none;
}

.col-10 {
	position: relative;
	min-height: 1px;
	box-sizing: border-box;
}

.container {
	
}

.row {
	display: flex;
	flex-wrap: wrap;
	box-sizing: border-box;
	margin-right: -10px;
	margin-left: -10px;
}

.offset-1 {
	margin-left: 8.33%
}

.sales-form_section_title {
	font-size: 20px;
	color: #000;
	margin-bottom: 40px;
	font-weight: 700;
}

.sales-form_form-group {
	margin-bottom: 20px;
}

.col-2 {
	position: relative;
	width: 20%; min-height : 1px;
	box-sizing: border-box;
	min-height: 1px;
}

.sales-form_form-label {
	font-weight: 700;
	line-height: 40px;
}

.sales-form_form-group_required {
	color: #f77;
}

.col-8 {
	position: relative;
	min-height: 1px;
	box-sizing: border-box;
	padding-right: 10px;
	padding-left: 10px;
}

.sales-form_form-control-wrap {
	width: 360px;
	display: flex;
	flex-flow: wrap;
	align-items: center;
}

.sales-form_form-description {
	font-size: 12px;
	line-height: 16px;
	color: #757575;
	margin-top: 8px;
}

.sales-form_divider {
	margin: 0 5px;
}

.btn {
	box-sizing: border-box;
	display: inline-block;
	border-width: 1px;
	border-style: solid;
	text-align: center;
	border-radius: 4px;
	font-weight: bold;
}

.btn-sm {
	line-height: 1;
	height: 40px;
	padding: 12px 0 13px;
	font-size: 15px;
}

.btn-priority {
	background-color: #35c5f0;
	border-color: #35c5f0;
	color: #ffffff;
}

.form-control {
	width: 20%;
}

.form-control::placeholder {
	color: #ccc;
}
.textarea.form-control{
	resize: none;
	line-height: 20px;
	padding-top: 9px;
	padding-bottom: 9px;
	height: auto;
}
.sales-form_private-policy{
	text-align: center;
}
.sales-form_private-policy_caption{
	font-size: 12px;
	line-height: 18px;
	margin-bottom: 20px;
	text-align: left;
}
.sales-form_private-policy_info{
	width: 100%;
	margin-bottom: 40px;
	line-height: 21px;
}
table{
	border-collapse: collapse;
	border-spacing: 0;
}
thead{
	display: table-header-group;
	vertical-align: middle;
	border-color: inherit;
}
tr{
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}
td{
	display: table-cell;
	vertical-align: inherit;
	text-align: center;
}
tbody{
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
	text-align: middle;
}
.sales-form_private-policy_info thead{
	background-color: #fafafa;
}
.sales-form_private-policy_info td{
	width: 33.33%;
	border: 1px solid #dbdbdb;
	margin-top: 40px;
	padding: 10px 13px;
}
.sales-form_private-policy_agree{
	font-size: 18px;
	display: inline-block;
}
.form-check-label{
	cursor: pointer;
	display: block;
	margin-bottom: 10px;
	padding-left: 32px;
	min-height: 22px;
	line-height: 22px;
	position: relative;
}
.check-img{
	box-sizing: border-box;
	height: 22px;
	width: 22px;
	border-radius: 4px;
	background-color: #ffffff;
	border: solid 1px #dbdbdb;
	display: block;
	position: absolute;
	left: 0;
	top: 0;
}
.check-img:after{
	content: "";
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%,-50%);
	box-sizing: border-box;
	display: block;
	width: 14px;
	height: 14px;
	background-size: 14px;
	background-image: url(/resources/images/ic-checkbox.png);
	opacity: 0;
}
.sales-form_private-policy_agree_require{
	color: #35c5f0;
	font-weight: 700;
}
.sales-form_btn-apply{
	margin-top: 60px;
	text-align: center;
}
.sales-form_btn-apply>button{
	width: 360px;
	display: inline-block;
}
.btn-lg{
	line-height: 1;
	height: 70px;
	padding: 26px 0;
	font-size: 18px;
}
.btn:hover{
	background-color: #469DCA;
    color: white;
}
</style>

<script type="text/javascript">


</script>

<div class="main-container">
	<div class="content">
		<div class="container">
			<div class="seller-layout_header">
				<h2 class="seller-layout_header_title"><i class="menu--icon fa-fw fa-solid fa-user-group"></i>판매자 상세정보</h2>
			</div>
			<div class="seller-layout_divider">
				<hr class="col-10 seller-layout_hr">
			</div>
		</div>
		<div class="container seller-layout_body">
			<form class="" method="post">
				<div class="row sales-form_form-group">
					<div class="offset-1 col-2">
						<label class="sales-form_form-label">판매자 번호: <span class="sales-form_form-group_required"></span></label>
						<span class="center-content">${seller.sellerId}</span>
					</div>
				</div>
				<div class="row sales-form_form-group">
					<div class="offset-1 col-2">
						<label class="sales-form_form-label">회사 이름: <span class="sales-form_form-group_required"></span></label>
						<span class="center-content">${seller.representativeName}</span>
					</div>
				</div>
				<div class="row sales-form_form-group">
					<div class="offset-1 col-2">
						<label class="sales-form_form-label">판매자 이름: <span class="sales-form_form-group_required"></span></label>
						<span class="center-content">${seller.sellerName}</span>
					</div>
				</div>
				<div class="row sales-form_form-group">
					<div class="offset-1 col-2">
						<label class="sales-form_form-label">브랜드 이름: <span class="sales-form_form-group_required"></span></label>
						<span class="center-content">${seller.brandName}</span>
					</div>
				</div>
				<div class="row sales-form_form-group">
					<div class="offset-1 col-2">
						<label class="sales-form_form-label">사업자 번호: <span class="sales-form_form-group_required"></span></label>
						<span class="center-content">${seller.businessNumber}</span>
					</div>
				</div>
				<div class="row sales-form_form-group">
					<div class="offset-1 col-2">
						<label class="sales-form_form-label">가입 날짜: <span class="sales-form_form-group_required"></span></label>
						<span class="center-content">${seller.regDate}</span>
					</div>
				</div>
				<div class="row sales-form_form-group">
					<div class="offset-1 col-2">
						<label class="sales-form_form-label">전화번호: <span class="sales-form_form-group_required"></span></label>
						<span class="center-content">${seller.tel}</span>
					</div>
				</div>
				<div class="row sales-form_form-group">
					<div class="offset-1 col-2">
						<label class="sales-form_form-label">이메일: <span class="sales-form_form-group_required"></span></label>
						<span class="center-content">${seller.email}</span>
					</div>
				</div>
				<div class="row sales-form_form-group">
				  <div class="offset-1 col-2">
				    <label class="sales-form_form-label">상태: <span class="sales-form_form-group_required"></span></label>
				    <select class="center-content" name="status">
				      <option value="0" ${seller.status == 0 ? 'selected' : ''}>대기</option>
				      <option value="1" ${seller.status == 1 ? 'selected' : ''}>승인</option>
				      <option value="2" ${seller.status == 2 ? 'selected' : ''}>거절</option>
				      <option value="3" ${seller.status == 3 ? 'selected' : ''}>정지</option>
				    </select>
				  </div>
				</div>
				<div class="row sales-form_form-group">
					<div class="offset-1 col-2">
						<label class="sales-form_form-label">정산가능 금액: <span class="sales-form_form-group_required"></span></label>
						<span class="center-content">${seller.accumulatedAmount}</span>
					</div>
				</div>
				<div class="row sales-form_form-group">
					<div class="offset-1 col-2">
						<label class="sales-form_form-label">판매자 소개: <span class="sales-form_form-group_required"></span></label>
						<span class="center-content">${seller.presentation}</span>
					</div>
				</div>

				<div class="seller-layout_divider">
					<hr class="col-10 seller-layout_hr">
				</div>

				<div class="sales-form_btn-apply">
					<button class="btn btn-lg btn-priority" type="submit">수정 완료</button>
				</div>
			</form>
		</div>
	</div>
</div>


