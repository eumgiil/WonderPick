<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Document</title>
<style>
#chatingMain {
	width: 1500px;
	height: auto;
}

#chatingList {
	width: 22%;
	height: 100%;
	float: left;
	position: relative;
}

.chatingOne {
	width: 100%;
}

.profileIMG {
	width: 10%;
	height: 35px;
	float: left;
}

#chatingContent {
	width: 60%;
	height: 35px;
	float: right;
}

#chatSearchDiv {
	height: 10%;
}

#chatingView {
	height: 60%;
}

#inputText {
	height: 20%;
}

#chatingMenu {
	height: 10%;
}

#chating {
	width: 78%;
	height: 100%;
	float: right;
}

#sendBtn {
	margin-top: 25px;
	margin-right: 10px;
	float: right;
}

#buttons {
	position: absolute;
	bottom: 0;
}

#sendBtn>button{
		width : 100px;
		height : 40px;
		color : white;
        margin : auto;
        border-radius : 20%;
        background-color: #FF8399;
        border : none;
 }
    
/* ----------- emoticon --------------- */

#emoticon_area{
	width: 500px;
	height: 500px;
	background-color: yellow;
	position: absolute;
	top: 200px;
	right:200px;

	display: none;

	box-shadow: 1px 1px 10px rgb(200, 200, 200);
}
.emoticon_div{
	border: 1px solid black;
}
#emo_img{
	display: inline;
}
#emoticon_image{
	border: 1px solid black;
	width: 100px;
	height: 100px;
}
#emo_text{
	border: 1px solid black;
	display: inline-table;
	font-size: large;
}
#emo_title{
	font-size: 50px;
	width: 350px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
#emo_price{
	border: 1px solid black;
	font-size: 20px;
}
.emo_list{
	overflow: scroll;
	height: 95%;
}


#emo_category{
	border: 1px solid black;
	margin: auto;
}
#cate_1{
	border: 1px solid black;
	display: inline;
	font-size: 30px;
}
#cate_2{
	border: 1px solid black;
	display: inline;
	font-size: 30px;
}




