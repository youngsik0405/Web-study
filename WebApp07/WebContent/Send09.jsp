<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String result = "";

	result += "<ul>";
	
	for (int i=1; i<=9; i++)
	{
		// 링크 걸기
		//result += String.format("<li><a href=''>%d단<a></li>", i);
		// 요청페이지?이름=값 을 넘길 수 있다. -- 이때의 이름은 넘기는 페이지에서 값을 불러오는데 사용 
		//result += String.format("<li><a href='Receive09.jsp?gugudan=%d'>%d단<a></li>", i, i);
		// ※ System.out.printf("%3$d 와 %2$d 와 %1$d", 10, 20 , 30) --> 30와 20와 10 처럼
		// -- 원하는 순서대로 값을 넣을 수 있다.
		result += String.format("<li><a href='Receive09.jsp?gugudan=%1$d'>%1$d단<a></li>", i);
	}
	
	result += "</ul>";
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send09.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	a {text-decoration: none;}
</style>

</head>
<body>

<div>
	<h1>데이터 송수신 실습 09</h1>
	<hr>
</div>

<!--  
	○ 데이터 송수신 실습 09
	
		- a 태그(링크 태그)에 대한 반복문 처리를 하는 JSP 페이지를 구성한다.
		
		- 이를 활용하여 구구단 리스트를 동적으로 구성하여
		  선택에 따른 결과 페이지를 요청하여 출력해주는 형태의 페이지로 구현한다.
		  
		- submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
		
		- 구구단 선택
		
		  1단 ┐
		  2단 │	
		  3단 │목록 구성
		   :  │
		  7단 │
		  8단 │
		  9단 ┘	

		- 리스트의 특정 항목(단)을 선택했을 때(클릭했을 때)
		  구구단을 출력해주는 형태의 페이지(Receive09.jsp)를 요청할 수 있도록 처리한다.
		  
		- 사용자 최초 요청 주소
		  http://localhost:3306/WebApp07/Send09.jsp
		  
	○ 물리적 파일 구성
		
		- Send09.jsp
		- Receive09.jsp 
-->

<div>

	<h2>구구단 선택</h2>
	<%=result %>

<!-- 
	<a href="Receive09.jsp?dan=1">1단</a><br>
	<a href="Receive09.jsp?dan=2">2단</a><br>
	<a href="Receive09.jsp?dan=3">3단</a><br>
	<a href="Receive09.jsp?dan=4">4단</a><br>
	<a href="Receive09.jsp?dan=5">5단</a><br>
	<a href="Receive09.jsp?dan=6">6단</a><br>
	<a href="Receive09.jsp?dan=7">7단</a><br>
	<a href="Receive09.jsp?dan=8">8단</a><br>
	<a href="Receive09.jsp?dan=9">9단</a><br> 
-->
</div>


</body>
</html>