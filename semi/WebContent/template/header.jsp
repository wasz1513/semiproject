<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/test.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rayout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/indexlist.css">
<title>Semi</title>
<style>
	
/* 	header �κ� �������� */
	.row-multi.col-4>.a{
		width:20%;
		
	}	
	
	.row-multi.col-4>.b{
		width:60%;
		margin-top:13px;
		
	}
	
	.row-multi.col-4>.c{
		width:10%;
		margin-top:14px;
		
	}
	
	.row-multi.col-4>.d{
		width:10%;
		margin-top:14px;
		
	}
	
	.row-multi.col-2>.a{
		width:20%;
	}
	
	.row-multi.col-4>*{
		text-align:center;
	}
	
	.row-multi.col-2>*{
		text-align:center;
	}
	
	main{
		width: 100%;
		margin: auto;
	}
	
	header, section, footer {
		width: 1200px;
		margin: auto;
		padding: 2rem;
	}
	
	.row-multi.col-4 > .more{
		margin-top: 120px;
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
<!-- 						<a>�α���</a> -->
					<div class="menu-wrap1">
						<label for="custom-menu1">�α���</label>
      				  	<input type="checkbox" id="custom-menu1">
      				  	<ul class="custom-list">
      				  		<li>�α���</li>
			             	<li>ȸ������</li>
			                <li>���̵�/��й�ȣã��</li>		
      				  	</ul>
					</div>
<%-- 					<%}else{ %> --%>
<!-- 						<a>����������</a> -->
<!-- 					<div class="menu-wrap2"> -->
<!-- 						<label for="custom-menu2">����������</label> -->
<!--       				  	<input type="checkbox" id="custom-menu2"> -->
<!--       				  	<ul class="custom-list"> -->
<!--       				  		<li>�����ʺ���</li> -->
<!-- 			             	<li>Ű�����Է�</li> -->
<!-- 			                <li>��ġ����</li> -->
<!--       				  	</ul> -->
<!-- 					</div> -->
<%-- 					<%} %> --%>
				</div>
<!-- 				���ɸ�� -->
				<div class="d">
					<div class="menu-wrap3">
						<label for="custom-menu3">���ɸ��</label>
      				  	<input type="checkbox" id="custom-menu3">
      				  	<ul class="custom-list">
      				  		<li>Ű����</li>
			             	<li>���ǰ</li>
			                <li>????</li>		
      				  	</ul>
					</div>
				</div>
			</div>
		
			
<!-- 			ī�װ� / �α�˻��� -->
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
		<nav>
			<div class="row benner">
				<div>
					<img src="http://placehold.it/1600x300">
				</div>
			</div>
		</nav>
		
<!-- 		���� -->
<!-- 			�α�Խñ� / Ű���� �Խñ� / ������ġ -->
		<section>
				
		
		