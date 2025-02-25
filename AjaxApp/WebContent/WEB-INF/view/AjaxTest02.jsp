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
<title>AjaxTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<style type="text/css">
	.short
	{
		width: 50px;
		text-align: right;
	}

</style>

<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">

	function sum()
	{
		// 확인
		//alert("함수 호출 확인~!!!");
		
		// 데이터 수집
		var n1 = document.getElementById("num1").value;
		var n2 = document.getElementById("num2").value;
		
		// URL 구성
		var url = "test02.do?n1=" + n1 + "&n2=" + n2;
		
		// XMLHttpRequest 객체 생성(→ AJAX 객체) : 스탭 생성
		ajax = createAjax();								//-- ajax.js
		
		ajax.open("GET", url, true);			// : 스탭한테 어떻게 처리하라고 작업지시서 전달
		//-- 『GET』 : 데이터 전송 및 페이지 요청 방식
		//             (POST 사용 가능. 단, POST 사용 시 헤더 추가 필요)
		//   『url』 : AJAX 요청 페이지
		//             (데이터 수신 및 응답 페이지)
		//   『true』: boolean
		//             true → 비동기, false → 동기. 동기는 사용 안함.
		//-- 실제 서버와의 연결이 아니고
		//   일종의 환경 설정 부분으로 이해하는 것이 
		//   (실제 서버 연결은 나중에....)
		
		// ajax 객체(→ XMLHttpRequest 객체)의 readyState 속성은
		// 각 단계별로 변화되며, 0 부터 4 까지 순차적으로 증가하는 형태로 변화한다.
		// 그 때 마다... 『readystatechange』 이벤트가 발생한다.
		ajax.onreadystatechange = function()	// : 이런 이벤트가 발생할 때마다 체크하셈
		{
			//alert("readyState : " + ajax.readyState);
			
			// readystatechange 이벤트가 발생한 상황에서...
			// readyState 속성을 확인하여 그 중에서...(0 부터 4 까지의 상태 중에서...)
			// 4 가 되는 순간이 요청했던 서버로부터 응답이 완료된 시점이기 때문에
			// 4 인 경우... 수행해야 할 업무를 진행한다.
			if (ajax.readyState==4)
			{
				// 서버로부터 응답이 완료되었다 하더라도
				// 그 과정에서 데이터가 올바른 것인지 에러 메세지를 받은 것은 아닌지
				// 알 수 없기 때문에 서버로부터 응답받은 코드를 확인한 후
				// 업무를 진행할 수 있도록 처리(구성)한다.
				if (ajax.status==200)
				{
					// 업무 처리
					//-- 업무 코드를 외부로 추출
					callBack();
				}
			}
		};
		
		ajax.send("");
		//-- 실제 서버에서 AJAX 요청을 한다. (즉, 이 부분이 진짜 연결 작업이다.)
		//   GET 방식으로 데이터를 전송하는 경우... 인자값이 ""
		//   POST 방식으로 데이터를 전송하는 경우... 인자값에 데이터를 넣는다.
		//   현재는 GET 방식의 요청이다. (실무적인 팁으로 비워두는 것은 하지말자.)
	
	}
	
	// 추출된 업무 코드
	//-- AJAX 요청이 완료된 후 호출되는 최종 업무 처리 함수
	function callBack()
	{
		// 여기서는 두 가지 방법 중 하나로 데이터를 가져온다.
		
		// 1. 서버에서 응답한 데이터가 텍스트일 경우(단일 데이터)
		var data = ajax.responseText;		//Test02ok.jsp가 쥐고 있던 result 텍스트값을 받아옴..
		
		// 2. 서버에서 응답한 데이터가 XML일 경우(다량의 데이터)
		//var data = ajax.responseXML;
		
		// 서버로부터 수신한 데이터를 업무에 적용한다.
		document.getElementById("result").value = data;
		
	}

</script>

</head>
<body>

<div>
	<h1>AJAX 기본 실습</h1>
	<p>- Test02send.java 에서 요청을 받아..</p>
	<p>- AjaxTest02.jsp 클라이언트에게 보여주기</p>
	<p>- ajax.js 를 참조해서..</p>
	<p>- Test02.java 에서 값 받아서 처리할 수 있게..</p>
	<p>- Test02ok.jsp 에 result 조각값 가지고 있게..</p>
	<p>- web.xml 에서 서블릿 매핑 처리..</p>
	<p>※ url : test02send.do / test02.do</p>
	<hr>
</div>

<div>
	<h1>AJAX 기본 실습</h1>
	<hr>
</div>

<input type="text" id="num1" class="short">
+
<input type="text" id="num2" class="short">
<input type="button" value=" = " onclick="sum()">
<input type="text" id="result" class="short">

<br><br>

<h2>같은 페이지에 있는 기타 다른 요소들</h2>

<input type="text">
<br><br>

<label><input type="checkbox" name="check" value="check1">체크1</label>
<label><input type="checkbox" name="check" value="check2">체크2</label>
<br><br>

<label><input type="radio" name="rdo" value="rdo1">라디오1</label>
<label><input type="radio" name="rdo" value="rdo2">라디오2</label>
<br><br>

<select id="sel">
	<option value="1">선택1</option>
	<option value="2">선택2</option>
	<option value="3">선택3</option>
</select>
<br><br>

</body>
</html>