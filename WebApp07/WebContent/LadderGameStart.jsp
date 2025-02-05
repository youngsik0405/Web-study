<%@page import="java.util.Random"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//ladderGameStart.jsp
	//이전 페이지(→ ladderGame.jsp)로부터 넘어온 데이터 수신
	// → num
	String numStr = request.getParameter("num");
	String numStrResult = "<td><input type='text' name='num' id='numStr' readOnly='readOnly' value='" + numStr + "'></td>";
	String peopleStr = "";
	String resultStr = "";
	String vertiStr = "";
	String tableStr = "";
	
	//이전 페이지(→ ladderGameStart.jsp)
	
	int num = 0;
	
	try
	{
		num = Integer.parseInt(numStr);
		
		for(int i=0; i<num; i++)
		{
			peopleStr += "<td><input type='text' name='name" + "' placeholder='이름 입력'></td>";
			vertiStr += "<td>│</td>";
			resultStr += "<td><input type='text' name='action" + "' placeholder='행동 입력'></td>";
		}
		
		tableStr = "<div><form action='LadderGameResult.jsp' method='post'><table>"
					+ "<tr>" + numStrResult + "</tr>"
					+ "<tr>" + peopleStr + "</tr>"
					+ "<tr>" + vertiStr + "</tr>"
					+ "<tr>" + resultStr + "</tr></table>"
					+ "<button type='submit' class='btn control'>게임 스타트</button></form></div>";
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LadderGameResult.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	table {text-align: center;}
	input {text-align: center;}
	#numStr {display: none;}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>

<div>
	<h1>게임 세팅 화면~~~</h1>
	<hr>
</div>
<%=tableStr %>
</body>
</html>
