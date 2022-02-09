<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>

<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<%
request.setCharacterEncoding("utf-8");
String id=(String)session.getAttribute("id");
//세션값이 비어있으면 (null이면)
if(id==null){
	%>
	<div id="login"><a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a></div>
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


<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><a href="../main/main.jsp"><img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></a></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">HOME</a></li>
	<li><a href="../company/welcome.jsp">COMPANY</a></li>
	<li><a href="../nboard/list.jsp">Community</a></li>
</ul>
</nav>
</header>