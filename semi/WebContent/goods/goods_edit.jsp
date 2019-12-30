<%@page import="java.util.List"%>
<%@page import="semi.bean.GoodsFilesDto"%>
<%@page import="semi.bean.GoodsFilesDao"%>
<%@page import="semi.bean.GoodsDto"%>
<%@page import="semi.bean.GoodsDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int goods_no = Integer.parseInt(request.getParameter("goods_no"));
	int goods_no2 = Integer.parseInt(request.getParameter("goods_no"));
	GoodsDao dao = new GoodsDao();
	GoodsDto dto = dao.get(goods_no);
	GoodsFilesDao fdao = new GoodsFilesDao();
	List<GoodsFilesDto> flist = fdao.getList(goods_no);
	
// 	List<GoodsFilesDto0, 1 , 2, 3, 4>

	int a[] = new int[5];
// 	a[0,1,2,3,4]
// 	a[0,0,0,0,0]
	
	if(flist.size()>0){
		for(int i=0; i<flist.size(); i++){
			a[i] = flist.get(i).getGoods_files_no();
// 			i = 0 1 2 3 4
		}
	}

	System.out.print(a[0]);
	System.out.print(a[1]);
	System.out.print(a[2]);
	System.out.print(a[3]);
	System.out.print(a[4]);
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
href="<%=request.getContextPath()%>/css/goods.css">

<link href="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/css/suneditor.min.css" rel="stylesheet">
 <style>

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
        function preview1Image(target){
            if(target.files && target.files[0]){
                var reader = new FileReader();
                reader.onload = function(data){//data는 읽은 파일의 정보
                    var img = document.querySelector("#preview1");
                    img.src = data.target.result;
                }
                reader.readAsDataURL(target.files[0]);
            }
        }
 
 function preview2Image(target){
     if(target.files && target.files[0]){
         var reader = new FileReader();
         reader.onload = function(data){//data는 읽은 파일의 정보
             var img = document.querySelector("#preview2");
             img.src = data.target.result;
         }
         reader.readAsDataURL(target.files[0]);
     }
 }
 
 function preview3Image(target){
     if(target.files && target.files[0]){
         var reader = new FileReader();
         reader.onload = function(data){//data는 읽은 파일의 정보
             var img = document.querySelector("#preview3");
             img.src = data.target.result;
         }
         reader.readAsDataURL(target.files[0]);
     }
 }
 
 function preview4Image(target){
     if(target.files && target.files[0]){
         var reader = new FileReader();
         reader.onload = function(data){//data는 읽은 파일의 정보
             var img = document.querySelector("#preview4");
             img.src = data.target.result;
         }
         reader.readAsDataURL(target.files[0]);
     }
 }
 
 function preview5Image(target){
     if(target.files && target.files[0]){
         var reader = new FileReader();
         reader.onload = function(data){//data는 읽은 파일의 정보
             var img = document.querySelector("#preview5");
             img.src = data.target.result;
         }
         reader.readAsDataURL(target.files[0]);
     }
 }
</script>
        
<style>
	.goods_contents_wrap{
		text-align: center;
		margin:auto;
	}
	
	.gallary{
		width: 680px;
   	 	margin: auto;
	}
	
	.gallary::after {
		content: "";
		display: block;
		clear: both;
	}

	.gallary>.gallary-item {
		float: left;
		width: 20%;
		padding: 10px;
	}
	
