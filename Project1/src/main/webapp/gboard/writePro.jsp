<%@page import="board.gBoardDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

//request 한글처리
//request.setCharacterEncoding("utf-8");
//파로 업로드 cos.jar 프로그램 설치
//http://www.servlets.com
//COS File Upload Library
//cos-20.08.zip
//WEB-INF - lib - cos.jar
//MultipartRequest 객체생성
//MultipartRequest multi=
//new MultipartRequest(request,파일물리적경로,파일크기,한글처리,중복이름변경);
//upload폴더 만들고 => 물리적인 경로 알아오기
String uploadPath=request.getRealPath("/upload");
int maxSize=10*1024*1024; //10M

MultipartRequest multi=
new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

//한글처리
request.setCharacterEncoding("utf-8");


//request => multi에 저장된 요청정보 name pass subject content 가져오기
String name=multi.getParameter("name");
String pass=multi.getParameter("pass");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
String file=multi.getFilesystemName("file");

//readcount=0, date 시스템의 날짜시간
int readcount=0;
Timestamp date=new Timestamp(System.currentTimeMillis());




//BoardDAO 객체생성
gBoardDAO bDAO = new gBoardDAO();

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
bDTO.setFile(file);

//insertBoard 메서드 정의하고 호출
bDAO.insertBoard(bDTO);

//list 게시판으로 이동
response.sendRedirect("list.jsp");

%>
</body>
</html>