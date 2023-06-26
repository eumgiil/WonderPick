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
    #thumbnail_image{
        width: 200px;
        height: 200px;
    }
    .image{
        width: 100px;
        height: 100px;
        margin: auto;
        border: 1px solid black;
    }
    #header_area{
        border: 1px solid black;
        margin: auto;
    }


    #header_table{
        margin: auto;
    }
  
    #vote_heart{
        color: red;
        font-size: 80px;
    }
   
    #heart_area{
        text-align: center;
        font-size: 80px;
    }

    #body_area{
        margin: auto;
    }
    #buy_btn{
        width: 100%;
        height: 50px;
        color: white;
        background-color: pink;
    }
</style>
</head>
<body>

    <jsp:include page="../../common/header.jsp" />


   <div id="all_area">
    <div id="main_area">

        <div id="header_area">
                <table bid="header_table">
                    <tr>
                        <td rowspan="4">
                            <div>
                                <img src="${ b.get(0).filePath }" alt="" id="thumbnail_image">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>
                                <h1>
                                    ${ b.get(0).boardTitle }
                                </h1>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>
                                닉네임 :${ b.get(0).nickName }
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>
                                <h3>
                                    등록자 희망 판매가 : ${ b.get(0).price } 
                                </h3>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>

                        
                        <td>
                            <button id="buy_btn" onclick="kakaoPay();">구매하기</button>
                        </td>


                    </tr>
                </table>
        </div>

        <div id="body_area" align="center">

            <div>
                ${ b.get(0).boardContent }
            </div>

            <div id="heart_area">
                <span id="vote_heart"></span>
                <span id="vote_count"></span>
            </div>
    
            <div id="image_area">
                <c:forEach items="${ b }" var="b">

                    <img src="${ b.filePath }" alt="" class="image">

                </c:forEach>
            </div>
        </div>
    </div>
   </div>

   <script>

        $(function(){
           selectVoteLike();
        });

        // selectVote
        function selectVoteLike(){
            $.ajax({
                url : 'selectVoteLike.ct',
                data : {
                    boardNo : ${ b.get(0).boardNo }
                },
                success : function(result){

                    console.log(result)

                    if(result.length == 0){
                        $('#vote_heart').html('♡');
                    }

                    $('#vote_count').html(result.length)

                    
                    for(let i in result){
                        let loginMember = '${ sessionScope.loginMember.memberNo }';
                        if(loginMember == result[i].memberNo){
                            $('#vote_heart').html('♥'); 
                        }else{
                            $('#vote_heart').html('♡');
                        }
                    }

                    


                    $('#vote_heart').one("click",function(){
                        if($('#vote_heart').html() == '♥'){

                            let confirmResult2 = confirm('투표를 취소하시겠습니까?');
                            if(confirmResult2 == true){
                                deleteVote();
                            }
                        }
                        else if($('#vote_heart').html() == '♡'){
                            let confirmResult = confirm('투표를 진행하면 중복투표는 불가능합니다. 진행하시겠습니까?');

                            if(confirmResult == true){
                                insertVote();
                            }else{
                                
                            }
                            
                        }
                    })

                   
                },
                error : function(){
                    alert('selectVoteLike error!!!!')
                }
            });
        };

        // insertVoteHeart
        function insertVote(){
            $.ajax({
                url : 'insertVoteHeart.ct',
                data : {
                    boardNo : ${ b.get(0).boardNo },
                    memberNo : ${ sessionScope.loginMember.memberNo }
                },
                success : function(result){

                    var boardTitle = '[ ' + '${ b.get(0).boardTitle }' + ' ]'
                    
                    alert(boardTitle + ' 이모티콘에 투표하셨습니다!!')
                    selectVoteLike();
                },
                error : function(){
                    alert('updateVote error !!!!')
                }
            });
        };

        // deleteVoteHeart
        function deleteVote(){
            $.ajax({
                url : 'deleteVoteHeart.ct',
                data : {
                    boardNo : ${ b.get(0).boardNo },
                    memberNo :${ sessionScope.loginMember.memberNo }
                },
                success : function(result){
                    console.log('????');
                    selectVoteLike();
                },
                error : function(){
                    alert('delete error !!!!')
                }
            })
        }



        // 결제 카카오 스크립트

        function kakaoPay() {

           let boardTitle = '${ b.get(0).boardTitle }'
           let price = ${ b.get(0).price } 
            
            $.ajax({
                url : 'kakaoPay.ko',
                data : {
                    item_name : boardTitle,
                    quantity : 1,
                    total_amount : price 
                },
                success : function(data) {
                    window.open(data.next_redirect_pc_url);
                }
            });
        }
    

   </script>

</body>
</html>