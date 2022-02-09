<%@page import="board.gBoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

int num=Integer.parseInt(request.getParameter("num"));
String pass = request.getParameter("pass");

gBoardDAO bDAO = new gBoardDAO();

BoardDTO bDTO = bDAO.numCheck(num, pass);


if(bDTO != null){
	
	bDAO.deleteBoard(num);
	
	response.sendRedirect("list.jsp");
} else {
	%>
	<script type="text/javascript">
	alert("비밀번호가 틀렸습니다");
	history.back();	
	</script>
<%
}


%>
</body>
</html>