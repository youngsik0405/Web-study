<%@page import="java.util.Random"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 참가자 수 계산
	int count = 0;
	
	while (request.getParameter("input" + (count+1)) != null) 
	{
	    count++;
	}
	
	// 참가자와 결과 배열에 생성
	String[] players = new String[count];
	String[] results = new String[count];
	
	// 참가자와 결과를 배열에 저장
	for (int i = 0; i < count; i++) 
	{
	    players[i] = request.getParameter("input" + (i + 1));
	    results[i] = request.getParameter("result" + (i + 1));
	}
	
	for (int i = 0; i < count; i++) 
	{
	    // 0부터 count-1까지의 랜덤 j 생성
	    int j = (int)(Math.random() * count);  // 0 <= j < count
	
	    // i와 j의 값을 교환
	    String temp = results[i];
	    results[i] = results[j];
	    results[j] = temp;
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	* 
	{
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	    text-align: center;
	}
	body 
	{
	    background-color: #f5f5f5;
	    padding: 20px;
	}
	p 
	{
		margin: 5px;
    	padding: 5px;
    }	
</style>
</head>
<body>

<div>
    <h1>게임 결과</h1>
	<hr>
</div>
    <!-- 결과 매칭 표시 -->
<div>
    <% for(int i = 0; i < count; i++) 
       { 
    %>
        <p><%= players[i] %> → <%= results[i] %></p>
    <% } %>
	<br>
	<a href="Sadari.jsp" style="font-size: 20pt;">다시하기</a>
</div>

</body>
</html>