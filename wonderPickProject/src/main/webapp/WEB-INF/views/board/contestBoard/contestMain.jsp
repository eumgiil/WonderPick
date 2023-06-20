<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공모전 메인페이지 </title>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>


<style>
    
    #all_area{
        width: 1300px;
        height: auto;
        margin: auto;
    }
    #main_area{
        box-shadow: 1px 1px 10px rgb(200, 200, 200) ;
        border-radius: 20px;
        margin: auto;
        width: 900px;
        padding: 20px;
        margin-top:20px;

    }
    .winner_list>li{
       /*  border: 1px solid black; */
        display: inline;
        padding: 20px
    }
    .contest_list{
        /* border: 1px solid black; */
        width: 800px;
        height: 230px;
        overflow: auto;
        white-space: nowrap;
        border-radius: 10px;
    }
    .winner_img{
        /* border: 1px solid black; */
        width: 150px;
        height: 150px; 
    }
    h1{
        color : rgb(255, 131, 153);
    }
    #btn_area{
       /*  border: 1px solid black; */
        width: 100%;
        margin: auto;
    }
    #vote_btn{
       /*  border: 1px solid black; */
    
    }
    #enroll_btn{
       /*  border: 1px solid black; */
    }
    .btn_img{
        width: 80px;
        height: 80px;
        margin-bottom: -15px;
    }
    .btn{
       /*  border: 1px solid black; */
        border-radius: 30px;
        padding: 30px;
        font-size: 20px;
        display: inline-block;
    }
    .btn:hover{
        cursor: pointer;
        opacity: 0.9;
        transition: transform 300ms ease-in-out;
        transform: scale(1.1);
    }
    #body_area{
       /*  border: 1px solid black; */
       margin: auto;

    }
    #winnerList_title{
        width: 300px;
        color : rgb(255, 131, 153);
        text-align: center;

    }
    hr{
        background:pink;
        height:1px;
        border: 0;
        width: 90%;
    }
    #reply_area{
        margin: 20px;
        padding-bottom: 30px;
    }
    .table{
        display: inline-block;
        border-radius: 40px;
        padding: 20px;
        box-shadow: 1px 1px 10px rgb(200, 200, 200) ;
    } 
    .table_title{
        width: 110px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .table_profile_img{
        width: 10px;
    }
    .table_sysdate{
        color: gray;
    }
    .profile_img{
        width: 25px;
        height: 25px;
        border-radius: 50%;
    }
    .contest_list{
        /* border: 1px solid black; */
        width: 800px;
        height: 300px;
        overflow: auto;
        white-space: nowrap;
        border-radius: 10px;
    }
    .contest_list>ul>li{
        display: inline;
        padding: 20px
    }
  
</style>

</head>
<body>

	<jsp:include page="../../common/header.jsp" />



    <div id="all_area">
        <div id="main_area">
            <div id="header_area" align="center">
      
              <div>
                  <h1><span>이모티콘 공모전<hr></span></h1>
              </div>
          
      
              <div id="header_content">
                 <span>
                      매 달 열리는 이모티콘 공모전! 
                      <br><br>
                      여러분들도 도전해보세요!!
                      <br><br>
                  
                      첫 3주간 공모전 참가/등록이 가능하며 마지막주에는 투표가 시작됩니다  
                      <br><br>
                      투표를 통해 1위가 된 이모티콘은 이달의 우승 이모티콘 등록!! 
                      <br><br>
                      이달의 우승 이모티콘이 되면 한 달간 무료사용가능하며 메인페이지에 한 달간 무료 홍보이벤트 까지!
                      <br><br><br>
      
                      
                  </span> 
              </div>
          
      
              <div id="btn_area">
                  <div id="vote_btn" class="btn">
                    <img src="resources/boardUpfiles/contestFiles/dance_2.gif" alt=""class="btn_img">
                     <span>투표하러가기 ></span> 
                     <hr>
                  </div>
                  <div id="enroll_btn" class="btn">
                    
                      <img src="resources/boardUpfiles/contestFiles/dance_emogi.gif" class="btn_img">
                      <span>참가/등록하기 ></span> 
                      <hr>
                  </div>
              </div>
          </div>
      
              <hr>
      
      
          <div id="body_area">
              <div id="winnerList_title" >
                  <span><h1>역대 우승 이모티콘<hr></h1></span>


                <!-- 아마 지금 여기 안나오는 이유는 투표수에 null값이 있어서 그런듯 나중에 게시판까지 다 만들고 더미있을때 다시해보자 -->



              </div>
              <div class="contest_list">
                  <ul class="winner_list">
                    <c:forEach var="list" items="${ list }" >
                     <li>
                      	  <table border="1" class="table">
                                <thead>
                                    <tr >
                                        <td colspan="3">
                                            <div align="center">
                                                <img src="${ list.filePath }" alt="">
                                            </div>
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr >
                                        <th class="table_title" colspan="2">
                                            <div class="table_title"> 
                                                ${ list.boardTitle }
                                            </div>
                                        </th>
                                        <td class="vote_heart">♡</td>
                                    </tr>
                                    <tr>
                                        <td class="table_profile_img">
                                            <div align="center">
                                                <img src="${sessionScope.loginMember.profilePath }/${sessionScope.loginMember.profileImg}" class="profile_img">
                                                <img src="${ list.memberFilePath }" class="profile_img">
                                            </div>
                                        </td>
                                        <td>${ list.nickName }</td>
                                        <td>투표수 자리</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <span class="table_sysdate">${ list.uploadDate }</span> 
                                        </td>
                                    </tr>
                                </tbody>
                            </table>	
                      </li>
                    </c:forEach>

                     

                  </ul>
              </div>
          </div>
             
          
      
      
      
          <br><br><br><br><br>
      
          <hr>
          <div id="footer_area" align="center">
              <h1>여기는 댓글기능 넣자</h1>
          </div>
          <div id="reply_area">
      
              <!-- 로그인 했을 경우 -->
          
              <div id="reply-area" >
                  <div >
                      <p>
                          닉네임 : ${ sessionScope.loginMember.nickName }
                      </p>
                  
                  </div>
                  <div >
                      <textarea id="textarea_content" class="textarea" cols="50" style="resize: none;" placeholder="댓글을 남겨보세요"></textarea>
                  </div>
                  <div id="reply_btn" >
                      <span >
                          <button style="border: none;" onclick="insertReply();">등록</button>
                      </span>
                  </div>
              </div>
                                                                      
            
          
             
                  <!-- 로그인 안했을 경우 -->
          
          
              
                <!--   <div id="reply-area" >
                      <div style="margin-top: 7px;">
                          <p>
                          </p>
                      </div>
                      <div>
                          <textarea style="resize: none;" readonly class="textarea" placeholder="로그인 후 이용가능 합니다"></textarea>
                      </div>
                      <div id="reply_btn" >
                          <span >
                              <button class="actBtn" style="border: none;">등록</button>
                          </span>
                      
                      </div>
              
                  </div>        -->
                  
                  
          
          
          
          
                    <!--================= 여기서부터는 댓글 내용 LIST ============================-->
          
                      <div>
                          <table  align="center" width="800" id="replyList_table">
                              <tbody id="replyList_area">
          
          
                                 <!-- 여기가 댓글LIST자리 -->
          
                                 
                                 
                              </tbody>
                          </table>        
                      </div>       
          
              </div>
          
        </div>

    </div>





<br><br><br><br><br><br><br><br><br><br>
	<c:choose>
       <c:when test="${ !empty sessionScope.loginMember }">
	    <script>
	    
	        $('#vote_btn').click(function(){
	
	            location.href="selectVotePage.ct"
	
	            
	            //alert('지금은 투표 기간이 아닙니다. 매 달 마지막 주 투표가 시작됩니다.');
	        })
	        $('#enroll_btn').click(function(){
	            //  alert('이모티콘 공모전은 "작가" 회원만 참여 가능합니다.');
	            // alert('지금은 참가기간이 아닙니다. 다음달에 도전 해주세요!');
	            location.href="enrollForm.ct"
	        })
	
	    </script>
       </c:when>
       <c:otherwise>
        <script>
	    
	        $('#vote_btn').click(function(){
	
	           // location.href="selectVotePage.ct"
	
	            
	            alert('로그인 후 이용가능합니다.');
	            //alert('지금은 투표 기간이 아닙니다. 매 달 마지막 주 투표가 시작됩니다.');
	        })
	        $('#enroll_btn').click(function(){
	        	 alert('로그인 후 이용가능합니다.');
	            //  alert('이모티콘 공모전은 "작가" 회원만 참여 가능합니다.');
	            // alert('지금은 참가기간이 아닙니다. 다음달에 도전 해주세요!');
	            //location.href="enrollForm.ct"
	        })
	
	    </script>
       	
       </c:otherwise>
     </c:choose>
    
    


</body>
</html>