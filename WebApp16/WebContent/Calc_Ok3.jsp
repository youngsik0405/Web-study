<%@page import="com.test.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%-- Cal_ok2.jsp
<jsp:useBean id="ob" class="com.test.Calc"></jsp:useBean>
<jsp:setProperty property="su1" name="ob"/>
<jsp:setProperty property="su2" name="ob"/>
<jsp:setProperty property="op" name="ob"/>
--%>

<jsp:useBean id="ob" class="com.test.Calc"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>
<!-- ob의 모든 property들을 모두 다 set하는데, 
ob에 있는 property의 이름과 같은 값을 전달받고 형변환도 적절히 해서 setter 메소드 호출 다 해라 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok3.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>세 번째 방법 처리 결과</h1>
	<hr>
</div>

<div>
	<!-- <h2>결과</h2> -->
	<h2><%=ob.result() %></h2>
</div>

</body>
</html>