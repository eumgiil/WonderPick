<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
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
	<!-- 로그인 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 a 클릭 시 보임) -->
	<div class="modal fade" id="suggestModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content" style="width: 500px">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">가격제안</h4>
				</div>

				<!-- Modal body -->
				<div class="modal-body" align="center" id="modalBody">
					<img alt="이미지" src="${orderList.get(0).filePath}"> 
					<h3> ${orderList.get(0).orderContent}</h3>
					<h2>제안가격:</h2>
					<p>${totalPrice}</p>
					<button id="remove" style="float: right" onclick="removePrice();">선택제거</button>
					<button id="selectAll" style="float: right" onclick="selectAll();">전체선택</button>
					<button id="suggest" style="float: right">가격 추가</button>
					<br> <br>
					<div id="prices"></div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal" id="suggestbtn">제안하기</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<br clear="both">
	<script>
		 
         $('#suggest').click(function () {
        	 
        	$('#remove').show();
        	$('#selectAll').show();
        	
            var appendPrice = '<div class="addPriceDiv">가격추가 : <input type="number" name="price" placeholder="가격을 입력하세요"><br>'
                              +'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
                              +'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
                              +'<input type="text" class="reason" placeholder="추가사유를 입력하세요">'
                              +'&nbsp;&nbsp;<input type="checkbox" name="cancel">'
                              +'</div>'  
                              
            $('#prices').append(appendPrice)
            
         });
         
         
         function removePrice() {
        	 $(":checked").parent().remove();
        	 $('#modalBody>p').text('${totalPrice}') 
		}
         
        function selectAll() {
			$('input[name=cancel]').each(function() {
				$(this).attr('checked',true)
			})
		}
        
         $(function() {
			$('#remove').hide();
			$('#selectAll').hide();
			var originPrice = Number($('#modalBody>p').text());
			
			$('#prices').on('click','input[name=price]',function(){
				var price = Number($('#modalBody>p').text());
				var currentAddPrice = $(this).val();
				$(this).keyup(function() {
					if($(this).val()==""){
						if((price-originPrice)!=0){
							$('#modalBody>p').text(price-currentAddPrice)
						}else{
							$('#modalBody>p').text(originPrice)
						}
					}else{
						var addPrice = Number($(this).val())
						$('#modalBody>p').text(price+addPrice)
					}
				})
			})
		})
    </script>
</body>
</html>