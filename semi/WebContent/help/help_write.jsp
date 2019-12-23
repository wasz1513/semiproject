<%@page import="semi.bean.CustomerDto"%>
<%@page import="semi.bean.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
			
<jsp:include page="/template/header.jsp"></jsp:include>


<div align="center">



<style>
.row.row-multi::after {
	content: "";
	display: block;
	clear: both;
}

.row.row-multi>* {
	float: left;
}

.row.row-multi.col-2>* {
	width: 50%
}

.row.row-multi.col-3>* {
	width: 33.3333%
}

.row.row-multi.col-4>* {
	width: 25%
}

.row.row-multi.col-5>* {
	width: 20%
}


    <style>
        #toggle {

            display: block;

            width: 10px;

            height: 30px;

            margin: 30px auto 10px;

        }



        #toggle span:after,

        #toggle span:before {

            content: "";

            position: absolute;

            left: 0;

            top: -9px;

        }

        #toggle span:after {

            top: 9px;

        }

        #toggle span {

            position: relative;

            display: block;

        }



        #toggle span,

        #toggle span:after,

        #toggle span:before {

            width: 20px;

            height: 5px;

            background-color: #888;

            transition: all 0.3s;

            backface-visibility: hidden;

            border-radius: 2px;

        }



        /* on activation */

        #toggle.on span {

            background-color: transparent;

        }

        #toggle.on span:before {

            transform: rotate(45deg) translate(5px, 5px);

        }

        #toggle.on span:after {

            transform: rotate(-45deg) translate(7px, -8px);

        }

        #toggle.on+#menu {

            opacity: 1;

            visibility: visible;

        }



        /* menu appearance*/

        #menu {

            position: relative;

            color: #999;

            width: 200px;

            padding: 10px;

            margin: auto;

            font-family: "Segoe UI", Candara, "Bitstream Vera Sans", "DejaVu Sans", "Bitstream Vera Sans", "Trebuchet MS", Verdana, "Verdana Ref", sans-serif;

            text-align: center;

            border-radius: 4px;

            background: white;

            box-shadow: 0 1px 8px rgba(0, 0, 0, 0.05);

            /* just for this demo */

            opacity: 0;

            visibility: hidden;

            transition: opacity .4s;

        }

        #menu:after {

            position: absolute;

            top: -15px;

            left: 95px;

            content: "";

            display: block;

            border-left: 15px solid transparent;

            border-right: 15px solid transparent;

            border-bottom: 20px solid white;

        }

        ul,
        li,
        li a {

            list-style: none;

            display: block;

            margin: 0;

            padding: 0;

        }

        li a {

            padding: 5px;

            color: #888;

            text-decoration: none;

            transition: all .2s;

        }

        li a:hover,

        li a:focus {

            background: #1ABC9C;

            color: #fff;

        }





        /* demo styles */

        body {
            margin-top: 3em;
            background: #eee;
            color: #555;
            font-family: "Open Sans", "Segoe UI", Helvetica, Arial, sans-serif;
        }

        p,
        p a {
            font-size: 12px;
            text-align: center;
            color: #888;
        }
    </style>





    <script>
        function pageLoad() {

            var theToggle = document.getElementById('toggle');



            // based on Todd Motto functions

            // https://toddmotto.com/labs/reusable-js/



            // hasClass

            function hasClass(elem, className) {

                return new RegExp(' ' + className + ' ').test(' ' + elem.className + ' ');

            }

            // addClass

            function addClass(elem, className) {

                if (!hasClass(elem, className)) {

                    elem.className += ' ' + className;

                }

            }

            // removeClass

            function removeClass(elem, className) {

                var newClass = ' ' + elem.className.replace(/[\t\r\n]/g, ' ') + ' ';

                if (hasClass(elem, className)) {

                    while (newClass.indexOf(' ' + className + ' ') >= 0) {

                        newClass = newClass.replace(' ' + className + ' ', ' ');

                    }

                    elem.className = newClass.replace(/^\s+|\s+$/g, '');

                }

            }

            // toggleClass

            function toggleClass(elem, className) {

                var newClass = ' ' + elem.className.replace(/[\t\r\n]/g, " ") + ' ';

                if (hasClass(elem, className)) {

                    while (newClass.indexOf(" " + className + " ") >= 0) {

                        newClass = newClass.replace(" " + className + " ", " ");

                    }

                    elem.className = newClass.replace(/^\s+|\s+$/g, '');

                } else {

                    elem.className += ' ' + className;

                }

            }



            theToggle.onclick = function() {

                toggleClass(this, 'on');

                return false;

            }

        }
    </script>






<form action="write.do" method="post">
<input type="hidden" id="customer_id" value="customrt_jd">
		<title>신고/문의하기</title>
		<div align="center" >
		<div class="row row-multi col-2" >
			<a href="help_write.jsp">
				<input type="button" style="WIDTH: 300pt; HEIGHT: 44pt" value="1:1상담하기">
				</a> 
			<a href="help_list.jsp">
				<input type="button" style="WIDTH: 300pt; HEIGHT: 44pt" value="문의/신고내역">
				</a> 
			</div>
		   <h2>문의/신고 하기</h2>
		   <h5>※ 신고/문의내용에 욕설, 성희롱 등의 내용이 포함된 경우 상담이 제한될 수 있습니다.</h5>
			
			<br>
		
			<div class="row row-multi col-2">
				<div>문의/신고</div>
				<div>
					<select name="head">
						<option class="row-multi col5" value="">선택하세요</option>
						<option>거래신고</option>
						<option>서비스장애</option>
					</select>
				</div>
			</div>
		
			<div>
			
				<textarea name="content" required rows="20" cols="100"
					style="resize: vertical;"></textarea>
			</div>



			<div class="row row-multi col-2">
			<div align="left">
				 
				<input  type="button" value="사진 첨부하기">
				  <label for="hamburg">&equiv;</label>
				
				<a href="#menu" id="toggle"><input onclick="pageLoad()" type="checkbox" id="hamburg"></a>



    <div id="menu">

        <ul>

            	<input type="file" name="file" accept=".jpg, .png, .gif">
				<input type="file" name="file2" accept=".jpg, .png, .gif">
				<input type="file" name="file3" accept=".jpg, .png, .gif">
				<input type="file" name="file4" accept=".jpg, .png, .gif">
				<input type="file" name="file5" accept=".jpg, .png, .gif">
        </ul>



  			  </div>	
				<img src="http://placehold.it/100x70?text=이미지">
			</div>
			
			
			<div align="right">
				<input type="submit" value="1:1상담하기">
				 <a href="help_list.jsp"> </a> 
			</div>
			</div>



				</form>
		</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
