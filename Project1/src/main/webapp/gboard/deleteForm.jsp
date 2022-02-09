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

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../nboard/list.jsp">News</a></li>
<li><a href="../gboard/list.jsp">Gallary</a></li>
<li><a href="../board/list.jsp">자유게시판</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->

<%

int num=Integer.parseInt(request.getParameter("num"));

gBoardDAO bDAO = new gBoardDAO();

BoardDTO bDTO = bDAO.getBoard(num);

if(bDTO != null){
	%>
	<article>
	<form action="deletePro.jsp" method="post">
	<input type="hidden" name="num" value="<%=num%>">
		<table id="notice">
		<tr><td>비밀번호</td><td><input type="password" name="pass" style="float: left;"></td></tr>
		<tr><td colspan="2"><input type="submit" value="글삭제"></td></tr>
		</table>
		</form>
	</form>
	</article>
	<%
	
}
%>

<div class="clear"></div>

<jsp:include page="../include/bottom.jsp"></jsp:include>
</body>
</html>