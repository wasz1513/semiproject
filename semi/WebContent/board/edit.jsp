<%@page import="semi.bean.BoardDto"%>
<%@page import="semi.bean.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int no =Integer.parseInt(request.getParameter("no"));
BoardDao dao = new BoardDao();
BoardDto dto = dao.get(no);
%>

<jsp:include page="/template/header.jsp"></jsp:include>


<div align="center" class=board_edit_wrap">
	<h2 style="font-size:20px;">게시글 수정</h2>
	<br>
	
	<form action="edit.do" method="post">
              
                       	
        <input type="hidden" name="no" value="<%=no%>">
        
		<table border="1" width="30%" class="board_edit">
            <caption>
				
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" value="<%=dto.getTitle()%>" style="width:400px;" required>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<textarea name="content" required rows="15"
					cols="100" style="resize:vertical"><%=dto.getContent()%></textarea>'
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit"value="등록" style="height:30px; width:50px">
					 <a href="list.jsp"> </a> 
			</caption>
		</table>
        </form>
        </form>
        </div>
        </div>
        </table>
        
      
     

<jsp:include page="/template/footer.jsp"></jsp:include>