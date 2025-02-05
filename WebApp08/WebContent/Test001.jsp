<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이 페이지가 요청될 때 스크립릿에서 처리할 거 처리하고 문서 렌더링 시작할 것..
	String str = "";

	try
	{
		Connection conn = DBConn.getConnection();
		
		if (conn != null)
		{
			str += "데이터베이스 연결 성공~!!!";
		}
	}
	catch(Exception e)
	{
		//System.out.println(e.toString());
		
		str += e.toString();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test001.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터베이스 연결 실습</h1>
	<hr>
</div>

<div>
	<!-- <h2>상태 확인</h2> -->
	<h2><%=str %></h2>
</div>



</body>
</html>