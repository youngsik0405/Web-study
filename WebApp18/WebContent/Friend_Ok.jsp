<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="ob" class="com.test.FriendDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!-- check~!!! -->
<!-- 다중 선택으로 넘어온 결과값 처리 → 반복문 구성 -->
<%
	String type = "";

	if (ob.getType() != null)
	{
		for (String str : ob.getType())
		{
			type += str + " ";
		}
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
*
{
	font-family : 맑은 고딕;
	color : #343;
	text-align: center;
}
.table
{
	border-collapse: collapse;
	width: 50%;
	margin : auto;
}
.table th, .table td
{
	padding: 3px;
	line-height: 150%;
	text-align: center;
}
.table td
{
	padding: 3px;
	line-height: 150%;
	text-align: left;
}
.table th
{
	font-weight: bold;
	background-color: #D9E5FF;
	color : #745fe8;
}
.btn
{
	font-weight: bold;
	background-color: #c5b8fe;
	color : white;
	border: #c5b8fe;
	border-radius: 50px;
}
.btn:hover
{
	color: white;
	background-color: #9f93c7;
	border: #9f93c7;
}
</style>
</head>
<body>

<div>
	<h1>등록 수신결과 확인</h1>
	<hr>
</div>

<div>
	<!-- 내용 -->
	<!-- <h2>이름 : 정영훈</h2> -->
	<h2>이름 : <%=ob.getName() %></h2>
	<!-- <h2>나이 : 53</h2> -->
	<h2>나이 : <%=ob.getAge() %></h2>
	<!-- <h2>성별 : 남자</h2> -->
	<h2>성별 : <%=ob.getGender() %></h2>
	<!-- <h2>이상형 : 강동원 이준혁</h2> -->
	<h2>이상형 : <%=type %></h2>	
</div>

</body>
</html>