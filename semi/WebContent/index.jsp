<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/test.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rayout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/list.css">
<title>Semi</title>
<style>
	
/* 	header �κ� �������� */
	.row-multi.col-4>.a{
		width:20%;
		text-align:center;
	}	
	
	.row-multi.col-4>.b{
		width:60%;
		margin-top:13px;
		text-align:center;
	}
	
	.row-multi.col-4>.c{
		width:10%;
		margin-top:14px;
		text-align:center;
	}
	
	.row-multi.col-4>.d{
		width:10%;
		margin-top:14px;
		text-align:center;
	}
	
	.row-multi.col-2>.a{
		width:20%;
	}
	
	.banner{
		position:absolute;
	}
	
</style>
</head>
<body test>
<!-- 	���������� -->
	<main>
		
<!-- 		��� -->
<!-- 			�ΰ� / �˻�â / �α��� / ���ɸ�� -->
		<header>
			
			<div class="row-multi col-4">
<!-- 				�ΰ� -->
				<div class="a">
					<img src="http://placehold.it/180x50">
				</div>
<!-- 				�˻�â -->
				<div class="b">
					<form action="#" method="get">
						<input type="text" name="key" size="80%">
						<input type="submit" value="�˻�">
					</form>
				</div>
<!-- 					�α��� / ���������� -->
				<div class="c">
<%-- 					<%if(����id==null){ %> --%>
					<a href="#">�α���</a>
<%-- 					<%}else{ %> --%>
					<a href="#">����������</a>
<%-- 					<%} %> --%>
				</div>
<!-- 				���ɸ�� -->
				<div class="d">
					���ɸ�� 
				</div>
			</div>
		
			<div class="row-multi col-2">
				<div class="a">
					<div class="menu-wrap">
						<label for="custom-menu">ī�װ�</label>
      				  	<input type="checkbox" id="custom-menu">
      				  	<ul class="custom-list">
      				  		<li>�м��Ƿ�</li>
			             	<li>�м���ȭ</li>
			                <li>ȭ��ǰ/�̿�</li>
			                <li>������/����</li>
			                <li>����/���׸���</li>
			                <li>���/����</li>
			                <li>��ǰ</li>
			                <li>������/����</li>
			                <li>��Ȱ/�ǰ�</li>
			                <li>����/��ȭ</li>
      				  	</ul>
					</div>
				</div>
				<div class="b">
					�α�˻��� �˻���1 �˻��� 2 �˻���3
				</div>
			</div>
			
		</header>
		
<!-- 		�޴�(�׺�) -->
<!-- 			ī�װ� / �α�˻��� -->
		<nev>
			<div class="row benner">
				<div>
					<img src="http://placehold.it/932x300">
				</div>
			</div>
		</nev>
		
<!-- 		���� -->
<!-- 			�α�Խñ� / Ű���� �Խñ� / ������ġ -->
		<section>
		
			<div class="row">
				<h2>�α�Խñ�</h2>
			</div>
			<div class="row-multi col-4">
				<div>
					<img src="http://placehold.it/200x200">
				</div>
				<div>
					<img src="http://placehold.it/200x200">
				</div>
				<div>
					<img src="http://placehold.it/200x200">
				</div>
				<div>
					<img src="http://placehold.it/200x200">
				</div>
			</div>
			
			<div class="row">
				<h2>Ű���� �Խñ�</h2>
			</div>
			<div class="row-multi col-4">
				<div>
					<img src="http://placehold.it/200x200">
				</div>
				<div>
					<img src="http://placehold.it/200x200">
				</div>
				<div>
					<img src="http://placehold.it/200x200">
				</div>
				<div>
					<img src="http://placehold.it/200x200">
				</div>
			</div>
			
			<div class="row">
				<h2>������ġ �Խñ�</h2>
			</div>
			<div class="row-multi col-4">
				<div>
					<img src="http://placehold.it/200x200">
				</div>
				<div>
					<img src="http://placehold.it/200x200">
				</div>
				<div>
					<img src="http://placehold.it/200x200">
				</div>
				<div>
					<img src="http://placehold.it/200x200">
				</div>
			</div>
			
		</section>
		
<!-- 		Ǫ�� -->
		<footer>
			<div class="row-left">
				<div>
					��ٳ���
				</div>
				<div>
					kh2 b class
				</div>
				<div>
					team 3
				</div>
			</div>
		</footer>
		
	</main>

</body>
</html>