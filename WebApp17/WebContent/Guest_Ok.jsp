<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>


<jsp:useBean id="ob" class="com.test.GuestDTO" scope="page"></jsp:useBean>

<jsp:setProperty property="*" name="ob"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_Ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>

<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<hr>
</div>

<!--  
	○ 물리적 파일 구성
	   - Guest.jsp → 작성자, 제목, 내용
	   - com.test.GuestDTO → Java Bean
	   - Guest_Ok.jsp → 데이터 수신 → 객체 생성 → 결과화면 구성
-->


<div>
	<h2>작성된 내용 확인</h2>

	<div>
		<h3>작성자 : <%=ob.getUserName() %></h3>
		<h3>제목 : <%=ob.getSubject() %></h3>
		<h3>내용</h3>
		<p><%=ob.getContent().replaceAll("\n", "<br>") %></p>
	</div>

</div>





<%-- 나의 풀이
<div>
	<form>
		<table class="table">
			<tr>
				<th>제목</th>
				<td>
					<%=ob.title() %>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<%=ob.userName() %>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<%=ob.content() %>
				</td>
			</tr>
		</table>
	</form>
</div> 
--%>


</body>
</html>