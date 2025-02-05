<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="ob" class="com.test.FriendDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ob" />

<!-- check~!!! -->
<!-- 다중 선택으로 넘어온 결과값 처리 → 반복문 구성 -->
<!-- 배열은 꼭 null 체크해야함!! -->
<%
	String str = "";
	if (ob.getIdealType() != null)
	{
		for (String temp : ob.getIdealType())
		{
			str += temp + " ";
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<!-- 내용 -->
	<!-- <h2>이름 : 정영훈</h2> -->
	<h2>이름 : <%=ob.getName() %></h2>
	
	<!-- <h2>나이 : 53</h2> -->
	<h2>나이 : <%=ob.getAge() %></h2>
	
	<!-- <h2>성별 : 남자</h2> -->
	<h2>성별 : <%=ob.getGender() %></h2>
	
	<!-- <h2>이상형 : 강동원 이준혁</h2> -->
	<h2>이상형 : <%=str %></h2>
</div>

</body>
</html>