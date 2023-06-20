<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<jsp:include page="/WEB-INF/views/fragment/static-header.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menubar.css">
	<title>Home</title>
	

	<style>
        .selected-sub-item {
            font-weight: bold;
            color: #303438;
            border-bottom: 2px solid #303438;
        }

		.follow-user-item-img:hover .picture-content-container {
            color: #A0A0A0;
        }

        .upload-img-container {
			width: 40%;
			aspect-ratio: 1/1;
			background-color: #F8F9FA;
			border-radius: 4px;
			justify-content: center;
			align-items: center;
        }

        .disabledButton {
            padding: 10px 45px;
            background-color: #EBEDEF;
            color: #C3C7CC;
            border-radius: 4px
        }

        .abledButton {
            padding: 10px 45px;
            background-color: #35c5f0;
            color: white;
            border-radius: 4px;
            border-style: none;
        }

        .sub-menubar-write {
            justify-content: center;
            color: #848B93
        }
        
        .photointroduction{
      	    font-size: 15px; 
      	    padding: 10px 15px; 
      	    border: 1px solid rgb(218, 221, 224); 
      	    border-radius: 4px; 
      	    min-height: 150px
        }
        
        .photoAttach{
      	    font-size: 14px; 
      	    font-weight: 350; 
      	    border-radius: 4px; 
      	    padding: 8px 20px; 
      	    border: none; 
      	    background-color: rgb(53, 197, 240); 
      	    color: white;
      	   }
      	    
      	.custom-file-input {
		  position:  relative;
		  display: inline-block;
		  cursor: pointer;
		}
		
		.custom-file-input input[type="file"] {
		  position: absolute;
		  left: -9999px;
		}
		
		.custom-file-input label {
		  display: inline-block;
		  padding: 8px 20px;
		  background-color: #ccc;
		  color: #fff;
		  cursor: pointer;
		
        }
	</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function sendOk() {
    const f = document.housePictureBoardForm;
	let str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

    str = f.content.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/board/${mode}";
    f.submit();
}
//파일 선택 창의 파일명을 표시하는 함수
$(document).ready(function() {
    $('.custom-file-input input[type="file"]').change(function() {
        var fileName = $(this).val().split('\\').pop();
        $(this).next('label').text(fileName);
    });
});


</script>

<header>
	<div class="menubar-container">
		<div class="menubar-item-bundle" style="gap: 30px">
			<img class="logo" src="${pageContext.request.contextPath}/resources/picture/logo.png" onclick="location.href='${pageContext.request.contextPath}/home'">
		</div>

		<div class="menubar-item-bundle" style="gap: 18px">
			<button type="button" class="abledButton" onclick="sendOk();">올리기</button>
		</div>
	</div>

	<div class="sub-menubar-container" style="display: block">
		<div class="sub-menubar sub-menubar-write">
			<div class="sub-item selected-sub-item" onclick="location.href='#'">사진</div>
			<div class="sub-item" onclick="location.href='#'">동영상</div>
		</div>
	</div>
</header>

<div class="main-container" >
	<div class="content" style="max-width: 970px">
		<form name="housePictureBoardForm" method="post">
			<div class="flex-row">
				<div class="flex-col upload-img-container">
					<img style="width: 25px; height: 25px" src="${pageContext.request.contextPath}/resources/picture/camera.png">
					<div style="font-weight: 700; color: rgb(130, 140, 148); margin-bottom: 4px; margin-top: 10px;">사진을 끌어다 놓으세요</div>
					<div style="font-size: 14px; font-weight: 500; color: rgb(130, 140, 148); margin-bottom: 15px;">10장까지 올릴 수 있어요.</div>
					<div class="custom-file-input">
						<input type="file" name="selectFile" id="selectFile" class="photoAttach">
						 <label for="selectFile">PC에서 불러오기</label>
					</div>
				</div>
				<div class="flex-col" style="flex: 1; padding-left: 20px;">
					<textarea class="photointroduction"  placeholder="어떤 사진인지 짧은 소개로 시작해보세요.">${content.content}</textarea>
					<select style="margin-top: 15px; padding: 10px 15px; border: 1px solid rgb(218, 221, 224); border-radius: 4px; font-size: 15px">
						<option style="color: rgb(194, 200, 204)">공간 정보 추가</option>
						<option value="1">원룸</option>
						<option value="2">거실</option>
						<option value="3">침실</option>
						<option value="4">주방</option>
						<option value="5">욕실</option>
						<option value="6">아이방</option>
						<option value="7">드레스룸</option>
						<option value="8">서재,작업실</option>
						<option value="9">베란다</option>
						<option value="10">사무공간</option>
						<option value="11">상업공간</option>
						<option value="12">가구,소품</option>
						<option value="13">현관</option>
						<option value="14">외관,기타</option>
					</select>
				</div>
			</div>
		</form>
	</div>
</div>

<script>


</script>
</body>
</html>
