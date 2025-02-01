<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>include 액션 태그 활용 실습</h1>
	<hr>
</div>

<div>
	<table style="width: 600px;" border="1">
		<tr>
			<td colspan="2">
				<!-- Top -->
				<jsp:include page="Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr style="height: 400px;">
			<td style="width: 150px;">
				<!-- Left -->
				<jsp:include page="Left.jsp"></jsp:include>
			</td>
			<td>
				Main(메인 화면)
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<!-- Bottom -->
				<jsp:include page="Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</div>

</body>
</html>