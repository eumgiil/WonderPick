<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<head>
    <meta charset="UTF-8">
    <title>굿즈상세페이지</title>
    <style>
        .content {
            /* background-color:rgb(247, 245, 245); */
            width:900px;
            margin-left:500px;
            margin-top: 5px;
            
        }
        .detail{
            float: left;
            width:600px;
            margin-left:150px;
            /* display: inline-block; */
        }        
        .detail_img{
            width: 100%;
        }
        .artist{
            display: inline-block;
            width:300px;
            margin-right:300px;
            float : right;
            
        }
        .list{
            display: inline-block;
        }
        
        .t_align_right{
            text-align: right;
        }
        
        
        .t_align_right input{
            width: 200px;
        }
        
        .t_align_left{
            text-align: left;
        }
        
        .op_title{
            text-align: center;
            background-color:  rgb(255, 131, 153);;
        }
        
        .goods_option{
            width:100%;
        }
        
        .height_10px{
            height:10px;
        }
        
        .center{
            margin:  auto;
            align-content: center;
            text-align:center;
        }
        
        a {color: #333; text-decoration: none;}
        .width{
            width: 100%;
        }
        .product{
        
        
        }
        .reReply{
        border : 1px solid black;
        }
        .goodsImage{
        width:270px;
        height:270px;
        }
        
        .category{
            float: left;
            width:400px;
            margin-left: 5%;
            margin-top: 10%;
            height: 500px;

        }
        .category a{
            text-decoration: none;
            color: black;
            font-weight: bolder;
        }
        .category a:hover{
            color :rgb(255, 131, 153);
            font-size: larger;
        }
        
        .category_option{
            height: 300px;
            width: 100%;
        }
        #filelevel2{
          display: inline-block;
        }
        
    </style>
