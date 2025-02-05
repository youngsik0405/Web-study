<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hap.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {color: red; font-weight: bold;}
</style>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<p><span>Hap.jsp</span> → HapOk.jsp</p>
	<hr>
</div>

<div>
	<!-- ※ <form> 구성 -->
	<!-- ※ <form> 의 action 속성 지정 -->
	<!--    → 『HapOk.jsp』로 지정해도 되고(같은 워크스페이스이므로), 『/WebApp05/HapOk.jsp』로 지정해도 된다. -->
	<!--       단, 『/HapOk.jsp』로 지정하면 안된다. /의 개념이 현재 디렉터리의 하위에 있는 HapOk.jsp를 찾기 때문  -->
	<form action="HapOk.jsp" method="post">
		정수1
		<!-- name 속성 구성 → 서버측 수신 식별자 → su1 -->
		<input type="text" class="txt" name="su1"><br>
		
		정수2
		<!-- name 속성 구성 → 서버측 수신 식별자 → su2 -->
		<input type="text" class="txt" name="su2"><br>
		<br>
		
		<input type="submit" value="결과 확인" class="btn control">
	
	</form>
	<!-- ① form 내부에 구성한 데이터들을 『HapOk.jsp』 로 전송하겠다.	→ form, action -->
	<!-- ② form 구성 데이터 → name 식별								→ su1, su2 	-->
	<!-- ③ HapOk.jsp 페이지를 요청하겠다.								→ form, submit -->
	<!-- ==> 내가 보내는 데이터들을 받고 나를 그 페이지로 안내해다오~!!! -->
	

</div>

</body>
</html>