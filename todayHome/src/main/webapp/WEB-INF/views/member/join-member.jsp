<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/fragment/static-header.jsp" />
<meta charset="UTF-8">
<title>회원가입</title>
<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 1000px;
}

.main {
	width: 100%;
	display: flex;
	flex-direction: column;
	gap: 10px
}

.main-form {
	margin: 0 auto;
	border-style: none;
}

.sns-login {
	font-size: 12px;
	color: #757575;
	text-align: center;
}

form {
	width: 360px;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

h1 {
	text-align: center;
}

.memberinfo {
	margin-bottom: 30px;
}

.terms {
	margin-bottom: 20px;
	font-size: 14px;
}

label {
	font-weight: bold;
}

input[type="password"], input[type="text"] {
	width: 330px;
	padding: 0 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	line-height: 30px;
}

input[id="email"], input[id="email-domain"] {
	width: 135px;
	padding: 0 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	line-height: 30px;
	margin-top: 12px;
}

input[name="confirm-password"] {
	margin-top: 12px;
}

.email-separator {
	font-size: 15px;
	color: #dbdbdb;
}

.email-certify {
	margin-bottom: 12px;
}

.check {
	color: #828c94;
	font-size: 13px;
	margin: 0 0 10px;
}

.class {
	margin-top: 12px;
}

button {
	width: 100%;
	padding: 10px;
	background-color: #35c5f0;
	border: none;
	border-radius: 4px;
	color: #fff;
	font-weight: bold;
	cursor: pointer;
}

.must {
	color: #009fce;
	font-size: 12px;
}

.select {
	color: #828c94;
	font-size: 12px;
}

.already {
	margin: 0 auto;
	font-size: 12px;
}
</style>
<script>
function toggleAll() {
  var checkboxes = document.querySelectorAll('input[type="checkbox"]');
  var toggleCheckbox = document.getElementById('all');

  checkboxes.forEach(function(checkbox) {
    checkbox.checked = toggleCheckbox.checked;
  });
}

function memberOk() {
	const f = document.memberForm;
	let str;

	let mode = "${mode}";
	if(mode === "member" && f.userIdValid.value === "false") {
		str = "아이디 중복 검사가 실행되지 않았습니다.";
		$("#userId").parent().find(".help-block").html(str);
		f.userId.focus();
		return;
	}
	
	str = f.password.value;
	if( !/^(?=.*[a-zA-Z])(?=.*\d).{8,}$/.test(str) ) { 
		alert("패스워드를 다시 입력 하세요. ");
		f.password.focus();
		return;
	}

	if( str !== f.confirm-password.value ) {
        alert("패스워드가 일치하지 않습니다. ");
        f.confirm-password.focus();
        return;
	}
	

    
    
   	f.action = "${pageContext.request.contextPath}/member/${mode}";
    f.submit();
	
	
}

function emailCheckOk() {
	
	var email1 = document.getElementById('email');
	var email2 = document.getElementById('email-domain');
	
	var email = email1.value + "@" + email2.value;
	
	str = email1.value.trim();
    if( !str ) {
        alert("이메일을 입력하세요. ");
        f.email1.focus();
        return;
    }

    str = email2.value.trim();
    if( !str ) {
        alert("이메일을 입력하세요. ");
        f.email-domain.focus();
        return;
    }

	
	/* console.log(email) */
    
    $.ajax({
        url: "${pageContext.request.contextPath}/member/email-check",
        type: 'GET',
        data: 'email=' + email,
        dataType: 'text',
        success: function(response) {
            if (response === 'true') {
            	alert('이미 존재하는 이메일입니다. 다른 이메일을 입력해주세요.');
            } else {
            	alert('사용가능 한 이메일입니다. ');
            }
        },
        error: function(xhr, status, error) {
            alert('서버와의 연결이 불안정합니다.');
        }
    });
}
	
function nickNameCheckOk() {
	
	var nickName = document.getElementById('nickName');

	let str = nickName.value;
    if( !str ) {
        alert("닉네임을 입력하세요. ");
        nickName.focus();
        return;
    }

    if(! /^.{2,15}$/.test(str) ) {
        alert("닉네임을 다시 입력하세요. ");
        nickName.focus();
        return;
    }

	
	/* console.log(email) */
    
    $.ajax({
        url: "${pageContext.request.contextPath}/member/nickName-check",
        type: 'GET',
        data: 'nickName=' + nickName.value,
        dataType: 'text',
        success: function(response) {
            if (response === 'true') {
            	alert('안돼!')
            } else {
            	alert('돼!!')
            }
        },
        error: function(xhr, status, error) {
            // 요청이 실패했을 때 실행되는 코드
        }
    });
}
</script>
</head>
<body>
	<div class="main">
		<h1>회원가입</h1>

		<form class="main-form" name="memberForm"
			action="${pageContext.request.contextPath}/join" method="post">
			<div style="text-align: center; margin-bottom: 20px; color: orange">${msg }</div>
			<div class="sns-login">SNS계정으로 간편하게 회원가입</div>
			<hr>

			<label class="label1" for="email">이메일</label>
			<div class="memberinfo">
				<input type="text" id="email" name="email" placeholder="이메일을"
					required> <span class="email-separator">@</span> <input
					type="text" id="email-domain" name="email-domain"
					placeholder="입력해주세요" required>
			</div>

			<button class="email-certify" type="button" onclick="emailCheckOk();">이메일
				인증하기</button>

			<div class="memberinfo">
				<label for="password">비밀번호 <br></label>
				<div class="check">영문, 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요.</div>
				<input type="password" id="password" name="password"
					placeholder="비밀번호" required>
			</div>

			<div class="memberinfo">
				<label for="confirm-password">비밀번호 확인</label> <input type="password"
					id="confirm-password" name="confirm-password" placeholder="비밀번호 확인"
					required>
			</div>

			<div class="memberinfo">
				<label for="nickname">닉네임</label>
				<div class="check">다른 유저와 겹치지 않도록 입력해주세요. (2~15자)</div>
				<input type="text" id="nickName" name="nickName"
					placeholder="별명(2~15자)" required>
			</div>
			<button class="nickName-certify" type="button" onclick="nickNameCheckOk();">닉네임
				확인하기</button>

			<div>
				<div class="terms-all">
					<input type="checkbox" id="all" name="all" onclick="toggleAll()">
					<label for="all">전체 동의</label> <label class="select">선택항목에
						대한 동의 포함</label>
				</div>

				<hr>

				<div class="terms">
					<input type="checkbox" id="age" name="age" required> <label
						for="age">만 14세 이상입니다</label> <label class="must">(필수)</label>
				</div>

				<div class="terms">
					<input type="checkbox" id="terms-agreement" name="terms-agreement"
						required> <label for="terms-agreement">이용약관</label> <label
						class="must">(필수)</label>
				</div>

				<div class="terms">
					<input type="checkbox" id="privacy" name="privacy" required>
					<label for="privacy">개인정보수집 및 이용동의</label> <label class="must">(필수)</label>
				</div>

				<div class="terms">
					<input type="checkbox" id="marketing" name="marketing"> <label
						for="marketing">개인정보 마케팅 활용 동의</label> <label class="select">(선택)</label>
				</div>

				<div class="terms">
					<input type="checkbox" id="event" name="event"> <label
						for="event">이벤트, 쿠폰, 특가 알림 메일 및 SMS 등 수신</label> <label
						class="select">(선택)</label>
				</div>
			</div>

			<button type="submit" onclick="memberOk();">회원가입</button>

		</form>

		<p class="already">
			이미 아이디가 있으신가요? <a href="${pageContext.request.contextPath}/login"
				class="login">로그인</a>
		</p>
	</div>
</body>
</html>
