<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 쿠키 생성 (서버에 생성된 쿠키)
	Cookie c = new Cookie("cookie_test", "studyCookie");

	// 쿠키 설정 (서버에 생성된 쿠키에 대해 설정)
	c.setMaxAge(3600);
	//c.setMaxAge(5);
	//-- 쿠키 1시간 유지
	
	// 쿠키 추가 (서버에서 생성된 쿠키를 클라이언트에 전달 → 클라이언트 쿠키 상자에 추가)
	response.addCookie(c);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSetCookie.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>쿠키 설정 및 추가</h1>
	<p>TestSetCookie.jsp</p>
	<hr>
</div>

<div>
	<a href="TestGetCookie.jsp"><button type="button" class="btn">쿠키 정보 확인</button></a>
	<a href="TestRemoveCookie.jsp"><button type="button" class="btn">쿠키 정보 삭제</button></a>
</div>

</body>
</html>