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
		// resultStr += ....;
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

<!-- html 주석문 : 브라우저한테 이거 그리지 마~하는것.
	 서블릿컨테이너는 읽어서 렌더링하므로, 브라우저에게 페이지소스보기 하면 주석문이 다 보인다. -->
<%-- jsp 주석문 : 서블릿컨테이너한테 안 보이게 하는것. 렌더링 안 함--%>

<%-- 
<%
	// 스크립릿 영역
	for (int i=1; i<=9; i++)	// i : 1 ~ 9
	{
		// 출력 스트림에 실어서 내보내는 것
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




</body>
</html>