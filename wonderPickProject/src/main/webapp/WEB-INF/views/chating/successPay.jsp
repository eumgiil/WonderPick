<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<h2>결제가 완료되었습니다</h2>
${ responseText }
<p id="item_name"></p> 
<p id='quantity'></p>
<p id='amountTotal'></p>
	<script>
		$(function() {
			var result = '${ responseText }'
			$('#item_name').text('상품명 :'+result.item_name)
			$('#quantity').text('개수(그림 수정횟수) : '+result.quantity)
			$('#amountTotal').text('결제 가결 : '+result.amount.total)
		});
		 
	</script>
</body>
</html>