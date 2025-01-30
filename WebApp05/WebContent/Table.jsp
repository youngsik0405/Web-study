<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {color: red; font-weight: bold;}
</style>

</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<p><span>Table.jsp</span> → TableOk.jsp</p>
	<hr>
</div>

<div>
	<h2>테이블 구성</h2>
	
	<form action="TableOk.jsp" method="post">
		<table class="table">
			<tr>
				<th>가로</th>
				<td>
					<input type="text" class="txt" name="su1">
				</td>
			</tr>
			<tr>
				<th>세로</th>
				<td>
					<input type="text" class="txt" name="su2">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn control" style="width: 400px;">결과 확인</button>
				</td>
			</tr>
		</table>

			
	
	</form>
	
</div>



</body>
</html>