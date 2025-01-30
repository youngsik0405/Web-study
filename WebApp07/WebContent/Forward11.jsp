<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Forward11.jsp
	
	// 이전 페이지(→ Send11.jsp)로부터 넘어온 데이터 수신
	// → num1, num2, op
	
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
	
	request.setAttribute("resultStr", result);
	
	
	/* 나의 풀이
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String op = request.getParameter("op");
	String result = "";
	
	try
	{
		int num1 = Integer.parseInt(num1Str);
		int num2 = Integer.parseInt(num2Str);
		
		
		switch (op)
		{
		 	case "+" : result = String.format("%d + %d = %d", num1, num2, (num1+num2)); break;
		 	case "-" : result = String.format("%d - %d = %d", num1, num2, (num1-num2)); break;
		 	case "*" : result = String.format("%d * %d = %d", num1, num2, (num1*num2)); break;
		 	case "/" : result = String.format("%d / %d = %d", num1, num2, (num1/num2)); break;
		}		
	}
	catch(Exception e)
	{
		System.out.print(e.toString());
	}
	
	request.setAttribute("res", result);
	*/
	
	
%>

<jsp:forward page="Receive11.jsp"></jsp:forward>