</style>
<article>


        <div class="row goods_contents_wrap">
	<h2>상품 등록 수정</h2>
	<form action="goods_edit.do" method="post" 
	enctype="multipart/form-data">
		<input type="hidden" name="goods_no" value="<%=dto.getGoods_no()%>">
		  <div>
                   <p>카테고리</p>
			   <select class="gcategory" name="goods_category" required>
						<option value="<%=dto.getGoods_category()%>"><%=dto.getGoods_category()%></option>
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
				</select>
				
				</div>
				
	 		 <br></br>
              <div>
			 <P>제목</p>
				<input class="gcategory" type="text" name="goods_title"
					value="<%=dto.getGoods_title()%>" required>
			  </div>
                    
                    <br><br>
                    <div>
				<p>가격</p>
				<input class="gcategory" type="text" name="goods_price"
					value="<%=dto.getGoods_price()%>" required>
			        </div>
			<br><br>
			<div class="gcontent">
                   <P>상품상세</P>
				<textarea  id="gcontent"  name="goods_content" required
						rows="15" cols="100" style="resize: vertical;"><%=dto.getGoods_content()%></textarea>
			 </div>
			 <div>
                            <p>상품 이미지</p>
    
                            <div class="fileimg gallary">
                            	<div class="gallary-item">
	                            	<%if(a[0]>0){%>
	                            		<img id="preview1" src="download.do?no=<%=a[0]%>" width="100" height="100">
	                            	<%}else{ %>
	                          			<img id="preview1" src="http://placehold.it/100x100" width="100" height="100">               	
	                            	<%} %>
                            	</div>
                            	<div class="gallary-item">
                            		<%if(a[1]>0){%>
	                            		<img id="preview2" src="download.do?no=<%=a[1]%>" width="100" height="100">
	                            	<%}else{ %>
	                          			<img id="preview2" src="http://placehold.it/100x100" width="100" height="100">               	
	                            	<%} %>          	
                            	</div>
                            	<div class="gallary-item">
                            		<%if(a[2]>0){%>
	                            		<img id="preview3" src="download.do?no=<%=a[2]%>" width="100" height="100">
	                            	<%}else{ %>
	                          			<img id="preview3" src="http://placehold.it/100x100" width="100" height="100">               	
	                            	<%} %>
                            	</div>
                            	<div class="gallary-item">
                            		<%if(a[3]>0){%>
	                            		<img id="preview4" src="download.do?no=<%=a[3]%>" width="100" height="100">
	                            	<%}else{ %>
	                          			<img id="preview4" src="http://placehold.it/100x100" width="100" height="100">               	
	                            	<%} %>   	
                            	</div>
                            	<div class="gallary-item">
                            		<%if(a[4]>0){%>
	                            		<img id="preview5" src="download.do?no=<%=a[4]%>" width="100" height="100">
	                            	<%}else{ %>
	                          			<img id="preview5" src="http://placehold.it/100x100" width="100" height="100">               	
	                            	<%} %> 	
                            	</div>                     	
                            </div>
                        </div>
                        
                        <div class="fileupload">
							<input type="file" name="file" accept=".jpg, .png, .gif" onchange="preview1Image(this);" required>
      						<input type="file" name="file2" accept=".jpg, .png, .gif" onchange="preview2Image(this);">
      						<input type="file" name="file3" accept=".jpg, .png, .gif" onchange="preview3Image(this);">
      						<input type="file" name="file4" accept=".jpg, .png, .gif" onchange="preview4Image(this);">
      			    		<input type="file" name="file5" accept=".jpg, .png, .gif" onchange="preview5Image(this);">
                        </div>
                    
          	<br><br>  
				<div class="goods_button" >
				<a href="goods_edit.do?goods_no=<%=dto.getGoods_no()%>"> 
				<input  class=gclick type="submit"  value="수정하기">
				</a> 
				<a href="goods_list.jsp">
				 <input class=lclick  type="button"value="목록보기">
				</a>
    </div>
				
				
<!-- 			파일이 존재하는지 보냄 -->
		<input type="hidden" name="existence0" value="<%=a[0] %>">
		<input type="hidden" name="existence1" value="<%=a[1] %>">
		<input type="hidden" name="existence2" value="<%=a[2] %>">
		<input type="hidden" name="existence3" value="<%=a[3] %>">
		<input type="hidden" name="existence4" value="<%=a[4] %>">
	</form>

</div>

</article>




<jsp:include page="/template/footer.jsp"></jsp:include>