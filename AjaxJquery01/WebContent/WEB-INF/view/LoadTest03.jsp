<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoadTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">

	//$(function() 이렇게만 해도 됨~!
	$(document).ready(function()
	{
		$("#sendButton").click(function()
		{
			// 확인
			//alert("버튼 클릭 확인~!!!");
			
			var su1 = $("#su1").val();
			var su2 = $("#su2").val();
			var oper = $("#oper").val();
			//alert(su1 + " " + oper + " " + su2);
			
			// 유효성 검사.. 해야 하나?
			if (su1 == "" || su2 == "" || isNaN(su1) || isNaN(su2))
				return;
			
			var url = "loadtest03.do?su1=" + su1 + "&oper=" + oper + "&su2=" + su2;
			
			$("#result").load(url);
			//-- 비동기, responseText하게 되는 것.
			
		})
	})

</script>
</head>
<body>

<div>
	<h1>jQuery의 load() 활용 실습</h1>
	<hr>
</div>

<div>
	<input type="text" id="su1" class="txt txtNum">
	
	<select id="oper">
		<option value="add">덧셈</option>
		<option value="sub">뺄셈</option>
		<option value="mul">곱셈</option>
		<option value="div">나눗셈</option>
	</select>
	
	<input type="text" id="su2" class="txt txtNum">
	
	<input type="button" value=" = " id="sendButton" class="btn">
</div>
<br>

<!-- 
	loadtest03send.do → Test03send.java → LoadTest03.jsp
												↓
											loadtest03.do → LoadTest03.java → LoadTest03ok.jsp
-->

<!-- 결과 갱신~!!! -->
<div id="result">
</div>
<br><br><br><br>

<div>
	<input type="radio" name="rdo">rdo1
	<input type="radio" name="rdo">rdo2
</div>

<div>
	<input type="checkbox" name="chk">chk1
	<input type="checkbox" name="chk">chk2
</div>

<div>
	<input type="text">
</div>


</body>
</html>