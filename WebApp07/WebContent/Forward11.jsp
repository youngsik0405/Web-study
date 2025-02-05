<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Forward11.jsp
	
	//이전 페이지(→ Send11.html)로부터 넘어온 데이터 수신
	// → num1, num2, op
	
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String op = request.getParameter("op");
	
	int num1, num2;
	num1=num2=0;
	String result = "";
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		if(op.equals("1"))		//-- 더하기
			result = String.format("%d + %d = %d", num1, num2, (num1+num2));
		else if(op.equals("2"))	//-- 빼기
			result = String.format("%d - %d = %d", num1, num2, (num1-num2));
		else if(op.equals("3"))	//-- 곱하기
			result = String.format("%d * %d = %d", num1, num2, (num1*num2));
		else if(op.equals("4"))	//-- 나누기
			result = String.format("%d / %d = %.1f", num1, num2, (num1/(double)num2));
		else
			result = "알 수 없음";
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	request.setAttribute("resultStr", result);


%>

<jsp:forward page="Receive11.jsp"></jsp:forward>

