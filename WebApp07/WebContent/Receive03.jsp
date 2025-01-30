<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로(→ Send03.html)부터 넘어온 데이터 수신
	// → num1, op, num2
	request.setCharacterEncoding("UTF-8");
	
	String num1Str = request.getParameter("num1");
	String op = request.getParameter("op");
	String num2Str = request.getParameter("num2");

	int num1 = 0;
	int num2 = 0;
	
	String res = "";
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		switch(op)
		{
			case "더하기": res = String.format("%d",num1+num2); break;
			case "빼기": res = String.format("%d", num1-num2); break;
			case "곱하기": res = String.format("%d", num1*num2); break;
			case "나누기": res = String.format("%.2f",(double) num1/num2); break;
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
	span {color: skyblue; font-weight: bold; font-size: 15pt;}
</style>

</head>
<body>

<div>
	입력하신 <span><%=num1 %></span>와(과) <span><%=num2 %></span>의 연산 결과는 <span><%=res %></span> 입니다.

</div>

</body>
</html>