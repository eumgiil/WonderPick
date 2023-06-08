<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Document</title>
    <style>
        div{
             border: 1px solid black;
         }
 
         #chatingMain{
             width: 1200px;
             height: auto;
         }
 
         #chatingList{
             width: 22%;
             height: 100%;
             float: left;
             position : relative;
         }
 
         .chatingOne{
             width: 100%;
         }
 
         .profileIMG{
             width: 10%;
             height: 35px;
             float: left;
         }
 
         #chatingContent{
             width: 60%;
             height: 35px;
             float: right;
         }
         #chatSearchDiv{
          height: 10%;
          
         }
         #chatingView{
             height: 60%;
         }
         #inputText{
             height: 20%;
         }
         #chatingMenu{
             height: 10%;
         }
 
         #chating{
             width: 78%;
             height: 100%;
             float: right;
         }
         #sendBtn{
         	 margin-top: 25px;
         	 margin-right: 10px;
             float: right;
         }
         #buttons{
         	position : absolute;
         	bottom : 0;
         }
         
     </style>
</head>
<body>
    <div id="chatingMain">
        <div id="chatingList">
            <table width="260" border="1" align="center">
                <thead>
                    <tr>
                        <th colspan="2" align="center">
                            <h3>
                              	  채팅내역
                            </h3>
                        </th>
                    </tr>
                    
                </thead>

                <tbody>
                    <tr>
                        <td>
                            <div class="chatingOne">
                                <div class="profileIMG">
                                    <img src="" alt="ㅎㅎ">
                                </div>
                                <div class="chatingContent" align="left">
                                    <h6>상대이름</h6>
                                    <label>채팅내역으로 꾀나 길거임</label>
                                </div>
                            </div>
                        </td>
                        <td><input type="checkbox" name="checkedcChat"></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="chatingOne">
                                <div class="profileIMG">
                                    <img src="" alt="ㅎㅎ">
                                </div>
                                <div class="chatingContent" align="left">
                                    <h6>상대이름</h6>
                                    <label>채팅내역으로 꾀나 길거임</label>
                                </div>
                            </div>
                        </td>
                        <td><input type="checkbox" name="checkedcChat"></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="chatingOne">
                                <div class="profileIMG">
                                    <img src="" alt="ㅎㅎ">
                                </div>
                                <div class="chatingContent">
                                    <h6>상대이름</h6>
                                    <label>채팅내역으로 꾀나 길거임</label>
                                </div>
                            </div>
                        </td>
                        <td><input type="checkbox" name="checkedcChat"></td>
                    </tr>
                </tbody>
            </table>
            <div id="buttons">
                <button id="chocieBtn">선택하기</button>
                <button id="checkAll">전체선택</button>
                <button id="deleteBtn">삭제하기</button>
            </div>
        </div>
        
        <div id="chating">
            <div id="chatSearchDiv" align="center">
            	<br>
                <input type="text" name="chatingSearch" id="search" placeholder="채팅 내역 검색">
                <button id="chatingSearchBtn">검색</button>
            </div>
            <div id="chatingView" style="overflow:scroll; border: 1px solid black;">
                <form action="chatsave.co" method="post">


                </form>
                <img src="" alt="화면공유중" style="width: 100%; height: 80%;" >
            </div>
            <div id="inputText">
                <textarea style="width: 100%; height: 100%;" id="textContent" ></textarea>
            </div>
            <div id="chatingMenu">
                <img src="" alt="이모티콘" style="height: 5%;">
                <div id="sendBtn">
                    <button id='writeBtn'>보내기</button>
                </div>
            </div>
        </div>
        <script>
        	var uri = "ws://localhost:8007/wonderPick/sc";
        	
        	var socket
        	
            $(function(){
            	if('${readYetMSG}'!=''){
            		$('#chatingView>form').append('${savedChating}'+'${readYetMSG}');
            	}else{
            		$('#chatingView>form').append('${savedChating}');
            	}
            	
            	
            	$('.ReadCheck').text("");
            	
           	 	var name = '${loginUser.nickName}'
       		 	var yourNick = '${c.artistNickName}'
       		 	
            	socket = new WebSocket(uri);
            	
    			socket.onopen = function(e){
    				//채팅 입장시 보내는 프로토콜  getin 방이름  나  너
    				socket.send('getin,${roomName.roomName}')
    			}
    			socket.onclose = function(){
    				console.log('close');
    			}
    			socket.onmessage = function(e){
    				console.log(e.data);
    				var revieveMSG = e.data.split(',');
    				if(e.data=="someoneIn"){
    					$('.ReadCheck').text("");
    					$.ajax({
    						url : 'readedChat.co',
    						data : {
    							roomName : '${roomName.roomName}',
    							membertNickName : name,
    							artistNickName : yourNick,
    						},
    						success : function () {
								console.log("chating saved")
							}
    					});
    				}
    				if(revieveMSG[0]==1){
    					console.log(revieveMSG[1])
    					$.ajax({
    						url : 'insertUnreadChat.co',
    						data : {
    							roomName : '${roomName.roomName}',
    							fromMember : name,
    							toMember : yourNick,
    							content : revieveMSG[1]
    						},
    						success : function (e) {
    							if(e==1){
									console.log("unReadchating saved")
    							}
							}
    					});
    					$('#chatingView>form').append(revieveMSG[1]+'<small class="ReadCheck">1</small>');
    				}
    				if(revieveMSG[0]==2){
    					$.ajax({
    						url : 'chatingSave.co',
    						data : {
    							myName : name,
    							yourName : yourNick,
    							text : revieveMSG[1]
    						},
    						success : function () {
								console.log("chating saved")
							}
    					});
    					$('#chatingView>form').append(revieveMSG[1]);
    				}
    			}
    			
                $('#chatingView img').hide();
                $('input[name=checkedcChat]').each(function(){
                    $(this).hide();
                });
                $('#checkAll').hide();

                $('#chocieBtn').click(function(){
                    if($(this).text()=='선택취소'){
                        $('input[name=checkedcChat]').each(function(){
                            $(this).hide();
                        });
                        $('input[name=checkedcChat]').each(function(){
                            $(this).prop('checked',false)
                        });
                        $('#checkAll').hide();
                        $(this).text('선택하기');
                    }
                    else{
                        $('input[name=checkedcChat]').each(function(){
                            $(this).show();
                        });
                        $('#checkAll').show();
                        $(this).text('선택취소');
                    }
                });

                $('#checkAll').click(function(){
                    $('input[name=checkedcChat]').each(function(){
                            $(this).prop('checked',true);
                        });
                });

                $('#writeBtn').click(function(){
                    if($('#textContent').val()!=''){
                        var now = new Date();
                        var nowTime = String(now.getHours())+'시 '+String(now.getMinutes())+'분';
                       
                        var $textContent = $('#textContent').val();
                        var sendMsg = '<div class="chatings" align="left">'
                            +'<inpurt type="text" name="userName" id="1">'+name+'<br>'
                            +'<input type="text" name="chatings" style="width: 300px; height: auto;" readonly value="'+$textContent+'">'
                            +'&nbsp;&nbsp;<small>'+nowTime+'</small>'
                            +'</div>';
                            
                        
                       	socket.send('${roomName.roomName},'+name+','+yourNick+','+sendMsg);
                        $('#textContent').val('');
                        $('#chatingView').scrollTop($(document).height());
                        
                    }
                });
            })

        </script> 
    </div>
</body>
</html>
