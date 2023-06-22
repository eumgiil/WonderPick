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
	width: 1200px;
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
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="suggestModal.jsp" />
	
	<div id="chatingMain" style="width: 100%">
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
												<img src="" alt="ㅎㅎ">
											</div>
											<div class="chatingContent" align="left">
												<h6>${list.artistNickName}</h6>
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
											<div class="profileIMG">
												<img src="" alt="ㅎㅎ">
											</div>
											<div class="chatingContent" align="left">
												<h6>${list.membertNickName}</h6>
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
				<div id="buttons">
					<button id="chocieBtn">선택하기</button>
					<button id="checkAll">전체선택</button>
					<button id="deleteBtn">삭제하기</button>
				</div>
			</table>

		</div>

		<div id="chating">
			<div id="chatSearchDiv" align="center">
				<br> <input type="text" name="chatingSearch" id="search"
					placeholder="채팅 내역 검색">
				<button id="chatingSearchBtn">검색</button>
			</div>
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
				<form action="chatsave.co" method="post"></form>
			</div>
			<div id="inputText">
				<textarea style="width: 100%; height: 100%;" id="textContent"></textarea>
			</div>
			<div id="chatingMenu">
				<img src="" alt="이모티콘" style="height: 5%;">
				<div id="sendBtn">
					<button data-toggle="modal" data-target="#suggestModal">가격제안</button>
					<button id='writeBtn'>보내기</button>
				</div>
			</div>
		</div>

		<script>
			var uri = "ws://localhost:8010/wonderPick/sc";

			var socket

			$(function() {
				if('${alreadyReject}'==1){
					alert('이미 거절된 제안입니다.')
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
							console.log(typeof(result))
							
							$('input[name=boardNo]').val(boardNo)
							
							roomName = changeRoom
							
							socket.send('getin,' + roomName + ',${loginMember.nickName}');
							
							$('#chatingView>form').append(result);
						}
					});
				})
				
				$('#suggestbtn').click(function() {
					if(${ac eq null}){
						alert("비어있음")
					}else{
						alert("구라임")
					}
					var accepter = 0;

					var now = new Date();
					
					var nowTime = String(now.getHours()) + '시 '
					
							+ String(now.getMinutes()) + '분';
					
					var totalprice = $('#modalBody>p').text();
					
					var $textContent = $('#textContent').val();
					
					var boardNo = $('input[name=boardNo]').val();
					
					var roomName = $('input[name=currentRoom]').val();
					
					var reciever = $('#namespace').find('h3').text();
					var artistNo = $('input[name=contractArtist]').val()
					var sendMsg = '<div class="suggest" align="left">'
							+ '<p>${ loginMember.nickName }님이 '
							+ totalprice
							+ '원을 제안하셨습니다. 수락하시겠습니까?</p>'
							+ '<form action="checkCondition.co">'
							+ '<input type="submit" name="deal" readonly value="조건보기">'
							+ '<input type="hidden" name="boardNo" value="'+boardNo+'">'
							+ '<input type="hidden" name="originPrice" value="2000">'/*디비에서 원가 끌고올것*/
							+ '<input type="hidden" name="artistNo" value="'+artistNo+'">'
							+ '<input type="hidden" name="roomName" value="'+roomName+'">'

					if ($('.addpriceDiv').length == 0) {
						sendMsg += '<input type="hidden" name="noMoreCon" value="y">'
					}

					sendMsg += '</form>'
							+'&nbsp;&nbsp;<small>' + nowTime + '</small>' + '</div>';

					socket.send(roomName + ',' + name + ','
							+ yourNick + ',' + sendMsg);
					$('#textContent').val('');
					$('#chatingView').scrollTop(
							$(document).height());

					var request = ""
					var addPrices = ""
					
					$('.addPriceDiv').each(function() {
						request += $(this).find('.reason').val()+ ","
						addPrices += $(this).find('input[name=price]').val()+ ","
					});
					
					console.log(request)
					if (request != "" && addPrices != "") {
						var artist = $('input[name=contractArtist]').val()
						if('${loginMember.memberNo}'== artist){
							accepter = artist
						}
						$.ajax({
							url : 'insertReasonPrice.co',
							data : {
								boardNo : boardNo,
								addPrices : addPrices,
								request : request,
								roomName : roomName,
								accepter : accepter
							},
							success : function(result) {
								console.log(result)
							}
						});
					}
				});
			});
		</script>
	</div>
</body>
</html>
