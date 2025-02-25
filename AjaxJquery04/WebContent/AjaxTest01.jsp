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
<title>AjaxTest01.jsp here</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			// 확인
			//alert("버튼 클릭 확인~!!!");
			
			// data 구성
			/* 
			var params = "name=" + $("#name").val()
					+ "&content=" + $("#content").val();
			*/
			var params = "name=" + $.trim($("#name").val())
			+ "&content=" + $.trim($("#content").val());
			
			// check~!!!
			// ※ jQuery 의 ajax() 함수 사용
			//$.ajax();
			//	↓
			//$.ajax(
			//{
			//		type:데이터 전송 및 페이지 요청 방식(→ "GET"/"POST")
			//		, url: 요청 페이지 URL(→ "페이지경로포함이름문자열")
			//		, data: 요청 페이지에서 수신하게 되는 데이터(→ 파라미터 구성)
			//		, success: 페이지 요청 및 데이터 전달이 성공했을 때의 처리(→ 동작)
			//		, beforeSend: 요청 전 확인해야 할 항목 처리 및 반환값 확인(→ true/false)
			//		, error: 처리과정에서 문제가 발생했을 때의 처리(→ 동작)
			//});
			
			$.ajax(
			{
				type:"POST"
				, url: "AjaxTest01ok.jsp"
				, data: params				//-- url 지정 페이지로 넘길 값 check~!!!
				, success: function(args)
				{
					$("#resultDiv").html(args);
					
					$("#name").val("");
					$("#content").val("");
					
					$("#name").focus();
				}
				//, beforeSend: 함수호출
				, beforeSend: showRequest	//-- check~!!!	(→ true / false)
				, error: function(e)
				{
					alert(e.responseText);
				}
			});
			
		});
	});
	
	/*
	함수 정의
	{
		.....
		....
		....
		
		
		return true;
	}
	*/
	
	function showRequest()
	{
		if (!$.trim($("#name").val()))
		{
			alert("이름을 입력해야 합니다.");
			$("#name").focus();
			return false;
		}
		
		if (!$.trim($("#content").val()))
		{
			alert("내용을 입력해야 합니다.");
			$("#content").focus();
			return false;
		}
		
		return true;
		
	}
		
</script>

	

</head>
<body>

<div>
	<h1>jQuery의 ajax() 활용 실습</h1>
</div>

<div>
	이름
	<input type="text" id="name" class="txt"><br><br>
	
	내용
	<textarea id="content" cols="50" rows="3"></textarea>
	<br><br>

	<input type="button" value="등록하기" id="sendBtn" class="btn control">
</div>
<br><br>

<div id="resultDiv">
</div>

</body>
</html>