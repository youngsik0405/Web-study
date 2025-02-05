<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로(→ Send04_01.html)로부터 넘어온 데이터 수신
	// → userId, userPw, userName, userTel, userGender, userCity, userSubject
	
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");				//-- text
	String userPw = request.getParameter("userPw");				//-- password
	String userName = request.getParameter("userName");			//-- text
	String userTel = request.getParameter("userTel");			//-- text
	
	String userGender = request.getParameter("userGender");		//-- radio
	String userCity = request.getParameter("userCity");			//-- select
	
	// check~!!!
	//String userSubject = request.getParameter("userSubject");	//-- check(다중선택)
	
	String[] userSubjectArr = request.getParameterValues("userSubject");
	
	String subjectStr = "";
	
	if(userSubjectArr != null)
	{
		for (int i=0; i<userSubjectArr.length; i++)
		{
			subjectStr += "[" + userSubjectArr[i] + "] ";
		}
	}
	
	// ※ 추후에는... 수신된 데이터를 쿼리문을 통해 DB 에 입력하는
	//    처리 과정 등이 포함될 수 있음을 염두하며 작업을 진행할 수 있도록 하자.

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 04</h1>
	<hr>
</div>

<div>
	<h2>가입 승인 내역</h2>
	
	<!-- <p>아이디 : batman</p> -->
	<p>아이디 : <%=userId %></p>
	
	<!-- <p>패스워드 : net1234</p> -->
	<p>패스워드 : <%=userPw %></p>
	
	<!-- <p>이름 : 안석창</p> -->
	<p>이름 : <%=userName %></p>
	
	<!-- <p>전화번호 : 010-1234-1234</p> -->
	<p>전화번호 : <%=userTel %></p>
	
	<!-- <p>성별 : 남성</p> -->
	<p>성별 : <%=userGender %></p>
	
	<!-- <p>지역 : 대구</p> -->
	<p>지역 : <%=userCity %></p>
	
	<!-- <p>수강과목 : [오라클중급] [JDBC심화]</p> -->
	<p>수강과목 : <%=subjectStr %></p>
	
</div>

</body>
</html>