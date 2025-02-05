<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 접속자 수 처리
	int n = 0;

	String count = (String)application.getAttribute("count");	

	if (count != null)
		n = Integer.parseInt(count);
	
	n++;
	application.setAttribute("count", Integer.toString(n));
	
	// 웹 서버의 실제 물리적인 경로 확인
	String realPath = application.getRealPath("/");
	//--==>> C:\WebStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebApp15\
	
	// 원격지에 있는 (요청) 주소를 get하겠다는 메소드, request.getRemoteAddr()
	application.log("접속자 : " + request.getRemoteAddr());
	//--==>> 0:0:0:0:0:0:0:1
	// 이렇게 뜨는 주소는 서버 본인이라는 뜻~~!~!~!~!
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestApplication.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>Application 을 활용한 접속 현황 체크</h1>
	<hr>
</div>

<div>
	<h2>총 접속자 : <%=n %></h2>
	<h2>웹 서버 실제 경로 : <%=realPath %></h2>
</div>

</body>
</html>