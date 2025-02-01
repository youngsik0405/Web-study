<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// TestSession01Ok.jsp
	
	// 이전 페이지(→ TestSession01Ok.jsp)로부터 넘어온 데이터 수신
	// → userId, userPwd
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	// dto 활용 → 로그인 관련 테이블의 데이터와 비교(→ dao 활용)
	// → 최종적으로 로그인 액션 처리
	String memberId = "superman";
	String memberPwd = "123456";
	String memberName = "박제훈";
	
	if (userId.equals(memberId) && userPwd.equals(memberPwd))	//-- 아이디와 패스워드 모두 일치
	{
		// 로그인 액션 처리
		session.setAttribute("userId", userId);					//-- userId : superman
		session.setAttribute("userName", memberName);			//-- memberName : 박제훈
		
		// 클라이언트가 로그인 페이지를 다시 요청할 수 있도록 안내
		response.sendRedirect("TestSession01.jsp");	
	}
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	a {text-decoration: none;}
</style>



</head>
<body>

<div>
	<h1>로그인 실패~!!!</h1>
	<hr>
</div>

<div>
	<a href="TestSession01.jsp">로그인 페이지로 돌아가기</a>
</div>

</body>
</html>