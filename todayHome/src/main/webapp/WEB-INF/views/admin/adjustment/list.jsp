<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/views/fragment/static-header.jsp"/>
<style type="text/css">

p{
	font-weight: bold;
}


.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

h1 {
  text-align: center;
}

.status-box {
  display: flex;
  justify-content: center;
  margin-bottom: 20px;
}

.status-item {
  width: 100%;
  height: 100px;
  padding: 10px 15px;
  border: 1px solid lightgray;
  border-radius: 5px;
  margin-right: 5px;
  cursor: pointer;
}

.status-item:hover {
  border-color: blue;
}
.status-item-content{
 font-weight: bold;
}
.filters {
  border: 1px solid lightgray;
  border-radius: 5px;
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
  background: 	#F5F5F5;
  flex-direction: column;
      width: 100%; 
    padding: 20px; 
    box-sizing: border-box; 
}

.date-range {
	padding:20px;
  display: flex;
  align-items: center;
  border-radius: 5px;
}

.date-range label {
  margin-right: 5px;
  border-radius: 5px;
}

.status-filter label {
  margin-right: 5px;
  border-radius: 5px;
}

.search input[type="text"],
.search button {
  margin-left: 5px;
}
input[type="checkbox"] {
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  width: 16px;
  height: 16px;
  border: 1px solid #000;
  border-radius: 50%;
  outline: none;
  cursor: pointer;
  background-color: #fff;
}

input[type="checkbox"]:checked {
  background-color: #778899;
  }
  
  .delivery-table {
  background: white;
  padding: 20px;
  border-collapse: collapse;
  width: 100%;
}



.delivery-table th,
.delivery-table td {
  padding: 10px;
  text-align: left;
  border-bottom: 1px solid lightgray;
}

.delivery-table th {
  font-weight: bold;
}

.delivery-table tbody tr:last-child td {
  border-bottom: none;
}

.button-container  button{
    width: 10%;
    padding: 10px;
    border-radius: 5px;
    margin: 20px;
}


.styled-button button{
  margin: 0 10px;
  padding: 10px 20px;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;
}

.styled-button:hover {
  border: 2px solid blue;
  color: blue;
}
.page-navigation {
	clear: both;
	padding: 20px 0;
	text-align: center;
}
.paginate {
	clear: both;
	text-align: center;
	white-space: nowrap;
	font-size: 14px;	
}
.paginate a {
	border: 1px solid #ccc;
	color: #000;
	font-weight: 600;
	text-decoration: none;
	padding: 3px 7px;
	margin-left: 3px;
	vertical-align: middle;
}
.paginate a:hover, .paginate a:active {
	color: #6771ff;
}
.paginate span {
	border: 1px solid #e28d8d;
	color: #cb3536;
	font-weight: 600;
	padding: 3px 7px;
	margin-left: 3px;
	vertical-align: middle;
}
.paginate :first-child {
	margin-left: 0;
}
</style>
</head>
<body>
<script>
  function submitForm() {
		const f = document.searchForm;
		f.submit();
  }
</script>

<div class="body-container">
  <div class="body-title">
    <h2><i class="menu--icon  fa-fw fa-solid fa-calculator"></i> 정산 리스트 </h2>
  </div>

    
  <form id="searchForm" name="searchForm" action="${pageContext.request.contextPath}/admin/adjustment/list" method="post">
    <div class="filters">
      <div class="date-range">
        <label for="start-date">정산 날짜:</label>
        <input style="width: 20%;" type="date" name="startDate" value="${startDate}" id="startDate">
        <label for="end-date">-</label>
        <input style="width: 20%;"  type="date" name="endDate" value="${endDate}" id="endDate">
      </div>
      <hr>
      <div class="search" style="padding: 20px;">
        <label for="search-input">검색어:</label>
        <select id="search-option" name="condition">
          <option value="sellerName" ${condition == "sellerName" ? 'selected="selected"' : ''}>판매자 이름</option>
          <option value="brandName" ${condition == "brandName" ? 'selected="selected"' : ''}>브랜드 이름</option>
          <option value="businessNumber" ${condition == "businessNumber" ? 'selected="selected"' : ''}>사업자 번호</option>
        </select>
        <input type="text" id="search-input" name="keyword" value="${keyword}">
      </div>
    <hr>
    <table class="delivery-table" style="background: white; padding: 20px;">
      <thead>
        <tr>
          <th>회사 이름</th>
          <th>판매자 이름</th>
          <th>브랜드 이름</th>
          <th>사업자 번호</th>
          <th>가입 날짜</th>
          <th>전화번호</th>
          <th>이메일</th>
          <th>정산 날짜</th>
          <th>정산 금액</th>
        </tr>
      </thead>
      <c:forEach var="adjustment" items="${adminAdjustmentList}" varStatus="status">
        <tr>
          <td>${adjustment.representativeName}</td>
          <td>${adjustment.sellerName}</td>
          <td>${adjustment.brandName}</td>
          <td>${adjustment.businessNumber}</td>
          <td>${adjustment.regDate}</td>
          <td>${adjustment.tel}</td>
          <td>${adjustment.email}</td>
          <td>${adjustment.adjustmentDate}</td>
          <td>${adjustment.amount}</td>
        </tr>
      </c:forEach>
    </table>
        <div class="button-container" style="display: flex; justify-content: center;">
          <button id="reset-button" class="styled-button" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/adjustment/list';">초기화</button>
          <button id="search-button" class="styled-button" type="button" onclick="submitForm()">검색</button>
        </div>
    <div class="page-navigation">   
       ${paging}
    </div>
  </div>
  </form>
</div>
