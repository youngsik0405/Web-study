<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("userName");
	String tel = request.getParameter("userTel");
%> --%>
<%
	// 이전페이지(Send01.html)로부터 넘어온 데이터 수신
	// → userName, userTel
	
	// 한글 수신을 위한 인코딩 방식 지정
	//-- 웹은 UTF-8 을 기본 인코딩으로 처리하고 있음.
	//   그러므로 기본 설정은 UTF-8 로 구성하는 것이 좋음.
	//   (하지만, 데이터 전송을 수행하는 페이지에서 EUC-KR 과 같이 다른 인코딩 방식으로
	//	  처리하고 있는 상황이라면, 그에 따른 인코딩 방식이 지정되어야 한글 깨지지 않음.
	//    또한, 지금 하고있는 이 처리는... 데이터를 수신하는 처리보다
	//    먼저 수행되어야 한글이 깨지지 않은 상태로 수신할 수 있다.)
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<%-- <div>
	<h1>★환영합니다~!~!~★</h1>
	<hr>
</div>

<div>
	<p>『<%=name %>님, 회원 가입이 완료되었습니다.<br>
	회원님께서 등록하신 전화번호는 <%=tel %> 입니다.』</p>
</div> --%>

<div>
	<h1>데이터 송수신 실습 01</h1>
	<hr>
</div>

<div>
	<h2>가입 확인</h2>
	
	<span style="color: blue; font-weight: bold;"><%=userName %></span>님,
	회원 가입이 완료되었습니다.<br>
	회원님께서 등록하신 전화번호는
	<span style="color: red;"><%=userTel %></span> 입니다.
</div>

</body>
</html>