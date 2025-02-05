<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(→SendAndReceive06.jsp)로부터 넘어온 데이터 수신
	//               --------------------
	//                    자기 자신
	// → userInput
	
	String temp = "";
	//String temp = "수신결과 없음";
	
	temp = request.getParameter("userInput");
	
	//처음 페이지 요청했을 때는 입력받은 게 없어서 temp가 null이 찍히므로, 그러지 않도록 초기값 부여
	if (temp==null)
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
		입력 <input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">취소</button>
	</form>
	-->
	<!-- Test999.jsp라는 파일을 못찾겠다고 404에러 뜸 -->
	 
	<!-- 
	<form action="" method="post">
		입력 <input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">취소</button>
	</form>
	-->
	<!-- 버튼 누를 때마다 입력값이 사라짐.. -->
	
	<!-- 
	<form action="" method="get">
		입력 <input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">취소</button>
	</form>
	-->
	<!-- http://localhost:3306/WebApp07/SendAndReceive06.jsp?userInput=300 -->
	<!-- action="" 으로 바꾸니까 자기자신한테 입력값을 보내고 있었던 거임.. -->
	
	<!-- 
	<form action="" method="post">
		입력 <input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">취소</button>
	</form>
	-->
	<!-- method="get" 때만 되는 건 아니다! post방식도 됨 -->
	
	
	<form method="post">
		입력 <input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">취소</button>
	</form>
	<!-- <form>의 action 속성 자체를 없애버려도 자기자신한테 수신한다. -->
	<!-- check~!!! -->
	<!-- ※ <form>의 action 속성을 『action=""』과 같이 구성하거나
	        action 속성 자체를 생략하여 『<form method="post">』와 같이 구성하게 되면
	        페이지 요청 및 데이터 전송에 대한 수신처 페이지는 자기 자신이 된다. -->
	
</div>
<br><br>

<div>
	<h2>수신된 데이터 확인</h2>
	<h3>→ <%=temp %></h3>
	<!-- 최초요청일 때는 null 이 찍힌다.. -->
</div>

</body>
</html>