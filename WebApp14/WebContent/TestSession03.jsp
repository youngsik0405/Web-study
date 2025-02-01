<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(→ TestSession02.jsp)로부터 넘어온 데이터 수신
	// → userId, userPwd
	//    + userName, userTel
	
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	String userName = (String)session.getAttribute("userName");
	String userTel = (String)session.getAttribute("userTel");

	session.removeAttribute("userName");
	session.removeAttribute("userTel");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>TestSession03.jsp</h1>
	<p>이름, 전화번호, 아이디, 패스워드 확인</p>
	<hr>
</div>

<div>
	 <h2>이름 : <%=userName %></h2>
	 <h2>전화번호 : <%=userTel %></h2>
	 <h2>아이디 : <%=userId %></h2>
	 <h2>패스워드 : <%=userPwd %></h2>
</div>


</body>
</html>