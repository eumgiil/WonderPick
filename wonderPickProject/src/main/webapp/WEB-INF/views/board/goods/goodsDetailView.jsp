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
            width:1000px;
            margin:auto;
            margin-top: 150px;
        }
        .detail{
            float: left;
            /* display: inline-block; */
            width : 65%;
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
            width : 150px;
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
            margin: 0 auto;
            align-content: center;
            text-align:center;
        }
        a {color: #333; text-decoration: none;}
        .width{
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="content">

        <!-- 여기는 제품 사진 및 정보 -->
        <div class="detail" style="margin-right:20px; margin-bottom: 50px;" align="center">

            <div class="">
                <div class="">
                    <img class="detail_img" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif" alt="">
                </div>
                <div class="list">
                    <img class="detail_img" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif" alt="">
                </div>
                <div class="list">
                    <img class="detail_img" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif" alt="">
                </div>
                <div class="list">
                    <img class="detail_img" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif" alt="">
                </div>
                <div class="list">
                    <img class="detail_img" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif" alt="">
                </div>
            </div>

            
            <br><br>

            <div>
                ★★★☆☆  3.1( xx개 평가 )
            </div>
            
            <br><br><hr><br>

            <div>
                <a href="#scroll1" class="scroll_move">상세설명</a> |
                <a href="#scroll2" class="scroll_move">취소 및 환불규정</a> |
                <a href="#scroll3" class="scroll_move">구매 리뷰</a> |
                <a href="#scroll4" class="scroll_move">문의 댓글</a> 
            </div>

            <br><br>

            <div id="scroll1">
                <h3>[ 상세 설명 ]</h3>
            </div>

            <br><br><br>

            <div>
                여기는 설명 사진하고 글 ~~~
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
                        <c: set var="reviewList" value="${ reviewList }" scope="request" />
                <table border="1">
                    <!-- 여기 부분 반복 -->
                    <tr>
                        <td style="height:10px;">아이디</td>
                        <td rowspan="4" width="30%">
                            <img width="100%" height="100%" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif">
                        </td>
                    </tr>
                    <tr>
                        <td class="height_10px" id="">
                        <c:choose>
                            <c:when test="${ 별점 == 1}">
                                <label for="starpoint_1" class="label_star" title="1"><span class="blind">★☆☆☆☆</span></label>
                            </c:when>
                            <c:when>
                                <label for="starpoint_2" class="label_star" title="2"><span class="blind">★★☆☆☆</span></label>
                            </c:when>
                            <c:when>
                                <label for="starpoint_3" class="label_star" title="3"><span class="blind">★★★☆☆</span></label>
                            </c:when>
                            <c:when>
                                <label for="starpoint_4" class="label_star" title="4"><span class="blind">★★★★☆</span></label>
                            </c:when>
                            <c:otherwise>
                                <label for="starpoint_5" class="label_star" title="5"><span class="blind">★★★★★</span></label>
                            </c:otherwise>
                        </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <td class="height_10px">날짜</td>
                    </tr>
                    <tr>
                        <td class="height_10px">내용</td>
                    </tr>

                    <!--  반복시 hr 태그 추가되도록
                    <tr>
                        <td colspan="2"><hr style="width:200px;"></td>
                    </tr>
                    -->
                </table>
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
                <hr>
                <br>
                <c:choose>
                    <c:when test="${not empty replyList}">
                        <c: set var="replyList" value="${ replyList }" scope="request" />
                <table class="t_align_left" border="1">
                    <tr>
                        <td width="15%" rowspan="2" style="padding:10px; border-right: 1px solid lightslategray;">
                            <img class="width" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif">
                        </td>
                        <td width="70%" style="padding-left:10px;">아이디</td>
                        <td width="15%" rowspan="3">
                            <!--
                                입력한 사람한텐 삭제,
                                아닌 사람한텐 신고
                            -->
                            <!-- 삭제 -->
                            <a href="" style="background-color: white; border: none;"><img src="https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_delete_forever_48px-512.png" width="40"  alt=""></a>
                            <!-- 신고 -->
                            <a href="" style="background-color: white; border: none;"><img src="https://cdn0.iconfinder.com/data/icons/google-material-design-3-0/48/ic_report_48px-512.png" width="40" alt=""></a>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:10px;">댓글 내용 : 것이 따뜻한 봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의</td>
                    </tr>
                </table>
                </c:when>
                <c:otherwise>
                    <h6>댓글 내역이 존재하지 않습니다.</h3>
                </c:otherwise>
                </c:choose>

                <br>
                <form action="" method="post">
                <textarea class="width" name="content" id="" rows="10" maxlength="500" style="resize:none;"></textarea>


                <div class="t_align_right width" >
                    <button type="submit" class="btn btn-secondary" style="color: rgb(255, 131, 153);">작성하기</button>
                </div>
                </form>
            </div>


            <br><br><br><br><br>







        </div>
        <!-- 왼쪽 끝 -->


        




        <!-- 오른쪽 정보 -->
        <div class="artist" style="margin-left:10px;">

            <div>
                <table class="width" >
                    <tr>
                        <th style="font-size: 35px;"><img src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-heart-256.png" width="30" style="float: left;"alt=""></th>
                        <td class="t_align_right"><a href="" class="btn btn-secondary" style="width: 100px;">수정</a></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="font-size: 25px; font-weight:bold;">작품명</td>
                    </tr>
                </table>
            </div>

            <hr>

            <div>
                <table class="width">
                    <tr>
                        <td rowspan="2" style="width:100px;"><img class="detail_img" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif" alt=""></td>
                        <td style="font-size: 30px;">작가명</td>
                    </tr>
                    <tr>
                        <td style="font-size: 20px;">★★★★☆</td>
                    </tr>
                </table>
            </div>

            <hr>
            <br>

            <div class="op_title">
                <h3 class="op_title width">상세옵션</h3>
            </div>

            <div class="">
                <table class="width">
                    <tr>
                        <td>기본 시안 횟수</td>
                        <td class="t_align_right">2회</td>
                    </tr>
                    <tr>
                        <td>기본 수정 갯수</td>
                        <td class="t_align_right">2회</td>
                    </tr>
                    <tr>
                        <td>작업기간</td>
                        <td class="t_align_right">시작일로부터 1주일</td>
                    </tr>
                </table>
            </div>

            <br><br>


            <div >
                <h3 class="op_title width">굿즈 옵션</h3>
            

            <div class="">
                <table class="goods_option" border="1">
                    <tr>
                        <td width="40%">추가시안횟수</td>
                        <td class="t_align_right">
                            <input type="number" style="width: 25%;" id="addDraft" class="form-control num_only num_comma num_sum" >회
                        </td>
                    </tr>
                    <tr>
                        <td>추가수정횟수</td>
                        <td class="t_align_right">
                            <input type="number" style="width: 25%;" id="addModify" class="form-control num_only num_comma num_sum" >회
                        </td>
                    </tr>
                    <tr>
                        <td>주문수량</td>
                        <td class="t_align_right">
                            <input type="number" style="width: 25%;" id="amount" class="form-control num_only num_comma num_sum" >개
                        </td>
                    </tr>
                </table>
            </div>
            </div>
            <hr>
            <br>

            <div>
                <table class="goods_option">
                    <tr>
                        <td class="op_subTitle" style="font-size:20px; font-weight: bolder;" class="num">결제금액</td>
                        <td class="t_align_right"><input type="text" class=" num_only num_comma num_sum" id="totalPrice" placeholder="${price}"></td>
                    </tr>
                </table>
            </div>

            <hr>
            <br>

            <div class="center">
                <button type="submit" class="btn btn-info" style="border: none; background-color:  black; color: rgb(255, 131, 153);">작가에게 주문요청</button>
            </div>

        </div>
        <!-- 오른쪽 정보 끝 -->
        

        <!-- 주문 금액 계산 -->
        <script>
            $(function(){
                $('input.num_only').on('keyup', function(){
                    var count = $('.goods_option input.num_sum').length;
                    console.log(count);

                    for(var i=1; i<count; i++){
                        var sum = parseInt($(this).val() || 0);
                        sum++
                        console.log(sum);
                    }

                    var sum1 = parseInt($("#addDraft").val() || 0);
                    var sum2 = parseInt($("#addModify").val() || 0);
                    var sum1 = parseInt($("#amount").val() || 0);

                    var sum = sum1 + sum2 + sum3;

                    console.log(sum);
                    $("#totalPrice").val(sum);
                    
                });
            });
        </script>
 
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>