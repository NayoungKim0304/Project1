<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%

request.setCharacterEncoding("utf-8");
String id=(String)session.getAttribute("id");

//세션값이 비어있으면 (null이면)
if(id==null){
	%>
	<div id="login"><a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a></div>
	<div class="clear"></div>
	<%
} else{
	%>
	<div id="id"><%=id %>님이 로그인 하셨습니다.<br>
	<a href="../member/logout.jsp">logout</a>
	<a href="../member/info.jsp">회원정보조회</a>
	<a href="../member/update.jsp">회원정보수정</a>
	
	</div>
	
	<%
}
%>



<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">HOME</a></li>
	<li><a href="../company/welcome.jsp">COMPANY</a></li>
	<li><a href="#">SOLUTIONS</a></li>
	<li><a href="../center/notice.jsp">CUSTOMER CENTER</a></li>
	<li><a href="#">CONTACT US</a></li>
</ul>
</nav>
</header>