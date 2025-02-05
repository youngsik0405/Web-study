<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ page buffer="8kb" autoFlush="true"%> 는 default 설정 내용 --%>
<%-- line3 구문 서버쪽 오류 500 떠야하는데 왜 오류 안 뜨고 잘 실행되지? ;;ㅎㅎ --%>
<%-- 임시로 저장되는 버퍼 용량을 1kb로 줄이고, 다 채워져도 자동으로 내보내지 마. --> 1kb는 1234가 천 번 담길 크기가 안 되니까 에러 뜸 --%>
<%-- <%@ page buffer="1kb" autoFlush="false"%> 일 경우 에러 발생 --%>
<%-- <%@ page buffer="10kb" autoFlush="false"%> 일 경우 정상 처리 --%>
<%-- <%@ page buffer="1kb" autoFlush="true"%> 일 경우 정상 처리 --%>


<%-- <%@ page buffer="0.1kb" autoFlush="false"%> 이렇게 하니까 드디어 에러 발생 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test001.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>

<div>
	<h1>page 디렉티브</h1>
	<p>buffer 속성 및 autoFlush 실습</p>
	<hr>
</div>

<div>
	<h2>반복문 구성</h2>
	
	<%
	for (int i=1; i<=100; i++)
	{
	%>1234<%
	}
	%>
</div>

</body>
</html>