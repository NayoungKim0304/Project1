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

//한글처리
request.setCharacterEncoding("utf-8");

//updatePro form에서 입력된 request 변수값 가져오기
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");
String address = request.getParameter("address");
String phone = request.getParameter("phone");
String mobile = request.getParameter("mobile");

//MemberDAO 객체 생성
MemberDAO mDAO = new MemberDAO();

//id, pass 확인해야 하므로 userCheck 메서드 가져와서 mDTO에 담기
MemberDTO mDTO = mDAO.userCheck(id, pass);

if(mDTO != null){
	// mDTO의 값이 null이 아님 -> id, pass가 일치할 경우
	//수정할 정보를 저장하는 updateDTO 객체 생성
	MemberDTO updateDTO = new MemberDTO();
	
	//수정정보를 저장하는 set 메서드 호출
	updateDTO.setId(id);
	updateDTO.setPass(pass);
	updateDTO.setName(name);
	updateDTO.setAddress(address);
	updateDTO.setEmail(email);
	updateDTO.setPhone(phone);
	updateDTO.setMobile(mobile);
	
	//수정정보를 업데이트하는 updateMember(MemberDTO updateDTO) 메서드 정의하고 호출
	mDAO.updateMember(updateDTO);
	
	//메인으로 이동
	response.sendRedirect("../main/main.jsp");
	
} else {
	// mDTO의 값이 null일 경우-> id,pass가 불일치
	%>
	
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다");
		history.back();
	</script>
	<%
}

%>

</body>
</html>