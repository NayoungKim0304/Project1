<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
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

<%

request.setCharacterEncoding("utf-8");

//BoardDAO 객체생성
BoardDAO bDAO = new BoardDAO();

//startRow : 시작 행, pageSize : 한 페이지에 들어갈 글 개수
int startRow = 1;
int pageSize = 10;

//getBoardList() 메서드 정의
//List boardList = getBoardList() 메서드 호출
List boardList = bDAO.getBoardList(startRow, pageSize);

%>
<table border="1">
<tr><td>글번호</td><td>글쓴이</td><td>글제목</td><td>조회수</td><td>글쓴날짜</td></tr>

<%
for(int i=0; i<boardList.size(); i++){
	//모든형 Object형 저장 => BoardDTO 형변환 => 다운캐스팅
	BoardDTO bDTO = (BoardDTO)boardList.get(i);
	%>
	<tr><td><%=bDTO.getNum() %></td>
		<td><%=bDTO.getName() %></td>
		<td><a href="content.jsp?num=<%=bDTO.getNum()%>">
			<%=bDTO.getSubject() %></a></td>
		<td><%=bDTO.getReadcount() %></td>
		<td><%=bDTO.getDate() %></td></tr>
	
	<%

}
%>
</table>


<jsp:include page="../include/bottom.jsp"></jsp:include>


</body>
</html>