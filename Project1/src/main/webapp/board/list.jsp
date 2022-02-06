<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
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
<li><a href="#">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="#">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->

<%

request.setCharacterEncoding("utf-8");

//BoardDAO 객체생성
BoardDAO bDAO = new BoardDAO();

// pageSize : 한 페이지에 들어갈 글 개수
int pageSize = 10;

//페이지 번호 없으면 1페이지로 설정
//http://localhost:8080/Project1/board/list.jsp

//페이지 번호 있으면 받은 페이지로 설정
//http://localhost:8080/Project1/board/list.jsp?pageNum=2

//페이지번호 가져오기
String pageNum = request.getParameter("pageNum"); //->아래에서 정의

if(pageNum==null){
	//페이지번호 없으면 1로 설정
	pageNum="1";
}

//startRow : 시작 행
//pageNum이 1이면 1~10행까지(pageSize가 10이므로)
//		   2    11~20
//=> 시작행은 1, 11, 21...
int currentPage = Integer.parseInt(pageNum);
int startRow =(currentPage-1)*pageSize+1; 

//endRow : 끝나는 행
//위와 같음
//끝나는 행은 10, 20, 30...
int endRow = startRow+pageSize-1; 

//getBoardList() 메서드 정의
//List boardList = getBoardList() 메서드 호출
List boardList = bDAO.getBoardList(startRow, pageSize);

//boardList 배열 한칸 접근 get(0) => BoardDTO 주소 => num, pass, name,...접근 출력

%>

<article>
<h1>Notice</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
<%
for(int i=0; i<boardList.size(); i++){
	//모든형 Object형 저장 => BoardDTO 형변환 => 다운캐스팅
	BoardDTO bDTO = (BoardDTO)boardList.get(i);
	%>
	<tr><td><%=bDTO.getNum() %></td>
		<td><a href="content.jsp?num=<%=bDTO.getNum()%>">
			<%=bDTO.getSubject() %></a></td>
		<td><%=bDTO.getName() %></td>
		<td><%=bDTO.getDate() %></td>
		<td><%=bDTO.getReadcount() %></td></tr>

	
	<%

}
%>
</table>

<%
//페이지 표시하기


//한 화면에 보여줄 페이지 개수를 설정
int pageBlock = 10;

//startPage : 시작하는 페이지 번호
//currentPage pageBlock => startPage
//	 1~10		 10		=> 	  1
//	 11~20		 10		=> 	  11
//	 21~30		 10		=> 	  21
int startPage = (currentPage-1)/pageBlock*pageBlock+1; // 나누기 연산자는 나눈 몫의 값만 가져옴

//끝나는 페이지번호 구하기
//startPage pageBlock 	=> endPage
//	  1			10		=>	 10
//	 11			10		=>	 20
//	21			10		=>	 30
int endPage = startPage + pageBlock-1;

//startPage=1, endPage=10, 전체페이지 수=2
//전체 글 개수(count) 구하기 => 데이터베이스에서 가져오기
//int형 getBoardCount() 메서드 정의
//select count(*) from board
int count = bDAO.getBoardCount();

//전체 페이지수(pageCount) 구하기
//게시판글 50개, 한 화면에 보여줄 글 개수 10개 => 전체페이지수=5
// 50/10 = 5 + 나머지가 없으면 0페이지 추가
// 57/10 = 5 + 나머지글은 1페이지추가 
int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
if(endPage > pageCount){
	endPage = pageCount;
} 

//이전
if(startPage > pageBlock){
	%> <a href="list.jsp?pageNum=<%=startPage-pageBlock %>">[이전]</a> <%
}

//1~10
for(int i=startPage; i<=endPage; i++){
	%> <a href="list.jsp?pageNum=<%= i%>"><%=i %></a><%
}

//다음
if(endPage < pageCount){
	%><a href="list.jsp?pageNum=<%=startPage+pageBlock %>">[다음]</a><%
}
%>






<div id="table_search">
<input type="button" value="글쓰기" onclick="location.href='writeForm.jsp'" class="btn" style="float: right;"><br><br>
<input type="text" name="search" class="input_box">
<input type="button" value="search" class="btn">
</div>
<div class="clear"></div>
<div id="page_control">




</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../include/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>