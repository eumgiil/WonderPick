<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>kakaoPay api 이용하기</h1>

	<button onclick="test();">카카오페이로 결제하기</button>

	<script>
		function test() {
			$.ajax({
				url : 'kakaoPay.ko',
				success : function(data) {
					window.open(data.next_redirect_pc_url);
				}
			});
		}
	</script>
</body>
</html>