<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로(→ Send03.html)로부터 넘어온 데이터 수신
	// → num1, op, num2
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String op = request.getParameter("op");
	
	String result = "";			//문자열 형태로 선언...~~!!!
	
	int num1 = 0;
	int num2 = 0;
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		if (op.equals("+"))
			result = String.valueOf(num1 + num2);
		else if (op.equals("-"))
			result = String.valueOf(num1 - num2);
		else if (op.equals("*"))
			result = String.valueOf(num1 * num2);
		else if (op.equals("/"))
		{	
			//result = String.valueOf(num1 / num2);
			//result = String.valueOf(num1 / (double)num2);
			result = String.format("%.1f", num1 / (double)num2);
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
<title>Receive03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {color: blue; font-weight: bold; font-size: 16pt;}
</style>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 03</h1>
	<hr>
</div>

<div>
	입력하신 <span><%=num1 %></span>와(과) <span><%=num2 %></span>의 
	연산 결과는 <span><%=result %></span> 입니다.
</div>

</body>
</html>