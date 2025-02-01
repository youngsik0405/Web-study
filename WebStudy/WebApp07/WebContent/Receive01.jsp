<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전페이지(Send01.html)로부터 넘어온 데이터 수신
	// → userName, userTel
	
	// 한글 수신을 위한 인코딩 방식 지정
	//-- 웹은 UTF-8 을 기본 인코딩으로 처리하고 있음.
	//	 그러므로 기본 설정은 UTF-8 로 구성하는 것이 좋음.
	// 	 (하지만, 데이터 전송을 수행하는 페이지에서 EUC-KR 과 같은 다른 인코딩 방식으로
	//	  처리하고 있는 상황이라면, 그에따른 인코딩 방식이 지정되어야 한글 깨지지 않음.
	//	  또한, 지금 하고있는 이 처리는... 데이터를 수신하는 처리보다
	//	  먼저 수행되어야 한글이 깨짖지 않은 상태로 수신할 수 있다.)	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");

	/* 
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("userName");
	String tel = request.getParameter("userTel"); 
	*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Received.jsp</title>
</head>
<body>

<div>
	<h1>데이터 송수신 실습01</h1>

	<span style="color: skyblue; font-weight: bold;"><%=userName %></span>님,
	회원가입이 완료되었습니다.<br>
	회원님께서 등록하신 전화번호는
	<!-- <span style="color: skyblue; font-weight: bold;">010-1111-1111</span> 입니다.<br>  -->
	<span style="color: skyblue; font-weight: bold;"><%=userTel %></span> 입니다.<br>
</div>



<%-- <div>
	<%=name %>님, 회원 가입이 완료되었습니다.<br>
	회원님께서 등록하신 전화번호는 <%=tel %> 입니다.
</div>
 --%>
</body>
</html>