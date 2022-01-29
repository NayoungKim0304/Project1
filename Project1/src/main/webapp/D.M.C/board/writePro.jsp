<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
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

//한글처리
request.setCharacterEncoding("utf-8");

//request에 저장된 요청정보 name pass subject content 가져오기
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String subject =  request.getParameter("subject");
String content = request.getParameter("content");

//readcount=0, date 시스템의 날짜시간
int readcount=0;
Timestamp date=new Timestamp(System.currentTimeMillis());

//BoardDAO 객체생성
BoardDAO bDAO = new BoardDAO();

//BoardDTO 객체생성
BoardDTO bDTO = new BoardDTO();

//리턴할 형 int getMaxNum() 메서드 정의

// set메서드 호출 파라미터값 저장
// setNum(getMaxNum()호출 + 1) 
bDTO.setNum(bDAO.getMaxnum()+1);
bDTO.setPass(pass);
bDTO.setName(name);
bDTO.setSubject(subject);
bDTO.setContent(content);
bDTO.setReadcount(readcount);
bDTO.setDate(date);
System.out.println("번호 : " + bDTO.getNum());

//insertBoard 메서드 정의하고 호출
bDAO.insertBoard(bDTO);

//list 게시판으로 이동
response.sendRedirect("list.jsp");

%>
</body>
</html>