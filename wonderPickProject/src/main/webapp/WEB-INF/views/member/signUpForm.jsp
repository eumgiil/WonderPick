<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wonder Pick</title>
<!-- google font 스타일시트 -->
<link href="https://fonts.googleapis.com/css2?family=Geologica:wght@900&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/member/signUpForm.css">
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<div id="blankHeader"><!-- 헤더 만큼의 공간 --></div>
    <div id="mainWrap" class="clear">
        <div id="enrollLogo"><a href="main.re"><img src="resources/common/palette.png"/></a></div>
        <div>
            <div id="signUpTitle">
                <h1>회원가입</h1>
            </div>
            <div id="signUpMain" method="post">
                <form action="signUp.me">
                    <div id="signUpInput">
                        <label>* 아이디</label><br>
                        <input type="text" id="memberId" name="memberId" placeholder="아이디를 입력해주세요." required>
                        <div id="checkIdResult">첫 글자는 반드시 영문자로, 그리고 영문자, 숫자로 5~20자로<br> 입력해주세요.</div>
                        <br>
                        <label>* 비밀번호</label><br>
                        <input type="password" id="memberPwd" name="memberPwd" placeholder="비밀번호를 입력해주세요." required>
                        <div id="checkPwdResult">영문자(대소문자 포함), 숫자, 특수문자(!@#$%^)를 하나씩 포함하여  8~20자로 입력해주세요.</div>
                        <br>
                        <label>* 비밀번호 재확인</label><br>
                        <input type="password" placeholder="비밀번호를 한번 더 입력해주세요." id="memberRepwd" required>
                        <div id="checkPwdReresult">위 비밀번호와 일치하게 입력해주세요.</div>
                        <br>
                        <label>* 이름</label><br>
                        <input type="text" id="memberName" name="memberName" placeholder="이름을 입력해주세요." required>
                        <div id="checkNameResult">한글로 2글자 이상 입력해주세요. (입금자명과 동일해야합니다.)</div>
                        <br>
                        <label>* 닉네임</label><br>
                        <input type="text" id="nickName" name="nickName" placeholder="닉네임을 입력해주세요." required>
                        <div id="checkNickResult">최소 1자 이상 20자이내로 자유롭게  입력해주세요.</div>
                        <br>
                        <label>* 전화번호</label><br>
                        <input type="text" id="phone" name="phone" placeholder="전화번호를 입력해주세요." required>
                        <div id="checkPhoneResult">- 없이 숫자만 입력해주세요.</div>
                        <br>
                        <label>* 이메일</label><br>
                        <input type="email" id="email" name="email" placeholder="이메일을 입력해주세요." required>
                        <button type="button" id="checkEmail">이메일 인증</button>
                        <div id="checkEmailResult"></div>
                        <input type="text" id="emailCode" placeholder="인증번호를 입력해주세요" required>
                        <div id="checkCodeResult"></div>
                        <input type="hidden" id="memberGrade" name="memberGrade" value="${ sessionScope.memberGrade }">
                    </div>
                    <div id="signUpCheckbox">
                        <input type="checkbox" id="ToUAgree" required> 개인정보 수집/이용에 동의합니다.<br>
                        <input type="checkbox" id="emailAgree" name="emailAgree"> 이메일 수신에 동의합니다.<br>
                    </div>
                    <div>
                        <button type="submit" id="submitBtn">회원가입</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
	
	<!-- input란 focus되면 안내 문구 -->
	<script>
		// 아이디
		$('#memberId').on('focus', () => {
			$('#checkIdResult').show();
		});
		// 비밀번호
		$('#memberPwd').on('focus', () => {
			$('#checkPwdResult').show();
		});
		// 비밀번호 재확인
		$('#memberRepwd').on('focus', () => {
			$('#checkPwdReresult').show();
		});
		// 이름
		$('#memberName').on('focus', () => {
			$('#checkNameResult').show();
		});
		// 닉네임
		$('#nickName').on('focus', () => {
			$('#checkNickResult').show();
		});
		// 전화번호
		$('#phone').on('focus', () => {
			$('#checkPhoneResult').show();
		});

	</script>
	<!-- 정규표현식 검사 -->
	<script>
		$(() => {
			var errorColor = 'crimson';
			var successColor = '#FF8399';
			const $idInput = $('#signUpInput #memberId');
			const $pwdInput = $('#signUpInput #memberPwd');
			const $repwdInput = $('#signUpInput #memberRepwd');
			const $nameInput = $('#signUpInput #memberName');
			const $nickInput = $('#signUpInput #nickName');
			const $phoneInput = $('#signUpInput #phone');
			const $codeInput = $('#signUpInput #emailCode');
			
			// 아이디 정규표현식 검사, 중복검사
			$idInput.keyup(() => {	
				var regExp = /^[a-zA-Z][a-zA-Z0-9]{4,19}$/;
				if(regExp.test($idInput.val())){
					if($idInput.val().length >= 5){
						$.ajax({
							url : 'idCheck.me',
							data : { checkId : $idInput.val()},
							success : result => {
								if(result === "NNNNN"){
									$('#checkIdResult').css('color', errorColor ).text('중복된 아이디가 존재합니다.');
									$('#submitBtn').attr('disabled', true);
								} else {
									$('#checkIdResult').css('color', successColor).text('멋진 아이디내요!');
									$('#submitBtn').removeAttr('disabled');
								}
							}
						});
					} else {	
						$('#checkIdResult').css('color', errorColor ).text('5글자 이상 입력해주세요');
						$('#submitBtn').attr('disabled', true);
					}
				} else {
					$('#checkIdResult').css('color', errorColor ).text('조건이 올바르지 않습니다.');
					$('#submitBtn').attr('disabled', true);
				}
			});
			
			// 비밀번호 정규표현식 검사
			$pwdInput.keyup(() => {
				// 최소 8자 ~ 최대 20자, 문자, 숫자, 특수문자(!@#$%^)하나 포함
				regExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^]).{8,20}$/;
				if(regExp.test($pwdInput.val())){
					$('#checkPwdResult').text('');
					$('#submitBtn').removeAttr('disabled');
					$('#checkPwdResult').hide();
				} else {
					$('#checkPwdResult').css('color', errorColor ).text('조건이 올바르지 않습니다.');
					$('#submitBtn').attr('disabled', true);
				}
			});
			
			// 비밀번호 재확인
			$repwdInput.keyup(() => {
				if($repwdInput.val() == $pwdInput.val()){
					$('#checkPwdReresult').text('');
					$('#submitBtn').removeAttr('disabled');
					$('#checkPwdReresult').hide();
				} else{
					$('#checkPwdReresult').css('color', errorColor ).text('비밀번호가 동일하지 않습니다.');
					$('#submitBtn').attr('disabled', true);
				}
			});
			
			// 이름 정규표현식 검사
			$nameInput.keyup(() => {
				regExp = /^[가-힣]{2,}$/;
				if(regExp.test($nameInput.val())){
					$('#checkNameResult').text('');
					$('#submitBtn').removeAttr('disabled');
					$('#checkNameResult').hide();
					memberName = true;
				} else {
					$('#checkNameResult').css('color', errorColor ).text('조건이 올바르지 않습니다.');
					$('#submitBtn').attr('disabled', true);
				}
			});
			
			// 닉네임 정규표현식, 중복검사
			$nickInput.keyup(() => {
				regExp = /^[가-힣a-zA-Z0-9]{1,20}$/;
				if(regExp.test($nickInput.val())){
						$.ajax({
						url : 'nickCheck.me',
						data : { checkNick : $nickInput.val()},
						success : result => {
							if(result === "NNNNN"){
								$('#checkNickResult').css('color', errorColor ).text('중복된 닉네임이 존재합니다.');
								$('#submitBtn').attr('disabled', true);
							} else {
								$('#checkNickResult').css('color', successColor).text('멋진 닉네임이내요!');
								$('#submitBtn').removeAttr('disabled');
								nickName = true;
							}
						}
					});
				} else {
					$('#checkNickResult').css('color', errorColor ).text('조건이 올바르지 않습니다.');
					$('#submitBtn').attr('disabled', true);
				}
			});
			
			// 핸드폰 정규표현식
			$phoneInput.keyup(() => {
				regExp = /^[0-9]{10,11}$/;
				if(regExp.test($phoneInput.val())){
					$('#checkPhoneResult').text('');
					$('#submitBtn').removeAttr('disabled');
					$('#checkPhoneResult').hide();
				} else {
					$('#checkPhoneResult').css('color', errorColor ).text('올바른 번호를 입력해주세요.');  
					$('#submitBtn').attr('disabled', true);
				}
			});
			
			// 이메일 검사
			$('#checkEmail').on('click', () => {
				$('#checkEmailResult').show();
				if($('#signUpInput #email').val() == ''){
					$('#checkEmailResult').css('color', errorColor).text('이메일을 입력해주세요.');
				} else {
					$.ajax({
					url : 'emailCheck.me',
					data : { checkEmail : $('#signUpInput #email').val()},
					success : result => {
							if(result == 'success'){
								$('#checkEmailResult').css('color', successColor).text('이메일이 발송되었습니다.');
								$('#emailCode').focus();
							} else {
								$('#checkEmailResult').css('color', errorColor).text('이메일 발송에 실패했습니다.');
							}
						}
					})
				}
			});
			
			// 이메일 코드 체크
			$codeInput.keyup(() => {
				$('#checkCodeResult').show();
				var regExp = /^[0-9]{6}$/;
				if(regExp.test($codeInput.val())){
					if($codeInput.val().length = 6){
						$.ajax({
							url : 'codeCheck.me',
							data : { emailCode : $codeInput.val()},
							success : result => {
								if(result){
									$('#checkCodeResult').css('color', successColor).text('인증완료되었습니다.');
								} else {
									$('#checkCodeResult').css('color', errorColor).text('인증코드가 올바르지 않습니다.');
								}
							}
						})
					}
				}
				 else {
					$('#checkCodeResult').css('color', errorColor).text('올바른 코드를 입력해주세요.');
				}
			});
			
			$('#submitBtn').on('click', () => {
				if($('#signUpCheckbox #emailAgree').prop('checked')){
					$('#signUpCheckbox #emailAgree').attr('value', 'Y');
				}
				// 브라우저 console에는  값이 잘 넘어감! controller에는 값이 왜 안넘어가나??
				// 서버 console은 값이 체크되어야 넘어가기 때문에!!
			});
		});
	</script>
</body>
</html>