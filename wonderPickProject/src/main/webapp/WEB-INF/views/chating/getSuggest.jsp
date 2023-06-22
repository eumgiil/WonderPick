<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<!-- jQuery 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Alertify Framework -->
<!-- JavaScript -->
<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
<style>
div {
	box-sizing: border-box;
}

#header {
	width: 80%;
	height: 100px;
	padding-top: 20px;
	margin: auto;
}

#header>div {
	width: 100%;
	margin-bottom: 10px;
}

#header_1 {
	height: 80%;
}

#header_2 {
	height: 60%;
}

#header_1>div {
	height: 100%;
	float: left;
}

#header_1_left {
	width: 30%;
	position: relative;
}

#header_1_center {
	width: 40%;
}

#header_1_right {
	width: 30%;
}

#header_1_left>img {
	height: 100%;
	position: absolute;
	margin: auto;
	top: 0px;
	bottom: 0px;
	right: 0px;
	left: 0px;
}

#header_1_right {
	text-align: center;
	line-height: 35px;
	font-size: 12px;
	text-indent: 35px;
}

#header_1_right>a {
	margin: 5px;
}

#header_1_right>a:hover {
	cursor: pointer;
}

#header_2>ul {
	width: 100%;
	height: 100%;
	list-style-type: none;
	margin: auto;
	padding: 0;
}

#header_2>ul>li {
	float: left;
	width: 25%;
	height: 100%;
	line-height: 55px;
	text-align: center;
}

#header_2>ul>li a {
	text-decoration: none;
	color: black;
	font-size: 18px;
	font-weight: 900;
}

#header_2 {
	border-top: 1px solid lightgray;
}

#header a {
	text-decoration: none;
	color: black;
}

/* 세부페이지마다 공통적으로 유지할 style */
.content {
	background-color: rgb(247, 245, 245);
	width: 80%;
	margin: auto;
}

.innerOuter {
	border: 1px solid lightgray;
	width: 80%;
	margin: auto;
	padding: 5% 10%;
	background-color: white;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<br><br><br><br>
	<div style="width: 100%" align="center">
		<div class="modal-content" style="width: 500px">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">가격제안</h4>
				<h6>게시글 제목</h6>
			</div>

			<!-- Modal body -->
			<div class="modal-body" align="center" id="modalBody">
				<img alt="" src="대표 이마지"> <small>샘플 예시</small>
				<h3>수량:여기에 el구분으로 불러올거임 그거 가져다 쓰면 됌 지금은 1</h3>
				<h3 id="title">제안가격:</h3>
				<h3 id="totalprice"></h3>
				원 <br> <br>
				<div id="prices">
					<c:choose>
						<c:when test="${ not empty suggestList  }">
							<c:forEach var="c" items="${ suggestList }">
								<div class="addPriceDiv">
									가격추가 : <input type="number" class="price" readonly value="${ c.addPrices }"><br>'
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="text" class="reason" value="${c.request}">
									<input type="hidden" class="optionNo" value="${ c.optionNo }">
								</div>
							</c:forEach>
						</c:when>
					</c:choose>
				</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button class="btn btn-primary" id="accept-btn">수락하기</button>
				<c:if test="${loginMember.memberNo!=artistNo }">
					<button type="button" class="btn btn-primary" id="suggestbtn"onclick="kakaoPay();">결제하기</button>
				</c:if>
				<form action="removeCondition">
					<input type="hidden" name="rejectList">
					<input type="hidden" name="roomName" value="${ roomName }">
					<input type="hidden" name="boardNo" value="${ suggestList.get(0).boardNo }">
					<button class="btn btn-danger">거절하기</button>
				</form>
				<script>
						var rejectList = []
						$('.optionNo').each(function() {
							rejectList.push($(this).val())
						})
						$('input[name=rejectList]').val(rejectList)
				</script>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			if($('#suggestbtn').length!=0){
				$('#suggestbtn').hide();
				if(${ac.memberCheck eq "Y" and ac.artistCheck eq "Y"}){
					$('#suggestbtn').show();
				}
				if(${not ac.memberCheck eq "Y" and ac.artistCheck eq "Y"}){
					$('#suggestbtn').hide();
				}
			}
			$('input[name=selectToRemove]').hide()
			
			var priceCount = Number('${ originPrice }')
			$('.price').each(function() {
				priceCount = priceCount + Number($(this).val())
			})
			$("#totalprice").text(priceCount);
		});
		
		$('#accept-btn').click(function() {
			
			var artist = 0;
			alert('${loginMember.memberNo==artistNo}')
			if(${loginMember.memberNo==artistNo}){
				artist=1;
			}
			alert(artist)
			$.ajax({
				url : 'updatetAcceptCondition.co',
				data : {
					artistNo : artist,
					boardNo : '${suggestList.get(0).boardNo}',
					roomName : '${roomName}'
				},
				success : function(result) {
					if(result=='Y'){
						if($('#suggestbtn').length!=0){
							$('#suggestbtn').show();
						}
					}
				}
			
			})
		})
		

		function kakaoPay() {
			var title = $('#title').text();
			var total_amount = $("#totalprice").text()
			$.ajax({
				url : 'kakaoPay.ko',
				data : {
					item_name : title,
					quantity : 1, //그림 수량 주문하기에서 끌어와야함 끌어올 시점 정하기
					total_amount : total_amount
				},
				success : function(data) {
					window.open(data.next_redirect_pc_url);
				}
			});
		}
	</script>
</body>
</html>