<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Redirect11.jsp
	
	// 이전 페이지(→ Send12.html)로부터 넘어온 데이터 수신
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
		
		if(op.equals("1"))		//덧셈이라면
			result = String.valueOf(num1+num2);
		else if(op.equals("2"))	//뺄셈이라면
			result = String.valueOf(num1-num2);
		else if(op.equals("3"))	//곱셈이라면
			result = String.valueOf(num1*num2);
		else if(op.equals("4"))	//나눗셈이라면
			result = String.format("%.1f", (num1/(double)num2));

	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	

	// check~!!!
	//response.sendRedirect("Receive12.jsp");
	//-- 클라이언트에게 Receive12.jsp 페이지를 다시 요청할 수 있도록 안내
	
	// ※ response 객체의 주요 메소드 중 하나인
	//    『sendRedirect(String location)』
	//    : 지정된 URL(location)로 요청을 다시 전송한다.
	
	response.sendRedirect("Receive12.jsp?num1=" + num1 + "&num2=" + num2 + "&op=" + op + "&result=" + result);
	//쿼리구성할때는 공백 들어가있으면 안 됨~!~!~!~!~!~
	//get방식으로 한글 넘길 때는 인코딩 방식 꼭 신경써야함..특히 한글 안에 공백 들어가면 특수문자로 들어가므로 신경쓰자.
	
	
	
%>