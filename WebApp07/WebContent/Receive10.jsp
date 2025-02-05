<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로부터 넘어온 데이터 수신
	// -----------(→ Send10Redirect.jsp 또는 Send10Forward.jsp)
	// → userName (send10.html에서부터 Send10Redirect.jsp또는Send10Forward.jsp를 거쳐 넘어온..)
	// → userName + message
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	
	// check~!!!
	// - setAttribute() 로 넘긴 값을 수신하는 과정은 getAttribute() 로 처리해야 한다.
	// - getAttribute() 메소드는 Object 를 반환한다.
	//request.getAttribute("message");
	//Object obj = request.getAttribute("message");
	String message = (String)request.getAttribute("message");	//다운캐스팅
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive10.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<p>최종 결과 수신(Receive10.jsp)</p>
	<hr>
</div>

<div>
	<!-- <p>이름 : 공찬민</p> -->
	<p>이름 : <%=userName %></p>
	<!-- 리다이렉트에서 넘어왔을 때는 수신 불가 --==>> 이름 : null -->
	<!-- 포워드에서 넘어왔을 때는 수신 완료 --==>> 이름 : 곽유진 -->
	
	<p>내용 : <%=message %></p>
	<!-- 리다이렉트에서 넘어왔을 때는 수신 불가 --==>> 내용 : null -->
	<!-- 포워드에서 넘어왔을 때는 수신 완료 --==>> 내용 : 또만납시다. -->
</div>

</body>
</html>