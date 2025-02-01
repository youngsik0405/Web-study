<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(→ SendAndReceive06.jsp)로부터 넘어온 데이터 수신
	//				  --------------------
	//						자기 자신
	// → userInput
	
	String temp = "";
	//String temp = "수신결과 없음";
	
	temp = request.getParameter("userInput");

	if (temp == null)
		temp = "수신결과 없음";
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive06.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 06</h1>
	<hr>
</div>

<div>
	<!-- 
	<form action="Test999.jsp" method="post">
		입력
		<input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">취소</button>
	</form>	
	-->
	
	<!-- 	
	<form action="" method="post">
		입력
		<input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">취소</button>
	</form>	
	-->
	
	<!-- 	
	<form action="" method="get">
		입력
		<input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">취소</button>
	</form> 
	-->
	
	
	<!-- 	
	<form action="" method="post">
		입력
		<input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">취소</button>
	</form>
	-->
	
	<form method="post">
		입력
		<input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">취소</button>
	</form>
	
	<!-- check~!!! -->
	<!-- ※ <form> 의 action 속성을 『action=""』과 같이 구성하거나
			action 속성 자체를 생략하여 『<form method="post">』와 같이 구성하게 되면
			페이지 요청 및 데이터 전송에 대한   -->
	
</div>
<br><br>

<div>
	<h2>수신된 데이터 확인</h2>
	<h3>→ <%=temp %></h3>
</div>


</body>
</html>