</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="suggestModal.jsp" />
	
	<div id="chatingMain" >
		<div id="chatingList">
			<table width="260" border="1" align="center">
				<thead>
					<tr>
						<th colspan="2" align="center">
							<h3>채팅내역</h3>
						</th>
					</tr>

				</thead>

				<tbody>
					<c:forEach var="list" items="${ roomList }">
						<c:choose>
							<c:when test="${list.membertNickName eq loginMember.nickName}">
								<tr>
									<td>
										<div class="chatingOne">
											<div class="profileIMG">
												<img src="${list.artistFile}" alt="ㅎㅎ" class="profile"><!--  -->
											</div>
											<div class="chatingContent" align="left">
												<h6 class="name_h6">${list.artistNickName}</h6>
											</div>
											<input type="hidden" name="roomAddress" value="${ list.roomName }">
											<input type="hidden" name="roomNo" value="${ list.boardNo }">
											<input type="hidden" name="artist" value="${ list.artistNo }">
										</div>
									</td>
									<td><input type="checkbox" name="checkedcChat"></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td>
										<div class="chatingOne">
											<div class="profileIMG"><!--  -->
												<img src="${list.filePath}" alt="ㅎㅎ" class="profile">
											</div>
											<div class="chatingContent" align="left">
												<h6 class="name_h6">${list.membertNickName}</h6>
											</div>
											<input type="hidden" name="roomAddress" value="${ list.roomName }">
											<input type="hidden" name="roomNo" value="${ list.boardNo }">
											<input type="hidden" name="artist" value="${ list.artistNo }">
										</div>
									</td>
									<td><input type="checkbox" name="checkedcChat"></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tbody>
				<!-- <div id="buttons">
					<button id="chocieBtn">선택하기</button>
					<button id="checkAll">전체선택</button>
					<button id="deleteBtn">삭제하기</button>
				</div> -->
			</table>

		</div>

		<div id="chating">
			
			<div id="namespace">
				<c:choose>
					<c:when test="${c.membertNickName eq loginMember.nickName}">
						<h3>${ c.artistNickName }</h3>
					</c:when> 
					<c:otherwise>
						<h3>${ c.membertNickName }</h3>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="chatingView" style="overflow: scroll; border: 1px solid black;">
				<input type="hidden" name="boardNo" value="${ boardNo }">
				<input type="hidden" name="contractArtist" value="${ c.artistNo }">
				<input type="hidden" name="currentRoom" value="${ c.roomName }">
				<input type="hidden" name="alreadyReject" value="${alreadyReject}">
				
				<!-- <input type="hidden" name="memberCheck" value="${memberCheck}">
				<input type="hidden" name="artistCheck" value="${artistCheck}"> -->
				<form action="chatsave.co" method="post"></form>
			</div>
			<div id="inputText">
				<textarea style="width: 100%; height: 100%;" id="textContent"></textarea>
			</div>

			<div id="emoticon_area">

				<div id="emo_category">
					<div id="cate_1" onclick="chargeList();">
						<span>역대우승이모티콘</span>	
					</div>
					<div id="cate_2" onclick="freeList();">
						<span>이번달우승이모티콘</span>
					</div>
				</div>

				<div class="emo_list">
				</div>

			</div>

			<div id="chatingMenu">
				<img src="" alt="이모티콘" style="height: 5%;">
				<div id="sendBtn">
					<button onclick="chating_emoticonList();">이모티콘</button>
					<button data-toggle="modal" data-target="#suggestModal" id="suggestModal">가격제안</button>
					<button id='writeBtn'>보내기</button>
				</div>
			</div>
		</div>


		








		<script>
			var uri = "ws://localhost:8010/wonderPick/sc";

			var socket

			function validate() {
				if($('input[name=alreadyReject]').val()==1){
					alert('이미 거절된 제안입니다')
					return false;
				}
				return true;
			}
			$(function() {
				$('.profile').each(function() {
					$(this).width("100%")
					$(this).height("100%")
				})
				socket = new WebSocket(uri);

				socket.onopen = function(e) {
					//채팅 입장시 보내는 프로토콜  getin 방이름 
					socket.send('getin,${c.roomName},${loginMember.nickName}')
				}
				socket.onclose = function() {
					console.log('close');
				}
				socket.onmessage = function(e) {
					console.log(e.data);
					var revieveMSG = e.data.split(',');
					if (revieveMSG[0] == "someoneIn" && revieveMSG[1] != "${loginMember.nickName}") {
						$('.ReadCheck').text("");
						var boardNo = $('input[name=boardNo]').val()
						$.ajax({
							url : 'readedChat.co',
							data : {
								membertNickName : name,
								artistNickName : yourNick,
								roomName : roomName,
								boardNo : boardNo
							},
							success : function() {
								console.log("chating saved")
							}
						});
					}
					if (revieveMSG[0] == 1) {
						console.log(revieveMSG[1])
						var boardNo = $('input[name=boardNo]').val()
						$.ajax({
							url : 'insertUnreadChat.co',
							data : {
								roomName : roomName,
								boardNo : boardNo,
								fromMember : name,
								toMember : yourNick,
								readCheck : name,
								content : revieveMSG[1]
							},
							success : function(e) {
								if (e == 1) {
									console.log("unReadchating saved")
								}
							}
						});
						$('#chatingView>form').append(revieveMSG[1] + '<small class="ReadCheck">1</small>');

					}
					if (revieveMSG[0] == 2) {
						$.ajax({
							url : 'chatingSave.co',
							data : {
								myName : name,
								yourName : yourNick,
								text : revieveMSG[1]
							},
							success : function() {
								console.log("chating saved")
							}
						});

						$('#chatingView>form').append(revieveMSG[1]);

						if ($('.suggest').length != 0) {
							$('.suggest').each(function() {
								if ($(this).children("p").text().includes(name)) {
									$(this).children("p").text(yourNick+ "님이 요청을 검토중입니다");
									$(this).children("input[name=reject]").remove()
								}
							});
						}

					}
				}
				
				$('#chatingView>form>').remove();

				if ('${readYetMSG}' != '') {
					$('#chatingView>form').append(
							'${savedChating}' + '${readYetMSG}');
				} else {
					$('#chatingView>form').append('${savedChating}');
				}

				var name = '${loginMember.nickName}'
				var yourNick = '${c.artistNickName}'
				var roomName = '${c.roomName}'
				
				if ($('.suggest').length != 0) {
					$('.suggest').each(function() {
						if ($(this).children("p").text().includes(name)) {
							$(this).children("p").text(yourNick + "님이 요청을 검토중입니다");
							$(this).children("input[name=reject]").remove()
						}
					});
				}

				$('input[name=checkedcChat]').each(function() {
					$(this).hide();
				});
				$('#checkAll').hide();

				$('#chocieBtn').click(function() {
					if ($(this).text() == '선택취소') {
						$('input[name=checkedcChat]').each(function() {
							$(this).hide();
						});
						$('input[name=checkedcChat]').each(function() {
							$(this).prop('checked', false)
						});
						$('#checkAll').hide();
						$(this).text('선택하기');
					} else {
						$('input[name=checkedcChat]').each(function() {
							$(this).show();
						});
						$('#checkAll').show();
						$(this).text('선택취소');
					}
				});

				$('#checkAll').click(function() {
					$('input[name=checkedcChat]').each(function() {
						$(this).prop('checked', true);
					});
				});

				$('#writeBtn').click(function() {
					if ($('#textContent').val() != '') {
						var now = new Date();
						var nowTime = String(now.getHours())
								+ '시 '
								+ String(now.getMinutes())
								+ '분';

						var $textContent = $('#textContent').val();
						$textContent = $textContent.replace(/</g,'&lt;')
						$textContent = $textContent.replace(/>/g,'&gt;')
						var sendMsg = '<div class="chatings" align="left">'
								+ '<inpurt type="text" name="userName" id="1">'+ name
								+ '<br>'
								+ '<pre style="font-size : 20px">'+$textContent+'</pre>'
								+ '&nbsp;&nbsp;<small>'+ nowTime + '</small>'
								+ '</div>';
						socket.send(roomName + ',' + name + ','+ yourNick + ',' + sendMsg);
						$('#textContent').val('');
						$('#chatingView').scrollTop(
								$(document).height());

					}
				});

				$('.chatingOne').click(function() {
					
					
					$('input[name=contractArtist]').val($(this).find('input[name=artist]').val())
					
					var un = $(this).find('h6').text();
					
					yourNick = un;
					
					var changeRoom = $(this).find('input[name=roomAddress]').val();
					
					$('input[name=currentRoom]').val(changeRoom)
					
					$('input[name="contractArtist"]').val($(this).find('input[name=artist]').val());
					
					var boardNo = $('input[name=roomNo]').val()
					
					$('#namespace').find('h3').text(un);
					
					$('#chatingView>form>').remove();
					
					$.ajax({
						url : "loadChatings.co",
						data : {
							membertNickName : '${loginMember.nickName}',
							artistNickName : yourNick,
							roomName : changeRoom,
							boardNo : boardNo
						},
						success : function(result) {
							console.log(result)
							
							$('input[name=boardNo]').val(boardNo)
							
							roomName = changeRoom
							
							socket.send('getin,' + roomName + ',${loginMember.nickName}');
							
							$('#chatingView>form').append(result.str);
							
							/*$('input[name=memberCheck]').val(result.ac.memberCheck);
							$('input[name=artistCheck]').val(result.ac.artistCheck);*/
							
							if(result.ac!=null){
								var $img = $('#modalBody').find('img');
								console.log($img)
								$img.attr('src',result.priceAndTtile[0].filePath);
								$img.next().text(result.priceAndTtile[0].orderContent);
								$('#modalBody').find('p').text(result.priceAndTtile[0].totalPrice)
							}
							
						},
						error : function(e) {
							console.log(e)
						}
					});
				})
				
				$('#suggestbtn').click(function() {
					
					var accepter = 0;

					var now = new Date();
					
					var nowTime = String(now.getHours()) + '시 '
					
							+ String(now.getMinutes()) + '분';
					
					var totalprice = $('#modalBody>p').text();
					
					var $textContent = $('#textContent').val();
					
					var boardNo = $('input[name=boardNo]').val();
					
					var roomName = $('input[name=currentRoom]').val();
					
					//ajax로 check상태 확인하고 둘다 수락했으면 못눌러
					$.ajax({
						url : 'suggest.co',
						data : {
							boardNo : boardNo,
							roomName : roomName
						},
						success : function(result) {
							$('input[name=alreadyReject]').val(0)
							console.log(result)
							if(result=='N'){
								var reciever = $('#namespace').find('h3').text();
								var artistNo = $('input[name=contractArtist]').val()
								var sendMsg = '<div class="suggest" align="left">'
										+ '<p>${ loginMember.nickName }님이 '
										+ totalprice
										+ '원을 제안하셨습니다. 수락하시겠습니까?</p>'
										+ '<form action="checkCondition.co">'
										+ '<input type="submit" name="deal" readonly value="조건보기" onclick="return validate();">'
										+ '<input type="hidden" name="boardNo" value="'+boardNo+'">'
										+ '<input type="hidden" name="artistNo" value="'+artistNo+'">'
										+ '<input type="hidden" name="artistNickName" value="'+$('#namespace').find('h3').text()+'">'
										+ '<input type="hidden" name="roomName" value="'+roomName+'">'
			
								if ($('.addpriceDiv').length == 0) {
									sendMsg += '<input type="hidden" name="noMoreCon" value="y">'
								}
			
								sendMsg += '</form>'
										+'&nbsp;&nbsp;<small>' + nowTime + '</small>' + '</div>';
			
								socket.send(roomName + ',' + name + ','+ yourNick + ',' + sendMsg);
								
								$('#textContent').val('');
								
								$('#chatingView').scrollTop($(document).height());
			
								var request = ""
								var addPrices = ""
								
								$('.addPriceDiv').each(function() {
									request += $(this).find('.reason').val()+ ","
									addPrices += $(this).find('input[name=price]').val()+ ","
								});
								
								console.log(request)
								if (request != "" && addPrices != "") {
									$.ajax({
										url : 'insertReasonPrice.co',
										data : {
											boardNo : boardNo,
											addPrices : addPrices,
											request : request,
											roomName : roomName,
										},
										success : function(result) {
											console.log(result)
										}
									});
								}
								
							}
							if(result=="Y"){
								alert('상대방이 요청을 수락하여 요청을 보낼 수 없습니다. 요청을 보내려면 제안조건을 거절하세요');
							}
						}
					})
				});
			});






			///========================= 이모티콘 이코옴티티ㅗㄴ 밈ㅇ노코놐노ㅗㄴ콬노노ㅗ뇡미외코잉 이몽미오미이몽 키ㅣㅣ티티코오코ㅗ오오코ㅗㅗ오잉 밍 오미오미ㅗ코ㅗㅇㅋ오========================


			function chating_emoticonList(){
				$('#emoticon_area').toggle()
				chargeList();
			}

			function chargeList(){

				$.ajax({
					url : 'emoticonList.ct',
					data : {
						memberNo : ${ sessionScope.loginMember.memberNo }
					},
					success : result => {
						//console.log(result);

						value = '';
						for(var i in result){
							value += 
									'<div id="emo_img" class="emoticon_div">'
										+'<img src="'+ result[i].filePath +'" id="emoticon_image">'
										+'<input type="hidden" value="'+ result[i].boardNo +'">'
									+'</div>'
									+'<div id="emo_text" class="emoticon_div">'
										+'<div id="emo_title">'
											+'<span >'+ result[i].boardTitle +'</span>'
										+'</div>'
										+'<div id="emo_price">'
											+'<span>'+ result[i].price +'</span>'
										+'</div>'
									+'</div>';

							$('.emo_list').html(value);
						}

						// 무료는 사용 가능( 이모티콘 집어넣기 )
						// 로그인 유저, 상대닉네임, 채팅방 주소
						
						// 무료랑 유료랑 구분
						// 해당 이모티콘 클릭시 구매페이지 이동

					},
					error : () => {
						alert('error!!')
					}
				});
			};

			function freeList(){
				$.ajax({
					url : 'emoFreeList.ct',
					data : {
						memberNo : ${ sessionScope.loginMember.memberNo }
					}, 
					success : result => {
						//console.log(result);

						value = '';
						for(var i in result){
							value += 
								'<div class="free_list">'
									+'<div id="emo_img" class="emoticon_div">'
										+'<img src="'+ result[i].filePath +'" id="emoticon_image">'
										+'<input type="hidden" value="'+ result[i].boardNo +'">'
									+'</div>'
									+'<div id="emo_text" class="emoticon_div">'
										+'<div id="emo_title">'
											+'<span >'+ result[i].boardTitle +'</span>'
										+'</div>'
										+'<div id="emo_price">'
											+'<span>무료 사용 가능</span>'
										+'</div>'
									+'</div>'
								+'</div>';

							$('.emo_list').html(value);
						}


					}, 
					error : () => {
						alert('error!!!')
					}

				});

			};

			// var move = document.querySelectorAll('.emo_list');

			// move.forEach(i => i.addEventListener('click', e => {


			// 	console.log(e.target);



			// }))

			// 로그인 유저, 상대닉네임, 채팅방 주소
			$('.emo_list').on('click','.free_list', e => {

				//console.log($(e.target).parents('.free_list').children());
				
				//let targetName = $(e.target).get(0).tagName;
				
				//console.log($(e.target).parents('#free_list').html());
				//console.log($(e.currentTarget).filter('#emoticon_image').attr('src'));


				let emoImgAddress = $(e.currentTarget).find('#emoticon_image').attr('src');
				let loginUser  ='${ sessionScope.loginMember.nickName }';
				let otherName = $('.name_h6').html();
				let chatingRoom =  $('input[name=currentRoom]').val();

				// console.log(loginUser)
				// console.log('other :' +otherName)
				// console.log(chatingRoom)

				let sendEmoticon = '<div>'
								 	+'<img src="'+ emoImgAddress +'" id="emoticon_image">'
								 + '</div>';


				socket.send(chatingRoom + ',' + loginUser + ','+ otherName + ',' + sendEmoticon);

			})


			
			// 무료랑 유료랑 구분
			// 해당 이모티콘 클릭시 구매페이지 이동
			
			
			// 무료는 사용 가능( 이모티콘 집어넣기 )





	


			







		</script>
	</div>
</body>
</html>
