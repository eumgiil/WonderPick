<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="resources/css/member/leftContent.css" />
</head>
<body>
    <div id="leftContent">
        <div id="profileContent">
            <img src="${sessionScope.loginMember.memberFilePath }${sessionScope.loginMember.memberModifyName}" />
            <div id="loginNickName">
                <h3>${sessionScope.loginMember.nickName}님</h3>
            </div>
            <c:if test="${sessionScope.loginMember.memberGrade eq '일반회원' }">
	            <div>
	                <button id="changeBtn"><span id="changeIcon" class="material-symbols-outlined">sync_alt</span> 전문가로 전환</button>
	            </div>
            </c:if>
        </div>
        <div id="categoryContent">
            <li>내 정보<span class="material-symbols-outlined">expand_more</span>
                <ul>
                    <li><a href="">내 정보 조회 및 수정</a></li>
                    <li><a href="">비밀번호 변경</a></li>
                    <li><a href="">회원 탈퇴</a></li>
                </ul>
            </li>
            <li>나의 활동<span class="material-symbols-outlined">expand_more</span>
                <ul>
                    <li><a href="">내가 작성한 글 / 댓글</a></li>
                    <li><a href="">좋아요</a></li>
                    <li><a href="">구독</a></li>
                </ul>
            </li>
            <li>거래내역<span class="material-symbols-outlined">expand_more</span>
                <ul>
                    <li><a href="">장바구니</a></li>
                    <li><a href="">주문확인</a></li>
                    <li><a href="">리뷰</a></li>
                </ul>
            </li>
            <li><a href="">쪽지함</a></li>
            <li><a href="">1 대 1 문의</a></li>
            <li><a href="chating.co">채팅</a></li>
        </div>
    </div>
</body>
</html>