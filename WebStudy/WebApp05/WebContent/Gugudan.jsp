<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {color: red; font-weight: bold;}
</style>

</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<p><span>Gugudan.jsp</span> → GugudanOk.jsp</p>
	<hr>
</div>

<div>
	<!-- ※ <form> 구성 -->
	<!-- ※ <form> 의 action 속성 → GugudanOk.jsp  -->
	<!-- ※ <form> 의 method 속성 → 데이터 전송 및 페이지 요청 방식 -->
	<form action="GugudanOk.jsp" method="get">
		<table class="table">
			<tr>
				<th>원하는 단 입력</th>
				<td>
					<!-- ※ name 속성 → dan -->
					<input type="text" name="dan" class="txt">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- ※ submit 액션 처리 -->
					<input type="submit" value="결과 확인" class="btn control" style="width: 100%;">
				</td>					
			</tr>
		</table>
	</form>
</div>


</body>
</html>