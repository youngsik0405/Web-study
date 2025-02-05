<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String strN1 = request.getParameter("num1");
	String op = request.getParameter("op");
	String strN2 = request.getParameter("num2");
	
	double result = 0;
	
	int n1, n2;
	n1=n2=0;
	
	try
	{
		n1 = Integer.parseInt(strN1);
		n2 = Integer.parseInt(strN2);
		
		if(op.equals("+"))
		{
			result = n1 + n2;
		}
		else if(op.equals("-"))
		{
			result = n1 - n2;
		}
		else if(op.equals("*"))
		{
			result = n1 * n2;
		}
		else if(op.equals("/"))
		{
			result = n1 / (double)n2;
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
<title>Receive03_01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>★결과 확인 페이지★</h1>
	<hr>
</div>

<div>
  <p>『입력하신 <span><%= n1 %></span>와(과) <span><%= n2 %></span>의 연산 결과는
  <% 
    if (op.equals("/")) { 
      out.print(String.format("%.1f", result)); 
    } else { 
      out.print(Math.round(result)); 
    }
  %> 입니다.』</p>
  <%-- <%=String.format("%.1f", result) %> 입니다.』</p> --%>
</div>

</body>
</html>