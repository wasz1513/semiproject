<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
create table member(<br>
	ȸ���ڵ� primary key / (member_seq.nextval)<br>
	��ȭ��ȣ  not null<br>
	�г��� not null<br>
	�ּ�(��ġ����) not null<br>
	Ȱ������ default 0<br>
	�ųʿµ� default 36.5<br>
	�ǸŻ�ǰ default 0<br>
	���� �ų� �� default null<br>
	���� �ŷ� �ı� default null<br>
	)
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>	