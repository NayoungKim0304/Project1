<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->


<%

int num=Integer.parseInt(request.getParameter("num"));

BoardDAO bDAO = new BoardDAO();

BoardDTO bDTO = bDAO.getBoard(num);

if(bDTO != null){
	%>
	<form action="deletePro.jsp" method="post">
	<input type="hidden" name="num" value="<%=num%>">
		<table border="1">
		<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
		<tr><td colspan="2"><input type="submit" value="글삭제"></td></tr>
		</table>
		</form>
	</form>
	<%
	
}
%>



<jsp:include page="../include/bottom.jsp"></jsp:include>
</body>
</html>