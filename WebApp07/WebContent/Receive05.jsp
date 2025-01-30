<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	// 이전 페이지(Send05.html)로부터 넘어온 데이터 수신
	// → dan
	
	String dan = request.getParameter("dan");
	int nDan = 0;
	String result = "";
	
	try
	{
		nDan = Integer.parseInt(dan);
		
		for (int i=1; i<=9; i++)
		{
			result += String.format("%d * %d = %d", nDan, i, (nDan*i));
		}
		
	}
	catch(Exception e)
	{
		System.out.print(e.toString());
	}

/* 
	String dan = request.getParameter("dan");

	int n = 0;
	int res = 0;
	
	try
	{
		n = Integer.parseInt(dan);
	}
	catch(Exception e)
	{
		System.out.print(e.toString());
	}
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	*
	{
		font-weight: bold;
		font-size: 15pt;
		text-align: center;
	}
	body
	{
		 background-image: url('images/gg.jpg');
	}
	.textarea
	{
		text-align: center;
	}
</style>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 05</h1>
	<hr>
</div>

<div>
	<h2>구구단 출력</h2>
	
	<%=result %><br>
</div>



<%-- 
<textarea rows="20" cols="20" disabled="disabled" style="background-color: white;">
<%
	for (int i=1; i<=9; i++)
	{
%>
	<%=n %> * <%=i %> = <%=(n*i) %>
<%	
	}
%>
</textarea>
 --%>
</body>
</html>