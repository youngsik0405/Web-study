<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//이전 페이지(→ Send05_01.html)로부터 넘어온 데이터 수신
	// → dan
	
	String danStr = request.getParameter("dan");
	int dan = 0;
	String result = "";
	try
	{
		dan = Integer.parseInt(danStr);
		
		for(int i=1; i<=9; i++)
			result += dan + " * " + i + " = " + (dan*i) + "<br>";
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
<title>Receive05_01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1><%=dan %>단</h1>
	<hr>
</div>

<div>
<%=result %>
</div>

</body>
</html>