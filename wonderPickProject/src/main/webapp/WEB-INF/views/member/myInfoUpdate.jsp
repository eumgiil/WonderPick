<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Wonder Pick</title>
<link rel="stylesheet" href="resources/css/member/myInfoUpdate.css" />
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <div class="wrap">
        <jsp:include page="leftContent.jsp" />
        <div id="rightContent">
            <p>내 정보 조회 및 수정</p>
            <div id="rightMainContent">
            	<form enctype="multipart/form-data" action="updateProfile.me" method="post">
	                <div id="rightProfile">
	                    <img src="${sessionScope.loginMember.memberFilePath }${sessionScope.loginMember.memberModifyName}">
	                    <button type="submit" id="profileBtn" >
	                    	<label for="fileInput" id="fileLabel">프로필 변경
	                    		<input id="fileInput" type="file" style="display:none;">
	                    	</label>
                    	</button>
	                </div>
            	</form>
            	<script>	
            		$('#profileBtn').on('click', function(){
            			$('#fileInput').click();
            			$('#fileInput').on('change', function(){
                			console.log(this.files);
                			if(this.files.length == 1){
                				return true;
                			} else {
                				return false;
                			}
                		});
            			return false;
            		});
            	</script>
                <form action="updateInfo.me" method="post">
	                <div id="rightInfo">
	                    <label>아이디</label><br>
	                    <input type="text" name="memberId" value="${sessionScope.loginMember.memberId}" readonly />
	                    <br>
	                    <label>이름</label><br>
	                    <input type="text" name="memberName" value="${sessionScope.loginMember.memberName}" />
	                    <br>
	                    <label>닉네임</label><br>
	                    <input type="text" name="nickName" value="${sessionScope.loginMember.nickName}" />
	                    <br>
	                    <label>전화번호</label><br>
	                    <input type="text" name="phone" value="${sessionScope.loginMember.phone}" />
	                    <br>
	                    <label>이메일</label><br>
	                    <input type="text" name="email" value="${sessionScope.loginMember.email}" />
	                    <hr>
	                    <label>주소</label><br>
	                    <input type="text" name="address" value="${sessionScope.loginMember.address}" />
	                    <br>
	                    <label>계좌번호</label><br>
	                    <input type="text" name="payAccount" value="${sessionScope.loginMember.payAccount}" />
	                    <br>
	                    <input type="checkbox" name="emailAgree"/> 이메일 수신에 동의합니다.
	                    <br>
	                    <hr>
	                    <label>회원가입 날짜</label><br>
	                    <input type="text" readonly name="enrollDate" value="${sessionScope.loginMember.enrollDate}" />
	                    <br>
	                    <label>수정날짜</label><br>
	                    <input type="text" readonly name="modifyDate" value="${sessionScope.loginMember.modifyDate}" />
	                    <input type="hidden" name="memberGrade" value="${sessionScope.loginMember.memberGrade}" />
	                    <br>
	                    <button type="submit">수정</button>
	                </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>