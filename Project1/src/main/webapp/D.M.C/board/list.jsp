<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.List"%>
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

//BoardDAO 객체생성
BoardDAO bDAO = new BoardDAO();

//startRow : 시작페이지, pageSize : 한 페이지에 들어갈 글 개수
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

</body>
</html>