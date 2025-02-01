<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MyData"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	// Test04.jsp
	//-- 사용자 정의 데이터타입을 취하는 자료구조 생성
	
	List<MyData> lists = new ArrayList<MyData>();

	MyData ob = new MyData("곽유진", 15);
	lists.add(ob);
	
	ob = new MyData("공찬민", 8);
	lists.add(ob);
	
	ob = new MyData("엄서연", 17);
	lists.add(ob);
	
	ob = new MyData("윤영식", 13);
	lists.add(ob);
	
	ob = new MyData("박제훈", 25);
	lists.add(ob);

	request.setAttribute("lists", lists);

%>

<jsp:forward page="Test04_result.jsp"></jsp:forward>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>




</body>
</html>