<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(→ Send09.jsp)로부터 넘어온 데이터 수신
	// → gugudan
	
	String gugudanStr = request.getParameter("gugudan");

	int gugudan = 0;
	String result = "";
	
	try
	{
		gugudan = Integer.parseInt(gugudanStr);
		for (int i=1; i<=9; i++)	// i : 1 ~ 9
		{
			result += String.format("%d * %d = %d<br>", gugudan, i, (gugudan*i));
		}
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive09.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 연습 09</h1>
	<hr>
</div>

<div>
	<h2>수신된 데이터 : <%=gugudanStr %></h2>
	<%=result %>
</div>

</body>
</html>