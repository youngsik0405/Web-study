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
<title>GetTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#loadBtn").click(function()
		{
			// 확인
			//alert("버튼 클릭 확인~!!!");
			
			var nickName = $("#nickName").val();
			
			// ※ 『get()』
			//	  『$.get(url, data, callBack);』 : 선택자 $()를 활용해서 load()하는 게 아니라 제이쿼리 $를 활용해서..
			//	  - 매개변수로 전달받은 url 을 사용하여
			//		서버에 대한 GET 요청을 전송하도록 한다.
			
			//	  『$.get(url, {속성1:값1, 속성2:값2, 속성3:값3, ...}, callBack);』
			//	  - 전달 과정에서 data 는 JSON 형태로 처리할 수 있다.
			
			//	  『$.get(url, {속성1:값1, 속성2:값2, 속성3:값3, ...}, function(넘겨받은값)
			//		{
			//			$(선택자).html(넘겨받은값 처리);
			//		});』
			
			//$.get();
			// GetTest01ok.jsp 에게 nickName 이란 이름을 nickName값을 주고, 받은 값은 함수의 매개변수로 받는다.
			$.get("GetTest01ok.jsp", {nickName : nickName}, function(data)
			{
				// div 갱신
				$("#resultDiv").html(data);
			});
			
		});
	});

</script>

</head>
<body>

<div>
	<h1>jQuery의 get() 활용 실습</h1>
	<hr>
</div>

<div>
	<input type="text" id="nickName" class="txt">
	<br><br>
	
	<button type="button" id="loadBtn" class="btn">클릭 확인</button>
</div>
<br>

<div id="resultDiv">
</div>



</body>
</html>