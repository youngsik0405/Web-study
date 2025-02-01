<%@page import="com.test.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%-- Calc_Ok2.jsp 
<jsp:useBean id="ob" class="com.test.Calc"></jsp:useBean>
<jsp:setProperty property="su1" name="ob"/>
<jsp:setProperty property="su2" name="ob"/>
<jsp:setProperty property="op" name="ob"/>
--%>

<jsp:useBean id="ob" class="com.test.Calc"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_Ok3.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>세 번째 방법 처리 결과</h1>
	<hr>
</div>

<div>
	<!-- 결과 -->
	<h2><%=ob.result() %></h2>
</div>
</body>
</html>