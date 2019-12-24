<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/date.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/js/date2.js"></script>
<script>
        function loadPicker(){
            var options = {
                //날짜가 입력될 첫 번째 칸 설정
                field:document.querySelector("#start-date"),
                //날짜가 입력될 두 번째 칸 설정
                secondField:document.querySelector("#end-date"),
                //표시될 월의 개수를 설정
                numberOfMonths:2,
                //날짜 선택이 아닌 범위 선택으로 설정
                singleDate:false,
                //최초 선택일 이후로만 종료일을 선택하도록 설정
                selectForward:true,
                //날짜 구분자 설정
                seperator:'-',
                //문서 내에 표시되도록 설정
                // inline:true,
                //선택 시작일 설정(현재일로 설정하거나 'YYYY-MM-DD' 형태로 설정)
                minDate:moment(new Date()).add(1, 'days'),//내일부터 선택 가능
                // minDate:new Date(),//오늘부터 선택가능
                //날짜 형식 설정
                format:'YYYY-MM-DD',
            };
            var picker = new Lightpick(options);
        }
</script>
</head>
<body onload="loadPicker()">
	<input type="text" id="start-date">
    <input type="text" id="end-date">

</body>
</html>