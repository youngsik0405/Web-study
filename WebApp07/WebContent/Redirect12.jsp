<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Redirect12.jsp
	
	// 이전 페이지(→ Send12.html)로부터 넘어온 데이터 수신
	// → num1, num2, op
	
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String op = request.getParameter("op");
	
	int num1 = 0;
	int num2 = 0;
	String str = "";
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		if (op.equals("1"))			//-- 더하기
			str = String.format("%d", (num1+num2));
		else if (op.equals("2"))	//-- 빼기
			str = String.format("%d", (num1-num2));
		else if (op.equals("3"))	//-- 곱하기
			str = String.format("%d", (num1*num2));
		else if (op.equals("4"))	//-- 나누기
			str = String.format("%.1f", (num1/(double)num2));
	}
	catch(Exception e)
	{
		System.out.print(e.toString());
	}
	
	// check~!!!
	//response.sendRedirect("Receive12.jsp");
	//-- 클라이언트에게 Receive12.jsp 페이지를 다시 요청할 수 있도록 안내
	
	// ※ response 객체의 주요 메소드 중 하나인
	//    『sendRedirect(String location)』
	//    : 지정된 URL(location)로 요청을 다시 전송한다.
	
	response.sendRedirect("Receive12.jsp?num1="+ num1 + "&num2=" + num2 + "&op=" + op + "&str=" + str);
	
	
	/* 나의 풀이
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String op = request.getParameter("op");
	
	int num1 = 0;
	int num2 = 0;
	String result = "";
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		if (op.equals("+"))			//-- 더하기
			result = String.format("%d + %d = %d", num1, num2, (num1+num2));
		else if (op.equals("-"))	//-- 빼기
			result = String.format("%d - %d = %d", num1, num2, (num1-num2));
		else if (op.equals("*"))	//-- 곱하기
			result = String.format("%d * %d = %d", num1, num2, (num1*num2));
		else if (op.equals("/"))	//-- 나누기
			result = String.format("%d / %d = %.1f", num1, num2, (num1/(double)num2));
	}
	catch(Exception e)
	{
		System.out.print(e.toString());
	}
	
	//request.getSession().setAttribute("resultStr", result);
	
	response.sendRedirect("Receive12.jsp?num1="+num1+"&num2="+num2+"&op="+op+"&result="+result);
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Redirect12.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

</body>
</html>