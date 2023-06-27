<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Document</title>
    <style>
        .content {
            /* background-color:rgb(247, 245, 245); */
            width:900px;
            margin:auto;
            margin-top: 150px;
        }
        .detail{
            float: left;
            /* display: inline-block; */
            width : 65%;
            margin-right:20px;
            margin-bottom: 50px;
        }        
        .detail_img{
            padding-right: 1px;    
            width: 100%;
        }
        .artist{
            display: inline-block;
            width : 30%
        }
        .list{
            width : 143px;
            display: inline-block;
        }
        .t_align_right{
            text-align: right;
        }
        .t_align_left{
            text-align: left;
        }
        .op_title{
            text-align: center;
            background-color: lightslategray;
        }



        /* 사이즈 */
        .width{
            width:100%;
        }
        .h_10px{
            height:10px;
        }


        /* 공간크기 */
        .p_10px{
            padding: 10px;
        }

        .center{
            margin: 0 auto;
            align-content: center;
            text-align:center
        }

        /* 구매리뷰 */
        .review_all_div{
            padding:10px;
        }
        .review_img{
            width:100%;
            height:100%;
        }

        /* 문의 댓글 */
        .inquire_img{
            border-right: 1px solid lightslategray;
        }

        #explain{
            display: inline-block;
        }
    

    </style>
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
    <div class="content">

        <!-- 여기는 제품 사진 및 정보 -->
        <div class="detail" align="center">
            <div id="artImages" class="">
            	
            </div>
            <br><br>




            <div>
                ★★★☆☆  3.1( xx개 평가 )  
            </div>
            <br><br><hr><br>



            <div>
                <label for="" onclick="move('explain')">상세설명</label> |
                <label for="" onclick="move('refund_rull')">취소 및 환불규정</label> |
                <label for="" onclick="move('review_all_div')">구매리뷰</label> |
                <label for="" onclick="move('inquire_reply')">문의 댓글</label> |
            </div>
            <br><br>

            <div>
                <h3>[ 상세 설명 ]</h3>
            </div>
            <br><br><br>
            
            <!-- 설명이 들어갈 div -->
            <div id="explain"></div>

            <br><br><br>

            <div>
                <h3>[ 취소 및 환불 규정 ]</h3>
            </div>
            <hr>

            <div id="refund_rull">
                <p>
                    것이 따뜻한 봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의
                    따뜻한 봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도
                    그러므로 그들은 이상의 보배를 능히 품으며 그들의 이상은 아름답고 소담스러운 열매를 맺어 우리 인생을 풍부하게 하는 것이다 보라 청춘을 ! 그들의 몸이 얼마나 튼튼하며 그들의 피부가 얼마나 생생하며
                </p>
            </div>
            <br><br><br><br><br>


            <div>
                <h3>[ 구매 리뷰 ]</h3>
            </div>
            <hr><br>

            <div id="review_all_div">
                <table>

                    <!-- 여기 부분 반복 -->
                    <tr>
                        <td class="h_10px">아이디</td>
                        <td rowspan="4" width="30%">
                            <img class="review_img" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif">
                        </td>
                    </tr>
                    <tr>
                        <td class="h_10px">★★★★☆</td>
                    </tr>
                    <tr>
                        <td class="h_10px">날짜</td>
                    </tr>
                    <tr>
                        <td class="h_10px">내용</td>
                    </tr>
                </table>
            </div>

            <hr>


            <br><br>

            <div id="scroll4">
                <h3>[ 문의 댓글 ]</h3>
				<table id="replyArea" align="center">
                    <thead>
                        <!-- <c:choose>
                            <c:when test="${ empty replyList }">
                                <h3>댓글 내역이 존재하지 않습니다.</h3>
                                <br>
                            </c:when>
                            <c:otherwise>
                                <c:if test="${not empty reReplyList }">
                                    <input type="hidden" value="${re.replyNo }">
                                    <c:forEach items="${reReplyList }" var="re">
                                        <table class="reReply" border="1">
                                            <tr>
                                                <td width="15%" rowspan="3" style="padding:10px; border-right: 1px solid lightslategray;">판매자 프로필</td>
                                            </tr>
                                            <tr>
                                                <td width="70%" style="padding-left:10px;">${re.nickname }</td>
                                                <td width="15%" rowspan="3">
                                                    <a href="" style="background-color: white; border: none;"><img src="https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_delete_forever_48px-512.png" width="40"  alt=""></a>
                                                    <a href="" style="background-color: white; border: none;"><img src="https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_report_48px-512.png" width="40" alt=""></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left:10px;">${re.content}</td>
                                            </tr>
                                        </table>
                                    </c:forEach>
                                </c:if>
                            </c:otherwise>
                        </c:choose> -->
                    </thead>
                    <tbody>
                        <br>
                        <c:choose>
                            <c:when test="${empty loginMember}" >
                                <hr>
                                <table>
                                    <tr>
                                    <th><hr></th>
                                    </tr>
                                    <tr> 
                                        <th colspan="2">
                                            <textarea class="form-control" cols="55" rows="2" style="resize:none; width:100%;" readonly>로그인 후 댓글 작성가능합니다.</textarea>
                                        </th>
                                    </tr>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <br>
                                <table>
                                    <tr>
                                        <th colspan="2">
                                            <input type="hidden" value="${ bno }" id="boardNo" name="${ bno }">
                                            <input type="hidden" value="${loginMember.memberNo }" name="${loginMember.memberNo}">
                                            <textarea class="form-control" name="content" id="insertcontent" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
                                        
                                        </th>
                                        <br>
                                        <th style="vertical-align:middle">
                                            <button type="submit" class="btn btn-secondary"  onclick="insertReply();" id="replysubmit">등록하기</button>
                                        </th>
                                    </tr>
                                </table>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </div>
				</table>

                <br><br><br><br><br>

            </div>


            <br><br><br><br><br>


        </div>
        <!-- 왼쪽 끝 -->














        




    <!-- 오른쪽 정보 -->
        <div class="artist" style="margin-left:10px;">
                                                        <!-- 작가 작품 정보 -->
            <div>
                <table class="width">
                    <tr>
                        <th style="font-size: 35px;">
                            <c:choose>
                                <c:when test="${ artBoard.heart > 0 }">
                                    ♥
                                </c:when>
                                <c:otherwise>
                                    ♡
                                </c:otherwise>
                            </c:choose>
                        </th>
                        <td class="t_align_right">
                            <form action="updateForm.at" method="get">
                                <input type="hidden" name="boardNo" value="${ bno }">
                                <button class="btn btn-danger">수정</button>

                                <!-- <c:if test="${member.memberNo eq artBoard.board.boardNo}"> -->
                                <!-- </c:if> -->
                            </form>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="font-size: 25px; font-weight:bold;">${artBoard.board.boardTitle}</td>
                    </tr>
                </table>
            </div>

            <hr>

            <div>
                <table class="width">
                    <tr>
                        <td rowspan="2" style="width:100px;"><img class="detail_img" src="${artboard.memberImage.memberModifyName}" alt=""></td>
                        <td style="font-size: 30px;">${artBoard.member.nickName}</td>
                    </tr>
                    <tr>
                        <td style="font-size: 20px;">★★★★☆</td>
                    </tr>
                </table>
            </div>

            <hr>
            <br>
                                                        <!-- 상세옵션 -->
            <div class="op_title">
                <h3 class="op_title width">상세옵션</h3>
            </div>
            <div class="">
                <table class="width">
                    <tr>
                        <td>제출파일 유형</td>
                        <td class="t_align_right">${artBoard.fileType}</td>
                    </tr>
                    <tr>
                        <td>해상도</td>
                        <td class="t_align_right">${artBoard.dpi}</td>
                    </tr>
                    <tr>
                        <td>기본사이즈</td>
                        <td class="t_align_right">${artBoard.defaultSize}</td>
                    </tr>
                    <tr>
                        <td>수정 횟수</td>
                        <td class="t_align_right">${artBoard.modifyCount}</td>
                    </tr>
                    <tr>
                        <td>작업기간</td>
                        <td class="t_align_right">${artBoard.workday}</td>
                    </tr>
                </table>
            </div>
            <br><br>

                                      <!-- 가격옵션 -->
                                      
            

            <div class="op_title">
                <h3 class="op_title width">가격 옵션</h3>
            </div>
            <div class="">
                <table id="optionTable" class="width">
                    <!-- 여기서부터 -->
                    
                    <!-- 여기까지 반복 -->
                </table>
            </div>
            <br><br>

                                                        <!-- 굿즈옵션 -->
            
            <hr><br>

            <div>
                <table class="width">
                    <tr>
                        <td class="op_subTitle" style="font-size:20px; font-weight: bolder;">결제금액</td>
                        <td class="t_align_right" id="totalPrice">${ artBoard.price }</td>
                    </tr>
                </table>
            </div>
            <br><hr><br>

			<input type="hidden" name="nickName " value="${artBoard.member.nickName}">
			<input type="hidden" name="orderType " value="D">
			<input type="hidden" name="orderContent " value="${artBoard.board.boardTitle}">
			<input type="hidden" name="price" value="${ artBoard.price }">
			<input type="hidden" name="orderStatus" value="진행중">
			<input type="hidden" name="defaultSize" value="${artBoard.defaultSize}">
			<input type="hidden" name="count" value="${artBoard.modifyCount}">
			
            <div id="btnRequest" class="center">
            	<form action="chating.co">${artBoard.member.nickName}
            		<input type="hidden" name="boardNo" value="${ bno }">
            		<input type="hidden" name="totalPrice">
            		<input type="hidden" name="boardTitle " value="${artBoard.board.boardTitle}">
            		<button onclick="return toChat();">작가에게 주문요청</button>
            	</form>
                
            </div>

            <script>

                function toChat(){
                	$('input[name=totalPrice]').val($('#totalPrice').val());
                		return true;
                	}
                    /*let requestArr = [];
                    let priceArr = [];
                    
                    // querySelectorAll로 잡으면 type면서도 충돌이 일어날 가능성이 높음
                    let optionSelect = document.getElementsByClassName('select');
                    // console.log(optionSelect);
                    for(var i = 0; i < optionSelect.length; i++){
                        let option = optionSelect[i].options[optionSelect[i].selectedIndex];
                        // console.dir(option);
                        if(option.text != '==='){
                            priceArr.push(option.value);
                            requestArr.push(option.text.replace(option.value + '원', "").trim());
                        }
                    }
                    let requestStr = requestArr.join(",");
                    let priceStr = priceArr.join(",");
                    
                    let f = document.createElement('form');
                    
                    
                    /* 여기는 옵션을 db에 넣는 기능 insertReasonPrice.co맵핑값으로 ajax요청 후 성공시 chating.co를 불러야함 
                    /*
                    let requestInput = document.createElement('input');
                    requestInput.setAttribute('tyep', 'hidden');
                    requestInput.setAttribute('name', 'addPrices');
                    requestInput.setAttribute('value', requestStr);
                    
                    // let priceInput = document.createElement('input');
                    // priceInput.setAttribute('type', 'hidden');
                    // priceInput.setAttribute('name', 'request');
                    // priceInput.setAttribute('value', priceStr);
                    
                    f.append(requestStr)
                    f.append(priceStr);
                    f.setAttribute('method', 'post');
                    f.setAttribute('action', 'insertReasonPrice.co');
                    */
                    let f = document.createElement('form');
                    let requestInput = document.createElement('input');
                    requestInput.setAttribute('tyep', 'hidden');
                    requestInput.setAttribute('name', 'boardNo');
                    requestInput.setAttribute('value', '${ bno }');
                    
                    f.setAttribute('method', 'get');
                    f.setAttribute('action', 'chating.co');
                    
                    // let btnRequest = document.getElementById('btnRequest');
                    // btnRequest.appendChild(f);
                    // f.submit();


                    
                    // console.log(requestStr);
                    // console.log(priceStr);

                    // for(let option of options){
                    //     if(option.text != '==='){
                    //         console.log("asd")
                    //     }
                    // }
                    // for(let option2 in options){
                    //     console.log(option2);
                    //     if(option2.text != '==='){
                    //         console.log("asd")
                    //     }
                    // }*/


                


            </script>

        </div>
