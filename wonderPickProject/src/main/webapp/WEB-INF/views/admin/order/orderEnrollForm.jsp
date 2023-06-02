<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
        .orderList{
            border: 1px solid black;
            width: 900px;
            
        }
</style>
</head>

<body>
	<br><br>
	<div class="order" align="center">
			<h2 align="center" style="color: rgb(255, 131, 153);">주문하기</h2>
			<hr style="width: 600px; border: 1px solid gray;">

			<br>		<br>

 
			<div class="orderList"  id="" style="width: 600px;" align="center">
       <br>		<br>
				<form action="" method="get">
				<table align="center">
					<tr>
						<th>닉네임</th>
						<td name="nickName">이작가</td>
					</tr>
					<tr>
						<th>주문자</th>
						<td name="memberNo">김의뢰</td>
					</tr>
					<tr>
						<th width="150">카테고리</th>
						<td width="250"><select name="category" id="selectBox" required>
								<option value="">--선택--</option>
								<option value="D">그림</option>
								<option value="R">의뢰</option>
								<option value="G">굿즈</option>
								<option value="A">광고</option>
							</select>
						
						</td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="text" id="number" size="50" name="price" required></td>
					</tr>
					<tr>
						<th>기본사이즈</th>
						<td><input type="text" size="50" name="defaultSize" required></td>
					</tr>
					<tr>
						<th>수정횟수</th>
						<td><input type="text" size="50" name="count" required></td>
					</tr>
					<tr>
						<th>작업시작일</th>
						<td><input type="date" name="startDate" required></td>
					</tr>
					<tr>
						<th>작업소요일</th>
						<td><input type="text" size="50" name="workday" required></td>
					</tr>

</table>

				<br> <br>
				<div align="center">
					<button type="submit" class="btn btn-info" style="width: 100px; height: 40px; 
					background-color:  rgb(255, 131, 153); color: black; border: none;">작성하기</button>
					<button type="reset" class="btn btn-info" style="width: 100px; height: 40px; 
					background-color:  rgb(255, 131, 153); color: black; border: none;">취소하기</button>
				</div>
				<br> <br>

			</form>


			<br>
			<br>

		</div>
	</div>
	<script>

		// 가격 원 단위 찍기
		const input = document.querySelector('#number');
		input.addEventListener('keyup', function(e) {
		let value = e.target.value;
		value = Number(value.replaceAll(',', ''));
		if(isNaN(value)) {
			input.value = 0;
		}else {
			const formatValue = value.toLocaleString('ko-KR');
			input.value = formatValue;
		}
		})
		
	</script>
</body>
</html>