</head>
<body>

	 <jsp:include page="../../common/header.jsp" />
	 
	 <div class="category">
        <h3 style="font-weight: bold; color:rgb(255, 131, 153) ;">카테고리</h3>
        <hr style="border: 1px solid black; width: 200px;">
        <table class="category_option">
            <tr>
                
                <td><a href="categorylist.go?goodsCategory=FASHION&cPage=1">패션</a></td>
            </tr>
            <tr>
                <td><a href="categorylist.go?goodsCategory=KITCHEN&cPage=1">주방</a></td>
            </tr>
            <tr>
                <td><a href="categorylist.go?goodsCategory=INTERIOR&cPage=1">인테리어</a></td>
            </tr>
            <tr>
                <td><a href="categorylist.go?goodsCategory=STATIONERY&cPage=1">문구</a></td>
            </tr>
            <tr>
            </tr>
                <td><a href="categorylist.go?goodsCategory=ETC&cPage=1">기타</a></td>
            </tr>
        </table>


    </div>
 
    <div class="content" align="center" >
		<h2 align="center" style="color: rgb(255, 131,  153); font-weight:bolder;">굿즈</h2>
		<br>
		<hr>
		<br>
		 <div class="product" align="center">
        <!-- 여기는 제품 사진 및 정보 -->
        <div class="detail"  align="center">

            <div class="list">
	             <c:if test="${not empty bi }">
	            	<table border="1" class="goodsImage" >
		             	<c:forEach items="${bi}" var="bi">
			            	 <c:if test="${ bi.fileLevel eq 1 }">
				            	<tr>
				            	    <td colspan="3"><img class="detail_img" src="${bi.filePath}" alt=""></td>
				            	</tr>
			            	 </c:if>
				            	<tr >
				            	
				            	    <c:if test="${ bi.fileLevel eq 2 }"> 
					            	<td ><img class="detail_img" id="filelevel2" src="${bi.filePath}" alt="" ></td>
					            	</c:if>	
				            	</tr>
				            
			             </c:forEach>	
		            </table>
		          </c:if>   	
            </div>	
            
           
 
 <br><br><br>
            <div>
                ★★★☆☆  3.1( xx개 평가 )
            </div>
           
            <br><br><hr><br>
            
 
            <div>
                <a href="#scroll1" class="scroll_move"  style="color:rgb(255, 131, 153);">상세설명</a> |
                <a href="#scroll2" class="scroll_move"  style="color:rgb(255, 131, 153);">취소 및 환불규정</a> |
                <a href="#scroll3" class="scroll_move"  style="color:rgb(255, 131, 153);">구매 리뷰</a> |
                <a href="#scroll4" class="scroll_move"  style="color:rgb(255, 131, 153);">문의 댓글</a> 
            </div>

            <br><br>

            <div id="scroll1">
                <h3>[ 상세 설명 ]</h3>
            </div>

            <br><br><br>

            <div>
                ${g.boardContent }
            </div>




            <script>
                $(document).ready(function($) {
                    $(".scroll_move").click(function(event){
                        console.log(".scroll_move");         
                        event.preventDefault();
                        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
                    });

                });
            </script>

            <br><br><br>

            <div id="scroll2">
                <h3>[ 취소 및 환불 규정 ]</h3>
            </div>
            
            <hr>
                
            <div>
                <p>
                    것이 따뜻한 봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의
                    따뜻한 봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도
                    그러므로 그들은 이상의 보배를 능히 품으며 그들의 이상은 아름답고 소담스러운 열매를 맺어 우리 인생을 풍부하게 하는 것이다 보라 청춘을 ! 그들의 몸이 얼마나 튼튼하며 그들의 피부가 얼마나 생생하며
                </p>
            </div>

            <br><br><br><br><br>

            <div id="scroll3">
                <h3>[ 구매 리뷰 ]</h3>
            </div>

            <hr>
            <br>

            <div style="padding:10px;">
                <c:choose>
                    <c:when test="${not empty reviewList}">
                        <c:forEach items="${reviewList}" var="r">
                <table border="1">
                    <!-- 여기 부분 반복 -->
                    <tr>
                        <td style="height:10px;">${r.nickname }</td>
                        <td rowspan="4" width="30%">
                            <img width="100%" height="100%" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif">
                        </td>
                    </tr>
                    <tr>
                        <td class="height_10px" id="">
                        <c:choose>
                            <c:when test="${ r.star == 1}">
                                <label for="" class="label_star" title="1"><span class="blind">★☆☆☆☆</span></label>
                            </c:when>
                            <c:when test="${ r.star == 2}">
                                <label for="" class="label_star" title="2"><span class="blind">★★☆☆☆</span></label>
                            </c:when>
                            <c:when test="${ r.star == 3}">
                                <label for="" class="label_star" title="3"><span class="blind">★★★☆☆</span></label>
                            </c:when>
                            <c:when test="${ r.star == 4}">
                                <label for="" class="label_star" title="4"><span class="blind">★★★★☆</span></label>
                            </c:when>
                            <c:otherwise>
                                <label for="" class="label_star" title="5"><span class="blind">★★★★★</span></label>
                            </c:otherwise>
                        </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <td class="height_10px">${r.createDate }</td>
                    </tr>
                    <tr>
                        <td class="height_10px">${ r.boardContent }</td>
                    </tr>

                    <!--  반복시 hr 태그 추가되도록
                    <tr>
                        <td colspan="2"><hr style="width:200px;"></td>
                    </tr>
                    -->
                </table>
                </c:forEach>
                </c:when>
                <c:otherwise>
                    리뷰 내역이 존재하지 않습니다.
                </c:otherwise>
            </c:choose>
            </div>

            <hr>


            <br><br>

            <div id="scroll4">
                <h3>[ 문의 댓글 ]</h3>
				<table id="replyArea" align="center" border="1">
				<thead>
				<c:choose>
                    <c:when test="${empty replyList }">
                        <h6>댓글 내역이 존재하지 않습니다.</h3>
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
                </c:choose>
				</thead>
				<tbody>
				<br>
				<c:choose>
				<c:when test="${empty loginMember}" >
				<hr>
				<table >
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
				     <input type="hidden" value="${g.boardNo}" id="boardNo" name="${g.boardNo }">
				     <input type="hidden" value="${loginMember.memberNo }" name="${loginMember.memberNo}">
                     <textarea class="form-control" name="content" id="insertcontent" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
                     
                     </th>
                     <br>
                     <th style="vertical-align:middle">
                     <button type="button" class="btn btn-secondary"  onclick="insertReply();" id="replysubmit">등록하기</button>
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
        <!-- 왼쪽 끝 -->	
        <script>
        $(function(){
            selectReplyList();
          	//selectHeart();
        	//updateHeart();
         });
        
        
        		function insertReply(){
        			
                        // #insertcontent 의 val의 공백 => .trim()
                    let content = $('#insertcontent').val();
                    console.log(content);
                        
                    if($('#insertcontent').val().trim() != ''){
                        $.ajax({
                            url : 'rinsert.go',
                            data : {
                                boardNo :  '${g.boardNo}',
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
                
                
        	
                function selectReplyList(){
             	   console.log("실행은 됨")
             	   $.ajax({
             		   url : 'rlist.go',
             		   data : {
             			   boardNo: '${g.boardNo}'
             		   },
             		   success : function(replyList){
             			   console.log(replyList);
             			   console.log('loginMember.memberNo : ' + '${loginMember.memberNo}');
             			   console.log(' replyList[i].memberNo : ' + '${ replyList[i].memberNo}');
             			   console.log('asdasd');
             			   let value="";
             			   for(let i in replyList){
             				   value   += '<input type="hidden" value="'+ replyList[i].boardNo + '">'
             				   		   + '<table class="t_align_left" style="border: 1px solid black;">'
     	        					   + '<tr>'
     	        					   +'<td width="15%" rowspan="2" style="padding:10px; border-right: 1px solid lightslategray;">'
     	        					   +'<img class="width" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif">'
     	        					   +'</td>'
     	        					   +'<td width="75%" style="padding-left:10px;">' + replyList[i].nickname + '</td>'
     	        					   +'<td width="10%" rowspan="2">'
     	        					   + '<c:if test="' + ${loginMember.memberNo eq replyList[i].memberNo}+ '"  >'
     	        					   +'<a href="deleteReply.go" style="background-color: white; border: none;"><img src="https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_delete_forever_48px-512.png" width="40"  alt=""></a>'
     	        					   + '</c:if>'
     	        					   +'<a href="" style="background-color: white; border: none;"><img src="https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_report_48px-512.png" width="40" alt=""></a>'
     	        					   +'</td>'
     	        					   +'</tr>'
     	        					   +'<tr>'
     	        					   +'<td style="padding-left:10px;">' + replyList[i].content + '</td>'
     	        					   +'</tr>'
     	        					   +'</table>';
             				   
             			   };
             			   $('#replyArea thead').html(value);
             		   },
             		   error : function(){
             			   console.log('댓글 목록 조회 실패');
             		   }
             		   
             	   });
                };
                
           
           
        </script>
		</div>
		</div>
		
        <!-- 오른쪽 정보 -->
        <div class="artist" >

            	<div>
	                <table class="width" >
	                    <tr>
	                      <c:choose>
		                       <c:when test="${heart.memberNo.equals(loginMember.memberNo) }">
		                        <th style="font-size: 35px;"><img src="resources/common/heart.png" width="30" style="float: left;"alt="" id="heart" onclick="updateHeart();"></th>
		                       </c:when>
		                       <c:otherwise>
		                       <th style="font-size: 35px;"><img src="resources/common/noheart.png" width="30" style="float: left;"alt="" id="heart" onclick="updateHeart();"></th>
		                       </c:otherwise>
	                      </c:choose>
	                        <c:choose >
	                        <c:when test="${loginMember.nickName eq g.nickName}">
	                        <input type="hidden" value="${g.boardNo}">
	                        <td class="t_align_right"><a href="updateForm.go?boardNo=${ g.boardNo }" class="btn btn-secondary" style="width: 100px;">수정</a></td>
	                        </c:when>
	                        <c:otherwise>
	                        <td></td>
	                        </c:otherwise>
	                        </c:choose>
	                    </tr>
	                    <tr>
	                        <td colspan="2" style="font-size: 25px; font-weight:bold;">${g.boardTitle }</td>
	                    </tr>
	                </table>
            	</div>

            	<hr>

	            <div>
	                <table class="width">
	                    <tr>
	                        <td rowspan="2" style="width:100px;"><img class="detail_img" src="${g.memberModifyName }" alt=""></td>
	                        <td style="font-size: 30px;">${g.nickName}</td>
	                    </tr>
	                    <tr>
	                        <td style="font-size: 20px;">★★★★☆</td>
	                    </tr>
	                </table>
	            </div>
            
            <script>
           
            
            $(function(){
            	// selectHeart();
            	// updateHeart();
            });
            
            

            
            
            </script>
            

            	<hr>
            	<br>

	            <div class="op_title">
	                <h3 class="op_title width">상세옵션</h3>
	            </div>

	            <div class="">
	                <table class="width">
	                    <tr>
	                        <td>기본 시안 횟수</td>
	                        <td class="t_align_right">${g.draft }회</td>
	                    </tr>
	                    <tr>
	                        <td>기본 수정 갯수</td>
	                        <td class="t_align_right">${g.modifyCount }회</td>
	                    </tr>
	                    <tr>
	                        <td>작업기간</td>
	                        <td class="t_align_right">${g.workday }일</td>
	                    </tr>
	                </table>
	            </div>

            	<br><br>


            	<div>
                <h3 class="op_title width">굿즈 옵션</h3>
                </div>
            

	            <div class="right">
		            <form action="order.go" method="post">
		                <table class="goods_option" >
		                <input type="hidden" value="${g.boardNo}"> 
		                    <tr>
		                        <td width="50%">추가시안횟수</td>
		                        <td class="t_align_right" style="float:right;" width="100%">
		                            <input type="number" min="0" style="width: 100px; " id="addDraft" name="addDraft">회
		                       </td>
		                    </tr>
		                    <tr>
		                        <td>추가수정횟수</td>
		                        <td class="t_align_right">
		                            <input type="number" min="0" style="width: 100px;" id="addModify" name="addModify">회
		                        </td>
		                    </tr>
		                    <tr>
		                        <td>주문수량</td>
		                        <td class="t_align_right">
		                            <input type="number" min="1" style="width: 100px;" id="amount" id="amount" >개
		                        </td>
		                    </tr>
		                    <tr>
		                        <td class="op_subTitle" style="font-size:20px; font-weight: bolder;" class="num">결제금액</td>
		                        <td class="t_align_right" min="${g.price}" id="totalPrice" onchange="choice()" name="price"> ${g.price} 원</td>
		                    </tr>
		                    <tr><td colspan="2"><hr></tr>
		                    <tr>
		                    	<td colspan="2">
		                    	<div class="center">
					                <button type="submit" onclick="orderGoods()" class="btn btn-info" style="border: none; background-color:  black; color: rgb(255, 131, 153); width:100%; ">작가에게 주문요청</button>
					            </div>
		                    	</td>
		                    <tr>
		                </table>
		              </form>
	           </div>
	           
	           
	           
	            <hr>
	            <br>
            
            
            <script>
            
            
            function choice(){
            	let addDraft = ${g.addDraft} * $('#addDraft').val();
            	let addModify = ${g.addModify} * $('#addModify').val();
            	let amount = $('#amount').val();
            	let price = ${g.price};
            	
            	let number = parseInt( addDraft + addModify + (price * amount));
            	console.log(number);
            	
            	let totalPrice = document.getElementById('totalPrice');
            	totalPrice.innerHTML = number;
            	
            	
            	//let addDraft = parseInt($('#addDraft').val())*parseInt('${g.addDraft}')  ;
            	//let addModify = parseInt($('#addModify').val())*parseInt('${g.addModify}');
            	//let amount = parseInt($('#amount').val());
            	
            	//let totalPrice =  document.getElementById('totalPrice');
            	//totalPrice.innerHTML = $('${g.price}').val() + addDraft + addModify + amount);
            	
            	
            }
            </script>
            

            <hr>
            <br>

		</div>
        
        <!-- 오른쪽 정보 끝 -->
        

        
        
 
    

    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>