<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿(Scriptlet) 영역 : 서블릿컨테이너에게 전달할 수 있음
	String name = "곽유진";
	name += "은 홍길동이 아니다.";
	
	int result;
	result = 10 + 20;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsptest001.jsp</title>
</head>
<body>

<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div>
	<!-- <h2>곽유진</h2> -->
	<!-- 위 구문처럼 정적으로 처리하는 게 아니라 내가 name이라는 변수에 담은 값을 표현해줘-->
	<h2><%=name %></h2>
	<h2><%=result %></h2>
</div>

</body>
</html>