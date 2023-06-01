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
    <title>êµ¿ì¦ìíìë ¥íì´ì§</title>
    <style>
        .all_area{
            width: 900px;   
            margin: auto;
        }

        table{
            width:750px;
            table-layout: fixed; 
        }
        table th{
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
    </style>
</head>
<body>
    <div class="all_area">

        <div>
            <h2 class="title">êµ¿ì¦ ìí ë±ë¡</h2>
            <hr class="line">
        </div>
        
        <br>


        <!-- <form> -->
        <table id="art_table" align="center">
            <tr>
                <th>
                    <h5 class="sub_title">ì¹´íê³ ë¦¬</h5>
                </th>
                <td>
                    <select name="" id="">
                        <option value="">ìºë¦­í° ì¼ë¬ì¤í¸</option>
                        <option value="">ì¼ë¬ì¤í¸</option>
                        <option value="">ë²ì¸ì¼</option>
                        <option value="">ëìì¸</option>
                        <option value="">ì¹í°</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th><h5 class="sub_title">ìíëª</h5></th>
                <td colspan="3"><input type="text" style="width: 85%;"></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">ìíê°ê²©</h5></th>
                <td><input type="number" style="width: 70%;">ì </td>
            </tr>
            <tr>
                <th><h5 class="sub_title">ìí ëí ì´ë¯¸ì§</h5></th>
                <td align="center" colspan="3">
                    <img id="titleimg" src="https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg" alt="">
                </td>
            </tr>
            <tr>
                <th>
                    <h5 class="sub_title">ìì¸ì´ë¯¸ì§</h5>
                </th>
                <td><img id="contentImg1" class="contentImg" src="https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg" alt=""></td>
                <td><img id="contentImg2" class="contentImg" src="https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg" alt=""></td>
                <td><img id="contentImg3" class="contentImg" src="https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg" alt=""></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">ìíì¤ëª</h5></th>
                <td colspan="3">
                    <textarea name="" id="" style="width: 100%; height:400px; resize:none;" maxlength="1000"></textarea>
                </td>
            </tr>
            
            <tr>
                <th><h5 class="sub_title">íì¼ì í</h5></th>
                <td><input type="text"></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">í´ìë</h5> </th>
                <td><input type="text"></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">ê¸°ë³¸ì¬ì´ì¦</h5></th>
                <td><input type="text"></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">ê¸°ë³¸ìì íì</h5></th>
                <td><input type="text"></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">ììê¸°ê°</h5></th>
                <td><input type="text"></td>
            </tr>
            <tr>
                <th colspan="4"><hr class="line"></th>
            </tr>
        <!-- </table>

        <table align="center"> -->
            <!-- ìµì -->
            <tr>
                <th colspan="4">
                    <h5 class="sub_title">ìµì
                    &nbsp;&nbsp;<button onclick="op_plus();">+</butto></h5>
                </th>
            </tr>

            <!-- ì¶ê°ë  ë´ì© -->
            <tr>
                <th><h5 class="sub_title">ì ëª©</h5></th>
                <td>
                    <input type="text" id="option_1">
                </td>
                <th class="price">
                    <h5 class="sub_title">ê°ê²©</h5>
                </th>
                <td>
                    <input type="text" id="price_1">
                </td>
            </tr>
            <!-- / ì¶ê°ë  ë´ì© -->

            <!-- ë ìµì -->
        </table>

        <br><br>

        <table align="center">
            <tr>
                <th colspan="5">
                    <hr class="line">
                </th>
            </tr>

            <!-- ìµì -->
            <tr>
                <th colspan="5">
                    <h5 class="sub_title">êµ¿ì¦ ìµì</h5>
                </th>
            </tr>
            <tr>
                <th><h5 class="sub_title">í¨ì</h5></th>
                <td colspan="3"><input type="text" style="width:100%;"></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">ë¬¸êµ¬</h5></th>
                <td colspan="3"><input type="text" style="width:100%;"></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">ì£¼ë°©</h5></th>
                <td colspan="3"><input type="text" style="width:100%;"></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">ì¸íë¦¬ì´</h5></th>
                <td colspan="3"><input type="text" style="width:100%;"></td>
            </tr>
            <tr>
                <th><h5 class="sub_title">ì£¼ë°©</h5></th>
                <td colspan="3"><input type="text" style="width:100%;"></td>
            </tr>
            <!-- ë ìµì -->
            <tr>
                <td colspan="5"><hr class="line"></td>
            </tr>
            <tr>
                <td colspan="5" align="center"><div class="btn btn-info" style="width: 50%; height: 40px; 
                background-color:  rgb(255, 131, 153); color: black; border: none;">êµ¿ì¦ íë§¤ ìì²­íê¸°</div></td>
            </tr>
        </table>
    <!-- </form> -->

    </div>
         

    <div id="file-area">
        <input type="file" id="file1" name="file1" required onchange="loadImg(this, 1);">
        <input type="file" id="file2" name="file2" onchange="loadImg(this, 2);">
        <input type="file" id="file3" name="file3" onchange="loadImg(this, 3);">
        <input type="file" id="file4" name="file4" onchange="loadImg(this, 4);">
    </div>

    <br><br><br><br>












    <script>

        /* ìµì+ë²í¼ ì¤í¬ë¦½í¸ */
        var i = 2;
        function op_plus(){
            var art_table = document.getElementById('art_table');

            
            let value = '';
            value = '<tr>'
                        +'<th><h5 class="sub_title">ì ëª©</h5></th>'
                        +'<td>'
                            +'<input type="text" id="option_' + i + '">'
                        +'</td>'
                        +'<th><h5 class="sub_title">ê°ê²©</h5></th>'
                        +'<td>'
                            +'<input type="text" id="price_' + i + '">'
                        +'</td>'
                    +'</tr>';
            i++;

            var result = art_table.innerHTML += document.createElement('tr').innerHTML = value;
        }
        /* ë - ìµì+ë²í¼ ì¤í¬ë¦½í¸ */


        /* ì´ë¯¸ì§ë²í¼ í´ë¦­ ì íì¼area í´ë¦­ */
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