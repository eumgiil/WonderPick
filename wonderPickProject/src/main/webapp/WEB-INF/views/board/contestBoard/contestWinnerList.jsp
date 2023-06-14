<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        height: auto;

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
    #hr_1{
        background:pink;
        height:5px;
        border: 0;
        width: 90%;
    }
    #voteList_area{
            margin: auto;
            margin-top: 10px;
        }
        .contest_table{
         display: inline-block;
         border-radius: 40px;
         padding: 20px;
         box-shadow: 1px 1px 10px rgb(200, 200, 200) ;
        }
        .movePage:hover{
            cursor: pointer;
        }
        .top10_image{
            width: 100px;
            height: 100px; 
        }
        .table_title{
            width: 110px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .vote_heart{
            font-size: 40px;
            color: red;
            text-align: right;
            
        }
        .table_profile_img{
            width: 10px;
        }
        .profile_img{
            width: 25px;
            height: 25px;
            border-radius: 50%;
        }
        .table_sysdate{
            color: gray;
        }
        .recentWinner_image{
            width: 200px;
            height: 200px;
        }
</style>
</head>
<body>

    <jsp:include page="../../common/header.jsp" />

    <div id="all_area">
        <div id="main_area">

            <div id="header-1" align="center">
                <div class="header_area">
                <h1 onclick="votePage();">이달의 이모티콘 투표<hr></h1> 
                </div>
                <div class="header_area">
                    <h1 onclick="winnerPage();">역대 이달의 우승작<hr id="hr_1"></h1>
                </div>
                <div>
                    <table border="1" class="contest_table">
                        <tbody>
                            <tr >
                                <td colspan="3">
                                    <div align="center" class="movePage" id="boardImage">
                                        <img src="${ list.get(0).filePath }" alt="" class="recentWinner_image">
                                        <input type="hidden" value="${ list.get(0).boardNo }">
                                    </div>
                                </td>
                            </tr>
                            <tr >
                                <th class="table_title" colspan="2">
                                    <div class="table_title">
                                        <a href="#" class="movePage" id="boardTitle">
                                            <input type="hidden" value="${ list.get(0).boardNo }">
                                            ${ list.get(0).boardTitle }
                                        </a>
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
                                <td>${ list.get(0).nickName }</td>
                                <td>${ list.get(0).voteCount }</td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <span class="table_sysdate">${ list.get(0).uploadDate }</span> 
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <div class="table_sysdate">조회수</div> 
                                </td>
                            </tr>
                            </tbody>
                            
                        </table>
                </div>
                
                <div id="voteList_area" align="center">
                    <c:forEach  items="${ list }" var="list">
                    <table border="1" class="contest_table">
                        <tbody>
                            <tr >
                                <td colspan="3">
                                    <div align="center" class="movePage" id="boardImage">
                                        <img src="${ list.filePath }" alt="" class="top10_image">
                                        <input type="hidden" value="${ list.boardNo }">
                                    </div>
                                </td>
                            </tr>
                            <tr >
                                <th class="table_title" colspan="2">
                                    <div class="table_title">
                                        <a href="#" class="movePage" id="boardTitle">
                                            <input type="hidden" value="${ list.boardNo }">
                                            ${ list.boardTitle }
                                        </a>
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
                            <tr>
                                <td colspan="3">
                                    <div class="table_sysdate">조회수</div> 
                                </td>
                            </tr>
                            </tbody>
                            
                        </table>
                    </c:forEach>
    
                    <hr>
                    
                    <div class="selectList">
    
                    </div>
                  
                   
                </div>





            </div>


        

            

        </div>
    </div>



    <script>
         function votePage(){
            location.href = 'selectVotePage.ct';
        }

        function winnerPage(){
            location.href = 'contestWinnerList.ct';
        }
    </script>



</body>
</html>