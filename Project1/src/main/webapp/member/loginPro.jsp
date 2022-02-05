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
//request에 저장된 id, pass 가져와서 변수에 저장
String id = request.getParameter("id");
String pass = request.getParameter("pass");

//MemberDAO 객체 생성
MemberDAO mDAO = new MemberDAO();

//MemberDAO에 메서드 userCheck 만들기 : 리턴형은 MemberDTO, 변수는 id/pass
//userCherck 메서드 가져와서 MemberDTO 정의
MemberDTO mDTO = mDAO.userCheck(id, pass);

//mDTO != null (mDTO가 null이 아니면 = 일치하는 id,pass가 있으면) id세션값 생성
//mDTO == null (mDTO가 null이면 = 일치하는 id,pass가 없으면) "입력하신정보틀림"출력하고 뒤로 이동
if(mDTO != null){
	//세션값 생성
	session.setAttribute("id", id);
	//메인으로 이동
	response.sendRedirect("../main/main.jsp");
}else{
	%>
	<script type="text/javascript">
	alert("입력하신 정보 틀림");
	history.back();
	</script>
	
	<%
}


%>

</body>
</html>