<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//이전 페이지(→ Send05_01.html)로부터 넘어온 데이터 수신
	// → dan
	
	String dan = request.getParameter("dan");
	int nDan = 0;
	String result = "";
	
	try
	{
		nDan = Integer.parseInt(dan);
		
		for (int i=1; i<=9; i++)
		{
			result += String.format("%d * %d = %d<br>", nDan, i, (nDan * i));
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
<title>Receive05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 05</h1>
	<hr>
</div>

<div>
	<h2>구구단 출력</h2>
	<div>
		<!--
		2 * 1 = 2<br>
		2 * 2 = 4<br>
		2 * 3 = 6<br>
		2 * 4 = 8<br>
		2 * 5 = 10<br>
		2 * 6 = 12<br>
		2 * 7 = 14<br>
		2 * 8 = 16<br>
		2 * 9 = 18<br>
		-->
		<%=result %>
	</div>
</div>


</body>
</html>