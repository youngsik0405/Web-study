<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Table.jsp)로부터 넘어온 데이터 수신
	// → su1, su2
	
	request.setCharacterEncoding("UTF-8");

	//int n1 = request.getParameter("su1");
	String s1 = request.getParameter("su1");
	String s2 = request.getParameter("su2");
	
	// 변환 데이터를 담아둘 변수 선언 및 초기화
	int n1 = 0;
	int n2 = 0;
	
	// 테이블 안에서 1씩 증가시켜나갈 변수 선언 및 초기화
	int n = 0;
	
	try
	{
		n1 = Integer.parseInt(s1);
		n2 = Integer.parseInt(s2);
		
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
<title>TableOk.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {color: red; font-weight: bold;}
	td {width: 40px;}
</style>

</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<p>Table.jsp → <span>TableOk.jsp</span></p>
	<hr>
</div>

<div>
	<table border="1">
		<!-- <tr>
			<td>1</td><td>2</td><td>3</td>
		</tr>
		<tr>
			<td>4</td><td>5</td><td>6</td>
		</tr> -->
		
		<%
		for (int i=0; i<n2; i++)	//-- 세로 : n2
		{
		%>
			<tr>
			<%
			for (int j=0; j<n1; j++)	//-- 가로 : n1
			{
			%>
				<td style="text-align: right;"><%=++n %></td>
			<%
			}
			%>
			</tr>
		<%
		}
		%>
		
		
	</table>
	
</div>

</body>
</html>