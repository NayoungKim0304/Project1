<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
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
//한글을 받아오므로 한글처리
request.setCharacterEncoding("utf-8");

//request에 저장된 id, pass, name, date, email, address, phone, mobile 를 가져옴
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");
String zipno = request.getParameter("zipno");
String address = request.getParameter("address");
String phone = request.getParameter("phone");
String mobile = request.getParameter("mobile");
//date는 시스템 날짜 timestamp 내장객체를 생성함
Timestamp date = new Timestamp(System.currentTimeMillis());

//멤버변수, get set 정의하는 MemberDTO 객체 생성
MemberDTO mDTO = new MemberDTO();

//mDTO의 set 메서드 호출하여 변수 저장
mDTO.setId(id);
mDTO.setPass(pass);
mDTO.setName(name);
mDTO.setDate(date);
mDTO.setEmail(email);
mDTO.setZipno(zipno);
mDTO.setAddress(address);
mDTO.setPhone(phone);
mDTO.setMobile(mobile);


//데이터베이스와 연결, sql 구문 만들기(MemberDAO)
//insertMember 메서드 정의

//MemberDAO 객체부터 생성
MemberDAO mDAO = new MemberDAO();

//insertMember 메서드 호출
mDAO.insertMember(mDTO);

//login.jsp로 이동(로그인페이지로)
response.sendRedirect("login.jsp");



%>
</body>
</html>