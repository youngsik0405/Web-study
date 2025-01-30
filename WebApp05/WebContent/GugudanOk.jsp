<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 이전 페이지(Gugudan.jsp)로부터 넘어온 데이터 수신
	// → dan
	String danStr = request.getParameter("dan");
	
	int n = 0;
	
	//String resultStr = "";
	
	try
	{
		n = Integer.parseInt(danStr);
		
		// 반복문 구성
		// resultStr += ...;
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}




	/* 나의 풀이 	
	String str = request.getParameter("dan");
	
	int res = 0;
	int n = 0;

	try
	{
		n = Integer.parseInt(str);
		for(int i=1; i<=9; i++)
		{
			res = i * n;
			out.println(n + " * " + i + " = " + res);
		} 
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
		
		getServletContext().log("오류 : " + e.toString());
	} 
	*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GugudanOk.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {color: red; font-weight: bold;}
</style>

</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<p>Gugudan.jsp → <span>GugudanOk.jsp</span></p>
	<hr>
</div>

<!-- html 주석문 -->
<%-- jsp 주석문 --%>


<%-- 
<%
	// 스크립릿 영역
	for (int i=1; i<=9; i++)
	{
		out.print(n + " * " + i + " = " + (n*i) + "<br>");
	}
%> 
--%>

<%
	for (int i=1; i<=9; i++)
	{
%>
	<%=n %> * <%=i %> = <%=(n*i) %><br>
<%	
	}
%>




<%-- 
<div>
	<h2>처리결과 : 
	<%
	for(int i=1; i<=9; i++)
	{
		out.println("<br>" +  n + " * " + i + " = " + (n*i) + "<br>");
	}  
	%>
	</h2>
</div>  
--%>



</body>
</html>