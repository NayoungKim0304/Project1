<%@page import="board.nBoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">

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
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="../images/main_img1.jpg"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->

<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">News</span></h3>
<table>

<%

//최근글 다섯개 출력
int pageSize=5;
int startRow=1;

//BoardDAO 객체생성
nBoardDAO bDAO = new nBoardDAO();

//List<BoardDTO> boardList = getBoardList(startRow, pageSize) 메서드 호출
List<BoardDTO> boardList = bDAO.getBoardList(startRow, pageSize);

//날짜->String문자열 모양으로 변경
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
for(int i=0; i<boardList.size(); i++){
	BoardDTO bDTO = boardList.get(i);
	%>
	
	<tr><td class="contxt"><a href="../nboard/content.jsp?num=<%=bDTO.getNum() %>"><%=bDTO.getSubject() %></a></td>
    <td><%=dateFormat.format(bDTO.getDate()) %></td></tr>
    
	<%
}

%>

</table>

</div>



<div id="news_notice">
<h3 class="brown">Freeboard</h3>
<table>

<%


//BoardDAO 객체생성
BoardDAO bDAO1 = new BoardDAO();

//List<BoardDTO> boardList = getBoardList(startRow, pageSize) 메서드 호출
List<BoardDTO> boardList1 = bDAO1.getBoardList(startRow, pageSize);

//날짜->String문자열 모양으로 변경
SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy.MM.dd");
for(int i=0; i<boardList1.size(); i++){
	BoardDTO bDTO = boardList1.get(i);
	%>
	
	<tr><td class="contxt"><a href="../board/content.jsp?num=<%=bDTO.getNum() %>"><%=bDTO.getSubject() %></a></td>
    <td><%=dateFormat1.format(bDTO.getDate()) %></td></tr>
    
	<%
}

%>

</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../include/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>