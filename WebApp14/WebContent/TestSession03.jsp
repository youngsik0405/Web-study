<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(→ TestSession02.jsp)로부터 넘어온 데이터 수신
	// → userId, userPwd
	//    + userName, userTel
	
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");

	//String userName = request.getParameter("userName");
	//String userTel = request.getParameter("userTel");
	
	// ↓ 수정
	
	String userName = (String)session.getAttribute("userName");
	String userTel = (String)session.getAttribute("userTel");
	
	// ResultSet은 값을 꺼냈다해서 바로 close()해버리면 안 되지만,
	// session은 이미 꺼내서 값을 담았다면 session에서는 그 값을 지워버려도 됨
	session.removeAttribute("userName");
	session.removeAttribute("userTel");
	
	
	
	/* 
	String name = (String)session.getAttribute("name");
	String tel = (String)session.getAttribute("tel");
	 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
/* 	* {background-color: #d2f7ff}
	span {font-weight: bold; color:red;} */
</style>
</head>
<body>

<div>
	<h1>TestSession03.jsp</h1>
	<p>이름, 전화번호, 아이디, 패스워드 확인</p>
	<hr>
</div>

<div>
	<!-- <h2>이름 : 윤영식</h2> -->
	<h2>이름 : <%=userName %></h2>
	
	<!-- <h2>전화번호 : 010-1100-2200</h2> -->
	<h2>전화번호 : <%=userTel %></h2>
	
	<!-- <h2>아이디 : superman</h2> -->
	<h2>아이디 : <%=userId %></h2>
	
	<!-- <h2>패스워드 : java006$</h2> -->
	<h2>패스워드 : <%=userPwd %></h2>
</div>

<%-- 
<div>
	<h1>♥ <%=name %>(<%=userId %>)님, 환영합니다 ♥</h1>
	<hr>
	<p>제가 맞춰보겠습니다...<p>
	<p>당신의 전화번호는 <span><%=tel %></span>이고,</p>
	<p>당신의 패스워드는 <span><%=userPwd %></span>일 것입니다...
	<img style="margin-left: 300px;" alt="" src="images/bluePerson.jpg"></p>
</div>
 --%>
</body>
</html>