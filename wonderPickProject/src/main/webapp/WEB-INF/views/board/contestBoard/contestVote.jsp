<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
        #d_day{
            width: 300px;
        }
        #body_area{
           margin: auto;

        }
        .winner_list>li{
            display: inline;
            padding: 20px
        }
        .contest_list{
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
         padding: 20px;
         box-shadow: 1px 1px 10px rgb(200, 200, 200) ;
        }
        .contest_table:hover{
            cursor: pointer;
            opacity: 0.8;
            transition: transform 100ms ease-in-out;
            transform: scale(1.05);
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
            text-align: center;
            
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
            width: 180px;
            height: 180px; 
        }
        #header-1 h1{
            font-size: 32px;
        }
        #puls_btn_image{
            margin: auto;
            width: 50px;
            height: 50px;
            display: block;
        }
        #puls_btn{
            background-color: whitesmoke;
            margin: auto;
            margin-top: 30px;
            width: 90%;
            border-radius: 50px;
        }
        #puls_btn:hover{
            cursor: pointer;
            opacity: 0.8;
            transition: transform 100ms ease-in-out;
            transform: scale(1.05);
        }
        .movePage{
        }
        .movePage:hover{
            cursor: pointer;
        }
      
    </style>
    
</head>
<body>

    <jsp:include page="../../common/header.jsp" />
    <div id="all_area">
        <div id="main_area" >
            <div id="header-1" align="center">
                <div class="header_area">
                <h1 onclick="votePage();">이달의 이모티콘 투표<hr id="hr_1"></h1> 
                </div>
                <div class="header_area">
                    <h1 onclick="winnerPage();">역대 이달의 우승작<hr></h1>
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
            <!-- 
            <div id="body_area">
                <div id="winnerList_title" >
                    <span><h1>실시간 TOP10<hr align="left" id="top10_hr"></h1></span>
                </div>
                <div class="contest_list">
                    <ul class="winner_list">
                      <c:forEach var="list" items="" >
                       <li>
                            <table class="contest_table">
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
                                        <th class="table_tite" colspan="2">
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
            </div> -->


            <!-- =============================== 최신순 LIST ===============================-->

            <div align="right">
                <img src="resources/boardUpfiles/contestFiles/new3.png" id="refresh">
            </div>
            <div id="voteList_area" align="center">
                <c:forEach  items="${ list }" var="list">
                <table class="contest_table">
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
                            <td>투표수 자리</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <span class="table_sysdate">${ list.uploadDate }</span> 
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <div class="table_sysdate">조회수(${ list.boardCount }) </div> 
                            </td>
                        </tr>
                        </tbody>
                        
                    </table>
                </c:forEach>
                <hr>
                <div class="selectList">
                </div>
              
               
            </div>
            <div id="puls_btn">
                <img src="resources/boardUpfiles/contestFiles/plus.webp" alt="" id="puls_btn_image">
            </div>


        </div>        
    </div>

       

   


    <script>
        
        //let movePage =  document.querySelectorAll('.movePage');
        


            //console.log(this.name);

            //location.href='contestDetail.ct?bno=' + 


        // document.querySelector('.movePage').addEventListener('click',function(e){

        //     console.log(this);
        // })

        // [].forEach.call(cols,function(movePage)){
        //     movePage.add
        // }


        // 클릭 시 해당 게시물 이동
        var movePage = document.querySelectorAll('.movePage');
        
        
        movePage.forEach( i => i.addEventListener('click', e => {
    <c:choose>
        <c:when test="${ !empty sessionScope.loginMember }">

           //console.log(document.getElementById('modal_1').href)
           //document.getElementById('modal_1').href ='#exampleModalToggle';

            if(e.currentTarget.id == 'boardImage'){ // 클릭한 타겟이 이미지라면
                let clickImageBoardNo = e.currentTarget.children[1].value;
                console.log(clickImageBoardNo);
                location.href = 'contestDetail.ct?boardNo=' + clickImageBoardNo;
            }else{
                let clickTitleBoardNo = e.currentTarget.children[0].value;
                console.log(clickTitleBoardNo);
                location.href = 'contestDetail.ct?boardNo=' + clickTitleBoardNo;
            }

        </c:when>
      <c:otherwise>
           alert('로그인 후 이용가능 합니다.')
      </c:otherwise>
    </c:choose>
        }))






        let value = "";
        // 플러스버튼 더보기 
        document.getElementById('puls_btn').addEventListener('click', function(){
            $.ajax({
                url : 'moreList.ct',
                data : {
                    checkNumber : $('.contest_table').length
                },
                success : function(result){
                    console.log($('.contest_table').length);

                        //let value = "";
                    for(let i in result){
                        
                        value += 
                        '<table class="contest_table">'
                            + '<tr>'
                                    + '<td colspan="3">'
                                    +' <div align="center" class="movePage" id="boardImage">'
                                        +  '<img src="' + result[i].filePath + '" class="top10_image">'
                                       + '<input type="hidden" value="'+ result[i].boardNo +'">'
                                    + '</div>'
                                + '</td>'
                            + '</tr>'
                            + '<tr >'
                                + '<th class="table_title" colspan="2">'
                                    +  '<div class="table_title">'
                                        + '<a href="#" class="movePage" id="boardTitle">'
                                            +  '<input type="hidden" value="'+ result[i].boardNo +'">'
                                            + result[i].boardTitle
                                        +' </a>'
                                        +'</div>'
                                + '</th>'
                                + '<td class="vote_heart">♡</td>'
                                +'</tr>'
                            + '<tr>'
                                + '<td class="table_profile_img">'
                                    +  ' <div align="center">'
                                        +  '<img src="#" class="profile_img">'
                                            
                                        +'</div>'
                                + '</td>'
                                    +'<td>'+ result[i].nickName +'</td>'
                                + '<td> 투표수 자리 </td>'
                                +'</tr>'
                            + '<tr>'
                                + '<td colspan="3">'
                                    +   '<span class="table_sysdate">'+ result[i].uploadDate + '</span> '
                                + ' </td>'
                                +'</tr>'
                            + '<tr>'
                                +  '<td colspan="3">'
                                    + '<div class="table_sysdate">조회수</div> '
                                + '</td>'
                                +'</tr>'
                        + '</table>';

                            }
                            $('.selectList').html(value);

                            var movePage = document.querySelectorAll('.movePage');
                            movePage.forEach( i => i.addEventListener('click', e => {

                                if(e.currentTarget.id == 'boardImage'){ // 클릭한 타겟이 이미지라면
                                    console.log('이미지 클릭함')
                                console.log(e.currentTarget.children[1].value);
                                    let clickImageBoardNo = e.currentTarget.children[1].value;
                                    location.href = 'contestDetail.ct?boardNo=' + clickImageBoardNo;
                                }else{
                                    console.log('제목 클릭함')
                                    console.log(e.currentTarget.children[0].value);
                                    let clickTitleBoardNo = e.currentTarget.children[0].value;
                                    location.href = 'contestDetail.ct?boardNo=' + clickTitleBoardNo;
                                }
                            }))
                },
                error : function(){
                    alert('조회 실패입니디')
                }
            });
        });

        


        function votePage(){
            location.href = 'selectVotePage.ct';
        }

        function winnerPage(){
            location.href = 'contestWinnerList.ct';
        }

      
   











    </script>


</body>
</html>