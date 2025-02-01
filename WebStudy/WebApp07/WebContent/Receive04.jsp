<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// 이전 페이지(→ Send04.html)로부터 넘어온 데이터 수신
	// → userId, userPw, userName, userTel, userGender, userCity, userSubject
	
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("userId");				//-- text
	String userPw = request.getParameter("userPw");				//-- password
	String userName = request.getParameter("userName");			//-- text
	String userTel = request.getParameter("userTel");			//-- text
	
	String userGender = request.getParameter("userGender");		//-- radio
	String userCity = request.getParameter("userCity");			//-- select
	
	//check~!!!
	//String userSubject = request.getParameter("userSubject");		//-- check

	String[] userSubjectArr = request.getParameterValues("userSubject");
	
	String subjectStr = "";
	
	if (userSubjectArr != null)
	{
		for (int i=0; i<userSubjectArr.length; i++)
		{
			subjectStr += "[" + userSubjectArr[i].toString() + "]";
				
		}
	}
	
	// ※ 추후에는... 수신된 데이터를 쿼리문을 통해 DB에 입력하는
	// 	  처리 과정 등이 포함될 수 있음을 염두하며 작업을 진행할 수 있도록 하자.
/* 
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String genderStr = request.getParameter("gender");
	String city = request.getParameter("city");
	String[] subArr = request.getParameterValues("sub");
	
	String gender = "";
	
	if(genderStr.equals("W"))
		gender = "여자";
	else if(genderStr.equals("M"))
		gender = "남자";
	else
		gender = "성별 확인 불가";
	
	String sub = "";
	if (subArr != null)
	{
		for (String item : subArr)
		{
			sub += "[" + item + "]";
		}
	}
*/
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
	<h2>가입 승인 내역</h2>

	<p>아이디 : <%=userId %></p>

	<p>패스워드 : <%=userPw %></p>
	
	<p>이름 : <%=userName %></p>
	
	<p>전화번호 : <%=userTel %></p>
	
	<p>성별 : <%=userGender %></p>
	
	<p>지역 : <%=userCity %></p>
	
	<p>수강과목 : <%=subjectStr %></p>


<%-- 나의 풀이
	아이디 : <%=id %><br>
	이름 : <%=name %><br>
	전화번호 : <%=tel %><br>
	성별 : <%=gender %><br>
	지역 : <%=city %><br>
	수강과목 : <%=sub %><br>
 --%>
</div>


</body>
</html>