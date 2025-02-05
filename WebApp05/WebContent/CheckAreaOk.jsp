<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 이전 페이지(CheckArea.jsp)로부터 넘어온 데이터 수신
	// → name, memo, checkGroup
	
	// 이름 데이터 수신
	String name = request.getParameter("name");
	
	// check~!!!
	// 메모 데이터 수신
	String memo = request.getParameter("memo");
	memo = memo.replaceAll("\n", "<br>");
	//-- JDK 1.5 이후부터 『replaceAll()』 메소드 사용 가능
	//   『replaceAll()』을 통해 처리한 결과(문자열)를 다시 memo 변수에 대입
	//   "안녕하세요.\n반갑습니다.\n정영훈입니다." → "안녕하세요.<br>반갑습니다.<br>정영훈입니다."
	
	// check~!!!
	// 이상형 데이터 수신
	//String checkGroup = request.getParameter("checkGroup");		//--(Ⅹ)
	
	// ※ 같은 name 속성의 값을 가진 데이터 여러 개를 수신하는 경우
	//    (즉, 다중 데이터 형태로 수신하는 경우)
	//    이를 배열로 처리해야 한다. → 『getParameterValues()』
	
	String[] checkArr = request.getParameterValues("checkGroup");
	
	// ※ 배열 데이터를 수신하여 처리할 경우...
	//    수신된 데이터가 존재하지 않을 경우는
	//    배열의 값 자체가 null 이 되어버리기 때문에
	//    null 에 대한 확인(검사) 과정이 필요하다.					//-- check~!!!
	
	String str = "";
	if (checkArr != null)
	{
		for (String item : checkArr)
			str += "[" + item + "] "; 
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckAreaOk.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {color: red; font-weight: bold;}
</style>

</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<p>CheckArea.jsp → <span>CheckAreaOk.jsp</span></p>
	<hr>
</div>

<div>
	<h2>textarea, check 데이터 수신 결과 확인</h2>
	
	<div>
		<!-- <h3>이름 : 정영훈</h3> -->
		<h3>이름 : <%=name %></h3>
		
		<h3>메모</h3>
		<!-- <p>나는 오타없이<br>타이핑이 점점<br>빨라지고 있다</p> -->
		<p><%=memo %>
		
		<!-- <h3>이상형 : [송가인] [아이유] [안유진]</h3> -->
		<h3>이상형 : <%=str %></h3>
	</div>
</div>

</body>
</html>