<!-- 오른쪽 정보 끝 -->
        
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    

    
    <script>
        
        window.onload = () => {

            /* 문의댓글 조회 ajax */
            selectReplyList();

            /* 옵션 불러오기 */
            let optionTable = document.getElementById('optionTable');
            let optionList = JSON.parse('${ optionList }');
            for(var eachOption of optionList){
                let select = document.createElement('select');
                select.style.textAlign = 'center';
                select.className = 'select';
                select.addEventListener('change',  choice);
                select.style.width = '70%';
                
                let option = document.createElement('option');
                option.value = 0;
                option.innerHTML = '===';
                select.append(option);
                for(var detailOption of eachOption.detailOption){
                    let option = document.createElement('option');
                    option.value = detailOption.price;
                    option.innerHTML = detailOption.detail + '&nbsp;&nbsp;&nbsp;&nbsp;' + detailOption.price;
                    select.append(option);
                }
                let tr = document.createElement('tr');
                let td1 = document.createElement('td');
                let td2 = document.createElement('td');
                td1.innerHTML = eachOption.mainOp;
                td2.className = 't_align_right';
                td2.append(select);
                tr.append(td1);
                tr.append(td2);
                optionTable.append(tr);
            }

            /* 등록이미지 불러오기 */
            let artImages = document.getElementById('artImages');
            let boardImages = JSON.parse('${ boardImage }');
            for(var img of boardImages){
                if(img.fileLevel != 3){
                    let div = document.createElement('div');
                    if(img.fileLevel == 2){
                        div.className = 'list';
                    }
                    let imgTag = document.createElement('img');
                    imgTag.setAttribute('class', 'detail_img');
                    imgTag.setAttribute('src', img.modifyName);
                    div.append(imgTag);
                    artImages.append(div);
                }
            }

            /* 상세설명 div */
            let boardContent = JSON.parse('${ artBoard.board.boardContent }');
            let explain = document.getElementById('explain');
            for(var i = 0; i < boardContent.length; i++){
                console.log(boardContent[i].type);
                if(boardContent[i].type == 'text'){
                    explain.append(boardContent[i].data);
                }
                else{
                    let explainImg = document.createElement('img');
                    explainImg.setAttribute("src", boardContent[i].data);
                    explainImg.setAttribute("width", '80%');
                    explain.append(document.createElement('br'));
                    explain.append(explainImg);
                    explain.append(document.createElement('br'));
                }
            }
        }

        // 클릭 시 해당 글 위치로 이동
        function move(name){
            var location = document.getElementById(name).offsetTop;
            window.scrollTo({top:location - 200, behavior:"smooth"});
        }
		
		function choice(){
			let number = parseInt('${ artBoard.price }');
            let option = document.querySelectorAll('.select > option:checked');
			for(var i = 0; i < option.length; i++){
                number += parseInt(option[i].value);
            }
            let price = document.getElementById('totalPrice');
            price.innerHTML = number;
		}

        function selectReplyList(){
            $.ajax({
                url : 'rlist.at',
                data : {
                    boardNo: "${ bno }"
                },
                success : function(replyList){
                    let value="";
                    if(replyList.length == 0){
                        value += '<h5>댓글이 존재하지 않습니다.</h5>';
                        $('#replyArea thead').html(value);
                    }   
                    else {
                        for(let i of replyList){
                            console.log(i.memberNo == '${loginMember.memberNo}');
    
                            value  +='<input type="hidden" value="'+ i.boardNo + '">'
                                    +'<table class="t_align_left" style="border: 1px solid black;">'
                                        +'<tr>'
                                            +'<td width="15%" rowspan="2" style="padding:10px; border-right: 1px solid lightslategray;">'
                                                +'<img class="width" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif">'
                                            +'</td>'
                                            +'<td width="75%" style="padding-left:10px;">' + i.nickname + '</td>'
                                            +'<td width="10%" rowspan="2">';
    
                            if(i.memberNo == '${loginMember.memberNo}'){
                                value +=         '<a href="deleteReply.at?bno=${ bno }&replyNo=' + i.replyNo + '" style="background-color: white; border: none;">'
                                                +'<img src="https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_delete_forever_48px-512.png" width="40"  alt=""></a>';
                            }
    
                            value +=        '<a href="" style="background-color: white; border: none;"><img src="https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_report_48px-512.png" width="40" alt=""></a>'
                                        +'</td>'
                                    +'</tr>'
                                    +'<tr>'
                                        +'<td style="padding-left:10px;">' + i.content + '</td>'
                                    +'</tr>'
                                +'</table>';
                        };
                        $('#replyArea thead').html(value);
                    }                 
                },
                error : function(){
                    console.log('댓글 목록 조회 실패');
                }
                
            })
        }
        

        function insertReply(){
                
                // #insertcontent 의 val의 공백 => .trim()
            let content = $('#insertcontent').val();
            // console.log(content);
                
            if($('#insertcontent').val().trim() != ''){
                $.ajax({
                    url : 'rinsert.at',
                    data : {
                        boardNo :  "${ bno }",
                        content : $('#insertcontent').val(),
                        memberNo : '${loginMember.memberNo}'
                    },
                    success : function(result){
                        console.log(result);
                        
                        if(result == 'success'){ 
                            selectReplyList();
                            $('#insertcontent').val('');
                        };
                    },
                    error : function(){
                        console.log('실패!~!~!~!~!');
                    }
                });
            }else{
                window.alert('5252~!~!~!');
                
            }
        };










    </script>

</body>
</html>