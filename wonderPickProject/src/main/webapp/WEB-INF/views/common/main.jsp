<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wonder pick</title>
<style>
#content_1{
	margin-top:100px;

}
.footer{
	width:100%;
	height:300px;
	background-color:rgb(255, 131, 153);
	
}
.thismonth{
	width:1200px;
	height:450px;
}
.contest_table{
 float:left;
 margin-left:100px;
 height:90%;
 text-align:center;
}
.right{
  float:right;
  margin-right:100px;
  margin-top: 150px;
}
#button1{
    background-color:rgb(255, 131, 153); 
    color:white;
    border: none;
    width: 300px;
    height: 40px;
    
}
#button2{
    background-color:rgb(255, 131, 153); 
    color:white;
    border: none;
    width: 200px;
    height: 60px;
    font-size: 30px;
}
#button1:hover{
    background-color: black;
    color: rgb(255, 131, 153);
}
#button2:hover{
    background-color: black;
    color: rgb(255, 131, 153);
}
.right > a:hover{
    background-color: black;
    color: rgb(255, 131, 153);
}
.content_2{
    height: 600px;
    background-color: antiquewhite;
    
}
.title{
    font-size:40px;
    font-weight: bold;
    color: rgb(255, 131, 153);
}
</style>

 <!-- swiper.js 라이브러리추가 -->
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="resources/css/common/main.css" />
</head>

<body>
	<jsp:include page="header.jsp" />
	
	
	<!-- content1 -->
	<div id="content_1">
        <!-- Slider main container -->
        <div class="swiper">
            <!-- Additional required wrapper -->
            <div class="swiper-wrapper">
                <!-- Slides -->
                <div class="swiper-slide"><img src="resources/common/002.png"></div>
                <div class="swiper-slide"><img src="resources/common/003.png"></div>
            </div>
        
            <!-- If we need pagination -->
            <div class="swiper-pagination"></div>
        
            <!-- If we need navigation buttons -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        
            <!-- If we need scrollbar -->
            <div class="swiper-scrollbar"></div>
        </div>
    </div>
    
    <br><br><br>
    
    <div class="content_2" align="center">
    	<h1 class="title">이달의 이모티콘</h1>
    	<div class="thismonth" >
    	  <div class="left" onchange="selectemo()">
    	  
    	  </div>
    	<div class="right">
    	 <h3>나도 인기 이모티콘 작가가 되고 싶다면?</h3>
         <br>
         <a href="enrollForm.ct" class="btn btn-info" id="button2" >도전하기</a>
    	 </div>
    	 </div>
    	 <a href="selectVotePage.ct" class="btn btn-info" id="button1">더 다양한 이모티콘 보러가기</a>
    	 
    </div>
    
    
    
    
    
    <br><br><br><br><br>
    <!-- content3 -->
    <div id="content_3" align="center" >
    	<h1 style="color:rgb(255, 131, 153); font-weight: bold;">WONDERPICK은?</h1>
    	<img src="resources/common/001.png" >
    </div>
    
    
    <!-- footer -->
    <div class="footer">
    <p>
    	<h6>기업정보 </h6>
    </p>
    </div>
    
    
​
    <script>
        // 슬라이더 동작 정의
        const swiper = new Swiper('.swiper', {
            autoplay : {
               delay : 3000 // 3초마다 이미지 변경
            },
            loop : true, //반복 재생 여부
            slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
            pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
                el: '.swiper-pagination',
                clickable: true
            },
            navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
                prevEl: '.swiper-button-prev',
                nextEl: '.swiper-button-next'
            }
        }); 
        </script>
        
        
		<script>
		$(function(){
			selectemo();
		})
		
		function selectemo(){
        	 $.ajax({
                 url : 'selectMainEmo.ct',
                 success : function(list){
                	 console.log(list);
                     let value = "";
                         
                   value +='<table class="contest_table">'
                         + '<tr>'
                         + '<td colspan="3">'
                            +' <div align="center" class="movePage" id="boardImage">'
                              +  '<img src="' + list[0].filePath + '" >'
                              + '</div>'
                         + '</td>'
                         + '</tr>'
                         + '<tr>'
                             + '<th class="table_title" colspan="2" align="center">'
                             +  '<div class="table_title">'
                             + '<a href="#" class="movePage" id="boardTitle" style="font-size:30px; color:rgb(255, 131, 153);">'
                             +  '<input type="hidden" value="'+ list[0].boardNo +'">'
                             +  list[0].boardTitle
                             +' </a>'
                             +'</div>'
                             + '</th>'
                         +'</tr>'
                         + '<tr>'
                             
                             +'<td>'+ list[0].nickName +'</td>'
                             +'</tr>'
                         + '</table>';	 

                    $('.left').html(value);
                 },
                 error : function(){
                  console.log('실패');	
                 }
                 
        });
		};
        
		</script> 
        
       
        
	
</body>
</html>