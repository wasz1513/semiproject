<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
article {
	margin: auto;
}
</style>

<%
	String customer_id = (String)request.getSession().getAttribute("customer_id");


%>

<jsp:include page="/template/header.jsp"></jsp:include>

<link href="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/css/suneditor.min.css" rel="stylesheet">
 <style>

        .sun-editor{
        	margin-left:190px;
        	width:60% !important;
        }
        img.img{
        	margin-right:1px;
        }
</style>
<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/suneditor.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/suneditor@latest/src/lang/ko.js"></script>
     <script>
        function loadEditor(){
            var editor = SUNEDITOR.create((document.querySelector('#gcontent')),{
                //언어 설정
                lang: SUNEDITOR_LANG['ko'],
                
                //버튼 목록
                buttonList:[
                    ['font', 'fontSize', 'fontColor'], 
                    ['underline', 'italic', 'paragraphStyle', 'formatBlock'],
                    ['align', 'table', 'image']
                ],
                //글꼴 설정
                font:[
                    '굴림', '궁서', 'Verdana', 'Arial'
                ],
                //크기 설정
                fontSize:[
                    10, 16, 32
                ],
            });
            
            editor.onKeyUp = function(e){
    	    	var content = document.querySelector("textarea[name=goods_content]");
    	    	content.value = editor.getContents();
    	    }
        }
        window.onload = loadEditor;
        </script>
<article class="contents_wrap">


	<div class="row">
		<h2>상품 등록</h2>
		<form action="goods_write.do" method="post"
			enctype="multipart/form-data">
			<input type=hidden name="customer_id" value=<%=customer_id %>>
			<table border="1" width="70%">
				<tr>
					<th>카테고리</th>
					<td><select name="goods_category" required>
							<option value="">-필수선택-카테고리</option>
							<option>패션의류</option>
							<option>패션잡화</option>
							<option value="미용">화장품/미용</option>
							<option value="가전">디지털/가전</option>
							<option value="가구">가구/인테리어</option>
							<option value="육아">출산/육아</option>
							<option>식품</option>
							<option value="스포츠">스포츠/레저</option>
							<option value="생활">생활/건강</option>
							<option value="여행">여행/문화</option>
					</select></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="goods_title" required></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="goods_price"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="goods_content" required
							rows="15" cols="100" style="resize: vertical;"></textarea></td>
              <br></br>
              <div>
                        <P>제목</p>
                        <input type="text" name="goods_title" required>
            </div>
                    
                    <br><br>
                    <div>
                        <p>가격</p>
                        <input type="text" name="goods_price">
                       </div>
                    <br><br>
                    <div class="gcontent">
                   <P>상품상세</P>
                   <textarea id="gcontent" name="goods_content"></textarea>
                </div>
                        <div>
                            <p>상품 이미지</p>
    
                            <div align="left" style="padding-left:190px;">
                            	<img class="img" src="http://placehold.it/100x70?text=이미지">
	                        	<img class="img" src="http://placehold.it/100x70?text=이미지">
	                         	<img class="img" src="http://placehold.it/100x70?text=이미지">
	                         	<img class="img" src="http://placehold.it/100x70?text=이미지">
	                         	<img class="img" src="http://placehold.it/100x70?text=이미지">
                            </div>
                        </div>
                        
                        <div>
                            <input type="file" name="file" accept=".jpg, .png, .gif">
                            <input type="file" name="file2" accept=".jpg, .png, .gif">
                            <input type="file" name="file3" accept=".jpg, .png, .gif">
                            <input type="file" name="file4" accept=".jpg, .png, .gif">
                            <input type="file" name="file5" accept=".jpg, .png, .gif">
                        </div>
                    
          
          <br><br>  
    <div class="button"style="padding-right:300px;">
            <a href="goods_content.jsp">
                <input class=gclick type="submit" value="상품 등록하기"> 
            </a>
            <a href="goods_list.jsp">
             <input class=lclick  type="button" value="목록보기">
             </a>
    </div>

    
    
</form>

</div>

</article>




<jsp:include page="/template/footer.jsp"></jsp:include>