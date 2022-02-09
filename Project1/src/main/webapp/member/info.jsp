<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
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

//세션값에 저장된 id
String id = (String)session.getAttribute("id");

//MemberDAO 객체 생성
MemberDAO mDAO = new MemberDAO();

//getMember 메서드 가져와서 mDTO에 저장
MemberDTO mDTO = mDAO.getMember(id);

if(mDTO != null){
	%>
	<table border="1">
		<tr><th>아이디</th><td><%=mDTO.getId() %></td></tr>
		<tr><th>이름</th><td><%=mDTO.getName() %></td></tr>
		<tr><th>E-mail</th><td><%=mDTO.getEmail() %></td></tr>
		<tr><th>우편번호</th><td><%=mDTO.getZipno() %></td></tr>
		<tr><th>주소</th><td><%=mDTO.getAddress()%></td></tr>
		<tr><th>전화번호</th><td><%=mDTO.getPhone() %></td></tr>
		<tr><th>휴대폰번호</th><td><%=mDTO.getMobile() %></td></tr>
	</table>

	<%
}

%>




</body>
</html>