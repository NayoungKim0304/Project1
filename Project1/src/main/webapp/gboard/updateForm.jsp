<%@page import="board.gBoardDAO"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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

<%

//글 번호를 정수형으로 변환
int num = Integer.parseInt(request.getParameter("num"));

gBoardDAO bDAO = new gBoardDAO();

BoardDTO bDTO = bDAO.getBoard(num);


%>

<article></article>
<form action="updatePro.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="num" value="<%=bDTO.getNum() %>">
<table id="notice">
<tr><td>이름</td><td><input type="text" name="name" value="<%=bDTO.getName()%>"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject" value="<%=bDTO.getSubject()%>"></td></tr>
<tr><td>내용</td><td><textarea name="content" rows="10" cols="20"><%=bDTO.getContent()%></textarea></td></tr>
<tr><td>파일첨부</td><td><input type="file" name="file"></td></tr>
<tr><td colspan="2"><input type="submit" value="글수정"></td><td></td></tr>



</table>




</form>
</article>

<jsp:include page="../include/bottom.jsp"></jsp:include>
</body>
</html>