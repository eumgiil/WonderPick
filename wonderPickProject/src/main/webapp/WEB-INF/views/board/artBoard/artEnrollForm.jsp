<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>굿즈상품입력페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .all_area{
            width: 900px;   
            margin: auto;
            padding-top : 70px;
        }
        .all_area table{
            width:750px;
            table-layout: fixed; 
        }
        .all_area table th{
            text-align: center;
            width:150px;
        }
        .title{
            color: rgb(255, 131, 153);
            font-weight: bolder;
            text-align: center;
        }
        .sub_title{
            font-weight:bolder;
        }
        .contentImg{
            width:100%;
            height:100%;
        }
        .line{
            border: 1px solid gray; width: 800px;
        }
        #explain{
            border : 1px solid gray;
            width: 100%;
            height:auto;
            min-height: 400px; 
            overflow:auto;
            display: inline-block;
        }
    </style>
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
    <div class="all_area">

        <div>
            <h2 class="title">그 상품 등록</h2>
            <hr class="line">
        </div>
        
        <br>


        <form id="form" method="post" enctype="multipart/form-data">

            <div style="display:none;" id="file-area">
		        <input type="file" id="file1" name="upFile" onchange="loadImg(this, 1);">
		        <input type="file" id="file2" name="upFile" onchange="loadImg(this, 2);">
		        <input type="file" id="file3" name="upFile" onchange="loadImg(this, 3);">
		        <input type="file" id="file4" name="upFile" onchange="loadImg(this, 4);">
	    	</div>

	        <table id="art_table" align="center">
	            <tbody>
	                <tr>
	                    <th>
	                        <h5 class="sub_title">카테고리</h5>
	                    </th>
	                    <td>
	                        <select id="category" name="category">
	                            <option value="CI">캐릭터 일러스트</option>
	                            <option value="I">일러스트</option>
	                            <option value="V">버츄얼</option>
	                            <option value="D">디자인</option>
	                            <option value="W">웹툰</option>
	                        </select>
	                    </td>
	                </tr>
	                <tr>
	                    <th><h5 class="sub_title">상품명</h5></th>
	                    <td colspan="3"><input type="text" id="boardTitle" name="boardTitle" style="width: 85%;"/></td>
	                </tr>
	                <tr>
	                    <th><h5 class="sub_title">상품가격</h5></th>
	                    <td><input type="number" name="price" style="width: 70%;" required />원 </td>
	                </tr>
	                <tr>
	                    <th><h5 class="sub_title">상품 대표 이미지</h5></th>
	                    <td align="center" colspan="3">
	                        <img id="titleimg" class="contentImg" src="https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg" alt="" >
	                    </td>
	                </tr>
	                <tr>
	                    <th>
	                        <h5 class="sub_title">상세이미지</h5>
	                    </th>
	                    <td><img id="contentImg1" class="contentImg" src="https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg" alt=""></td>
	                    <td><img id="contentImg2" class="contentImg" src="https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg" alt=""></td>
	                    <td><img id="contentImg3" class="contentImg" src="https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg" alt=""></td>
	                </tr>
	                <tr>
	                    <th><h5 class="sub_title">상품설명</h5></th>
	                    <td colspan="3">
                            <input type="file" id="explainFile" name="upFile" onchange="explain(this);">

	                    	<div name="explain" id="explain" contentEditable='true' onkeyup="deleteImg(event)" onblur="loseFocus(this)"></div>

                            <input type="hidden" id="boardContent" name="boardContent">
	                    </td>
	                </tr>
	                <tr>
	                    <th><h5 class="sub_title">파일유형</h5></th>
	                    <td><input type="text" class="required" name="fileType" maxlength="5" required></td>
	                </tr>
	                <tr>
	                    <th><h5 class="sub_title">해상도</h5> </th>
	                    <td><input type="text" class="required" name="dpi" maxlength="20" required></td>
	                </tr>
	                <tr>
	                    <th><h5 class="sub_title">기본사이즈</h5></th>
	                    <td><input type="text" class="required" name="defaultSize" maxlength="50" required></td>
	                </tr>
	                <tr>
	                    <th><h5 class="sub_title">기본수정횟수</h5></th>
	                    <td><input type="number" class="required" name="modifyCount" required></td>
	                </tr>
	                <tr>
	                    <th><h5 class="sub_title">작업기간</h5></th>
	                    <td><input type="text" class="required" name="workday" required></td>
	                </tr>
	                <tr>
	                    <th colspan="4"><hr class="line"></th>
	                </tr>
	                <!-- 옵션 -->
	                <tr>
	                    <th colspan="4">
	                        <h5 class="sub_title">옵션</h5>
	                        <button type="button" onclick="op_plus();">메인옵션추가</button>
	                    </th>
	                </tr>
	
	                
	                <!-- 끝 옵션 -->
	            </tbody>
	        </table>
	
	        <br><br>
	
	        <table align="center">
	            <tr>
	                <td colspan="5"><hr class="line"></td>
	            </tr>
	            <tr>
	                <td colspan="5" align="center"><div onclick="start();" class="btn btn-info" style="width: 50%; height: 40px; 
	                background-color:  rgb(255, 131, 153); color: black; border: none;">굿즈 판매 요청하기</div></td>
	            </tr>
	        </table>
	        
            <input type="hidden" id="options" name="options" value="'+ options +'">
            
	    </form>

    </div>
    <br><br><br><br>







    <script>

        /* 옵션+버튼 스크립트 */
        let i = 1;
        let j = 1;
        let num;
        var art_table = document.getElementById('art_table');
        

        function op_plus(){
            let value = '';
            value = '<th>'
                        +'<button type="button" onclick="detail_op_plus(this);" style="float:left;">+</button>'
                        +'<h5 class="sub_title">옵션카테고리'+ i +'</h5></th>'
                    +'<td>'
                        +'<input type="text" name="option_' + i + '" id="option_' + i + '">'
                    +'</td>'
                    +'<th><h5 class="sub_title"></h5></th>'
                    +'<td>'
                        +'<input type="text" readonly id="price_' + i + '">'
                    +'</td>';
            var tbody = document.createElement('tbody');
            tbody.id = ('tbody' + i);
            var tr = document.createElement('tr'); 
            tr.id = ('newTr'+i);

            tr.innerHTML = value;
            tbody.append(tr);
            art_table.append(tbody);
            i++;
        }
        /* 끝 - 옵션+버튼 스크립트 */
        
        function detail_op_plus(e){

        	let tbody = e.parentElement.parentElement.parentElement;
            console.log(e);
            let id = tbody.id;
            // let str = id.slice(0, id.indexOf('y') + 1);
            num = parseInt(id.slice(id.indexOf('y')+1));
            let value = '';
            value = '<th>'
                        +'<h5>옵션명</h5></th>'
                    +'<td>'
                        +'<input type="text" name="detailOp'+ num +'" class="detailOp'+ num +'">'
                    +'</td>'
                    +'<th><h5>가격</h5></th>'
                    +'<td>'
                        +'<input type="text" name="opPrice'+ num +'" class="opPrice'+ num +'" oninput="this.value = this.value.replace(/[^0-9]/)">'
                    +'</td>';
            
            let tr = document.createElement('tr');
            tr.innerHTML += value;
            tbody.append(tr);
        }

        function start(){

            /* tbody개수 파악  */
        	let length = art_table.tBodies.length;

            let deList = [];
            let prList = [];

            let detailOp = [];
            let opPrice = [];

            let option;
            let options = [];

            for(let i = 1; i < length; i++){
                detailOp = document.getElementsByClassName('detailOp' + i);
                opPrice = document.getElementsByClassName('opPrice' + i);
                option = document.getElementById('option_'+ i);
                
                options.push(option.value);

            };

            let form = document.getElementById('form');
            document.getElementById('options').value = options;
            

            if(document.getElementById('boardTitle').value == ''){
                alert('제목을 확인해주세요');
                if(document.getElementById('titleimg').getAttribute('src') == basicImg ){
                    alert('대표 사진을 확인해주세요');
                    let required = document.getElementsByClassName('required');
                    for(var i = 0; i < required.length; i++){
                        if(required[i] == ''){
                            alert('기본사항 확인해주세요')
                            if(document.getElementById('boardContent').value == ''){
                                alert('상세설명 확인해주세요');
                                return false;
                            }
                            return false;
                        } 
                    }
                    return false;
                }
                return false;
            }


           	form.action = 'insertBoard.at';
            form.submit();
        }

        /* 상세설명 이미지 담을 수 있는 메소드 */
        function explain(inputFile){
            if(inputFile.files.length == 1){
                if(null != document.getElementById('explainImg')){
                    document.getElementById('explainImg').remove();
                }
                let explain = document.getElementById('explain'); // 상세설명 div 요소
                let explainImg = document.createElement('img');
                let reader = new FileReader();
                reader.readAsDataURL(inputFile.files[0]);
                reader.onload = function(e){
                    explainImg.setAttribute("src", e.target.result);
                    explainImg.setAttribute("width", '80%');
                    explainImg.setAttribute("id", 'explainImg');
                    explain.append(explainImg);
                }
            }
            else{
                document.getElementById('explainImg').remove();
            }
        }

        /* 이미지를 지우면 input[type=file]도 지워지는 메소드 */
        function deleteImg(event){
            if(null == document.getElementById('explainImg')){
                let explainFile = document.getElementById('explainFile');
                explainFile.value = "";
            }
        }

        function loseFocus(e){
            let boardContent = document.getElementById('boardContent');  // div 값을 담을 type:hidden의 input태그
            boardContent.innerHTML = e.innerHTML;
            let nodes = boardContent.childNodes;
            console.dir(boardContent.childNodes);
            // console.log(boardContent.childNodes[0].nodeName);
            let list = [];
            for(var i = 0; i < nodes.length; i++){
                if(nodes[i].nodeName == '#text'){
                    let data = nodes[i].data;
                    list.push({'type' : 'text'
                                ,'data' : data });
                } else if(nodes[i].nodeName == 'IMG'){
                    let data = nodes[i].src;
                    list.push({'type' : 'img'
                                ,'data' : data});
                }
            }
            console.log('enroll 337행 : ')
            console.dir(list);
            boardContent.value = JSON.stringify(list);
        }   








        /* 이미지버튼 클릭 시 파일area 클릭 */
        $(function(){
            $('#file-area').hide(); 
            
            $('#titleimg').click(function(){ 
                $('#file1').click();
            })
            $('#contentImg1').click(function(){ 
                $('#file2').click();
            })
            $('#contentImg2').click(function(){  
                $('#file3').click();
            })
            $('#contentImg3').click(function(){ 
                $('#file4').click();
            })
        })

        function loadImg(inputFile, num) {

            if(inputFile.files.length == 1){ 
            let reader = new FileReader();
            reader.readAsDataURL(inputFile.files[0]);
            reader.onload = function(e){
            switch(num) {
                            case 1 : $('#titleimg').attr('src', e.target.result); break;
                            case 2 : $('#contentImg1').attr('src', e.target.result); break;
                            case 3 : $('#contentImg2').attr('src', e.target.result); break;
                            case 4 : $('#contentImg3').attr('src', e.target.result); break;
                        }
                    }

            } else {
                switch(num) {
                        case 1 : $('#titleimg').attr('src', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpizjtvgskfw6Wuu2sLTi2_1vW1gJgFPFtMw&usqp=CAU'); break;
                        case 2 : $('#contentImg1').attr('src', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpizjtvgskfw6Wuu2sLTi2_1vW1gJgFPFtMw&usqp=CAU'); break;
                        case 3 : $('#contentImg2').attr('src','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpizjtvgskfw6Wuu2sLTi2_1vW1gJgFPFtMw&usqp=CAU'); break;
                        case 4 : $('#contentImg3').attr('src', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpizjtvgskfw6Wuu2sLTi2_1vW1gJgFPFtMw&usqp=CAU'); break;
                    }

            }
        }
</script>


    
    
</body>
</html>