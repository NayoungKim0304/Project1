<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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

//http://localhost:8080/JspStudy/jsp5/220111/content.jsp?num=1
//http://localhost:8080/JspStudy/jsp5/220111/content.jsp?num=2
//서버 request에 저장

int num = Integer.parseInt(request.getParameter("num"));

//BoardDAO 객체 생성
BoardDAO bDAO = new BoardDAO();

//조회수 1 증가 - update board set readcount = readcount+1 where num=?
//리턴할 값 없음 updateReadcount(int num) 메서드 정의
bDAO.updateReadcount(num);

//BoardDTO 리턴할형 getBoard(int num) 메서드 정의
//BoardDTO  bDTO = getBoard(num) 메서드 호출
BoardDTO bDTO = bDAO.getBoard(num);


//5단계 다음행으로 이동 -> 열접근 -> 출력

	%>
<article>
<h1>Freeboard Content</h1>
<table id="notice">
<tr><td>글번호</td><td><%=bDTO.getNum() %></td>
	<td>글쓴날짜</td><td><%=bDTO.getDate() %></td></tr>
<tr><td>글쓴이</td><td><%=bDTO.getName() %></td>
	<td>조회수</td><td><%=bDTO.getReadcount() %></td></tr>
<tr><td>글제목</td><td class="left"><%=bDTO.getSubject() %></td></tr>
<tr><td>글내용</td><td class="left"><%=bDTO.getContent() %></td></tr>

<%

if(bDTO.getFile() != null){
	%>
	<tr><td>첨부파일</td><td class="left"><a href="../upload/<%= bDTO.getFile()%>" download><%=bDTO.getFile() %></a>
				  <img src="../upload/<%= bDTO.getFile()%>" width="100" height="100"></td></tr>
<%
	}
%>

</table>
<div id="table_search">

<%
//세션값 가져오기
String id = (String)session.getAttribute("id");

//세션값이 있으면(세션값과 글쓴이가 일치하면)
if(id != null){
	if(id.equals(bDTO.getName())){
		%>
		<input type="button" value="글수정" class="btn" onclick="location.href='updateForm.jsp?num=<%=bDTO.getNum() %>'">
		<input type="button" value="글삭제" class="btn" onclick="location.href='deleteForm.jsp?num=<%=bDTO.getNum() %>'">
		<%
		
	}
}

%>

<input type="button" value="글목록" class="btn" onclick="location.href='list.jsp'">
</div>

	
<div id="table_search">
</div>

<div class="clear"></div>
<div id="page_control">



</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>

<jsp:include page="../include/bottom.jsp"></jsp:include>

</body>
</html>