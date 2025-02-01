<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 쿠키 제거
	// → 비어있는 내용으로 기존의 쿠키를 덮어쓰기 하는 개념
	
	// 쿠키 생성 (서버에 생성되는 쿠키 객체)
	Cookie killCookie = new Cookie("cookie_test", "");
	
	// 쿠키 설정(서버에 생성된 쿠키에 대해 설정)
	killCookie.setMaxAge(0);
	
	// 클라이언트 쿠키 상자에 쿠키 추가(응답)
	response.addCookie(killCookie);
	//-- 처음 쿠키를 구성할 때에도 『addCookie()』로 처리하였기 때문에
	// 	 삭제할 때에도 『addCookie()』로 처리해야 안정적으로 삭제할 수 있다.
	//	 즉, 내용이 포함된 쿠키를 심었다가...
	// 	 이번에는 내용이 비어있는 쿠키를 덮어쓰기 하는 개념
	
	// ※ 여기서 쿠키 삭제는 클라이언트 입장에서의 삭제이다.
	// 	  한 명의 클라이언트가 쿠키를 삭제했다고 해서
	//	  다른 클라이언트들의 쿠키도 삭제되면 안되기 때문에
	//	  이 쿠킼의 정보는 로컬 PC 에서 컨트롤하게 된다.   (브라우저가...)
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestRemoveCookie.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>쿠키 정보 삭제하기</h1>
	<p>TestRemoveCookie.jsp</p>
	<hr>
</div>

<div>
	<a href="TestSetCookie.jsp"><button type="button" class="btn">쿠키 정보 설정</button></a>
	<a href="TestGetCookie.jsp"><button type="button" class="btn">쿠키 정보 확인</button></a>
</div>


</body>
</html>