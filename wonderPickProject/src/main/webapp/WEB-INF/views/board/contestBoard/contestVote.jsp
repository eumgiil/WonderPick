<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
        #all_area{
            width: 1300px;
            margin: auto;
        }
        #votePage_area{
            box-shadow: 1px 1px 10px rgb(200, 200, 200) ;
            border-radius: 20px;
            margin: auto;
            width: 800px;
            padding: 50px;
        }
        .header_area{
            display: inline-block;
            color : rgb(255, 131, 153);
            margin: 20px;
            text-align: center;
        }
        .header_area>h1:hover{
            cursor: pointer;
            opacity: 0.8;
            transition: transform 100ms ease-in-out;
            transform: scale(1.05);
        }
        #d_day{
            width: 300px;
        }
        #body_area{
            border: 1px solid black;
           margin: auto;

        }
        .winner_list>li{
            border: 1px solid black;
            display: inline;
            padding: 20px
        }
        .contest_list{
            border: 1px solid black;
            width: 800px;
            height: 300px;
            overflow: auto;
            white-space: nowrap;
            border-radius: 10px;
        }
        #winnerList_title{
            width: 200px;
            color : rgb(255, 131, 153);

        }
        hr{
            background:pink;
            height:1px;
            border: 0;
            width: 90%;
        }
        #hr_1{
            background:pink;
            height:5px;
            border: 0;
            width: 90%;
        }

      
        .contest_table{
         display: inline-block;
         border-radius: 40px;
         padding: 20px;
         box-shadow: 1px 1px 10px rgb(200, 200, 200) ;
        }
        #voteList_area{
            margin: auto;
            margin-top: 10px;
        }
        #refresh{
            width: 50px;
            height: 50px;
            margin-top :30px;
            margin-right: 30px;
        }
        #refresh:hover{
            cursor: pointer;
            opacity: 0.8;
            transition: transform 100ms ease-in-out;
            transform: scale(1.05);
        }
        .vote_heart{
            font-size: 40px;
            color: red;
            text-align: right;
            
        }
        .profile_img{
            width: 25px;
            height: 25px;
            border-radius: 50%;
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
        .top10_image{
            width: 100px;
            height: 100px; 
        }
        #header-1 h1{
            font-size: 32px;
        }
    </style>
    
</head>
<body>

    <jsp:include page="../../common/header.jsp" />
  <div id="all_area">
     <div id="votePage_area" >
            <div id="header-1" align="center">
                <div class="header_area">
                <h1>이달의 이모티콘 투표 <hr id="hr_1"></h1> 
                </div>
                <div class="header_area">
                    <h1>역대 이달의 우승작ssss<hr></h1>
                </div>
                <div id="d_day">
                <h3> 2023.05.28</h3> <hr>
                    <h1>D-3</h1>
                </div>
                <div>
                    <span>
                        여러분의 선택으로 이달의 이모티콘이 선정됩니다!! <br>
                        등록한 이모티콘 중 마음에 드시는 이모티콘에 하트를 클릭해
                        이달의 이모티콘을 선택해주세요! <br>
                        * 중복투표 불가능
                    </span>
                </div>
            </div>
        
            <!-- 실시간 탑10 -->
            <div id="body_area">
                <div id="winnerList_title" >
                    <span><h1>실시간 TOP10<hr align="left" id="top10_hr"></h1></span>
                </div>
                <div class="contest_lit">
                    <ul class="winner_list">
                      <c:forEach var="list" items="" >
                       <li>
                            <table border="1" class="contest_table">
                                <thead>
                                    <tr >
                                        <td colspan="3">
                                            <div align="center">
                                                <img src="" alt="" class="top10_image">
                                            </div>
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr >
                                        <th class="table_title" colspan="2">
                                            <div class="table_title"> 
                                              
                                            </div>
                                        </th>
                                        <td class="vote_heart">♡</td>
                                    </tr>
                                    <tr>
                                        <td class="table_profile_img">
                                            <div align="center">
                                                <img src="/resources/개발진스.png" class="profile_img">
                                             
                                            </div>
                                        </td>
                                        <td>s</td>
                                        <td>s</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <span class="table_sysdate">date</span> 
                                        </td>
                                    </tr>
                                </tbody>
                            </table>	
                        </li>
                      </c:forEach>
  
                       
  
                    </ul>
                </div>
            </div>


            <!-- =============================== 최신순 LIST ===============================-->

            <div align="right">
                <img src="resources/boardUpfiles/contestFiles/new3.png" id="refresh">
            </div>
            <div id="voteList_area" align="center">
                <div >
                      <c:forEach  items="${ list }" var="list">
                            <table border="1" class="contest_table">
                                <thead>
                                    <tr >
                                        <td colspan="3">
                                            <div align="center">
                                                <img src="${ list.filePath }" alt="" class="top10_image">
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
                                                <img src="#" class="profile_img">
                                             
                                            </div>
                                        </td>
                                        <td>${ list.nickName }</td>
                                        <td>${ list.voteCount }</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <span class="table_sysdate">${ list.uploadDate }</span> 
                                        </td>
                                    </tr>
                                </tbody>
                            </table>	
                      </c:forEach>
  
                       
  
                </div>
            
        </div>
    </div>


</body>
</html>