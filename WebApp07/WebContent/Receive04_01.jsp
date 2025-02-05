<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로(→ Send04_01.html)로부터 넘어온 데이터 수신
	// → id, pwd, tel, gender, city, subject(다중선택)
	
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String tel = request.getParameter("tel");
	String gender = request.getParameter("gender");
	String city = request.getParameter("city");
	String[] subjectArr = request.getParameterValues("subject");
	
	String genderStr = "성별 확인 불가";
	if (gender.equals("F"))
		genderStr = "여자";
	else if (gender.equals("M"))
		genderStr = "남자";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04_01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>♡~~환영합니다~~♡</h1>
	<hr>
</div>

<div>
	아이디 : <%=id %><br>
	비밀번호 : <%=pwd %><br>
	전화번호 : <%=tel %><br>
	성별 : <%=gender %><br>
	지역 : <%=city %><br>
	수강과목 : <% if(subjectArr != null)
				  {
					for (int i=0; i<subjectArr.length; i++)
					{ 
						out.print("[" + subjectArr[i] + "] ");
				  	}
				  }
				  else
				  	out.print("수강과목이 없습니다.");%>
			
</div>

</body>
</html>