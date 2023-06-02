<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<&@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공모전 메인페이지 </title>

</head>
<body>

	<C;include page="../common/header.jsp" />

  <div id="all_area">
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
               <img src="/resources/dance_2.gif" class="btn_img">
               <span>투표하러가기 ></span> 
               <hr>
            </div>
            <div id="enroll_btn" class="btn">
                <img src="/resources/dance_emogi.gif" class="btn_img">
                <span>참가/등록하기 ></span> 
                <hr>
            </div>
        </div>
    </div>

        <hr>


    <div id="body_area">
        <div id="winnerList_title" >
            <span><h1>역대 우승 이모티콘<hr></h1></span>
        </div>
        <div class="contest_list">
            <ul>
                <li>
                    <img src="/resources/kakaoEmogi.gif" >
                </li>
                <li>
                    <img src="/resources/emogi2.gif" alt="">
                </li>
                <li>
                <img src="/resources/emogi_3.gif" alt="">
                </li>
                <li>
                <img src="/resources/goodEmogi.gif" alt="">
                </li>
                <li>
                    <img src="/resources/sorry_emogi.gif" alt="">
                </li>
                <li>
                    <img src="/resources/goodEmogi.gif" alt="">
                </li>
                <li>
                    <img src="/resources/emogi2.gif" alt="">
                </li>
                <li>
                    <img src="/resources/kakaoEmogi.gif" >
                </li>
                <li>
                    <img src="/resources/sorry_emogi.gif" alt="">
                </li>
                <li>
                    <img src="/resources/emogi2.gif" alt="">
                </li>
            
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
                    닉네임 : 
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




<br><br><br><br><br><br><br><br><br><br>
    <script>
        $('#vote_btn').click(function(){
            
            alert('지금은 투표 기간이 아닙니다. 매 달 마지막 주 투표가 시작됩니다.');
        })

        $('#enroll_btn').click(function(){
            alert('이모티콘 공모전은 "작가" 회원만 참여 가능합니다.');
            alert('지금은 참가기간이 아닙니다. 다음달에 도전 해주세요!');
        })

    </script>


</body>
</html>