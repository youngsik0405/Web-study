<%@page import="java.util.Random"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//ladderGameResult.jsp
	//이전 페이지(→ ladderGameStart.jsp)로부터 넘어온 데이터 수신
	// → num, name(배열로 받기), action(배열로 받기)
	request.setCharacterEncoding("UTF-8");
	String numStr = request.getParameter("num");
	String numStrResult = "<td><input type='text' name='num' id='numStr' readOnly='readOnly' value='" + numStr + "'></td>";
	
	String peopleStr = "";
	String resultStr = "";
	String vertiStr = "";
	String tableStr = "";
	
	//이전 페이지(→ ladderGameStart.jsp)
	
	String[] nameArr = request.getParameterValues("name");
	String[] actionArr = request.getParameterValues("action");
	
	int num = 0;
	
	
	try
	{
		num = Integer.parseInt(numStr);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	
	//랜덤 인스턴스 생성
	Random rd = new Random();
	int r = 0;
	String temp = "";
	
	// actionArr의 순서 섞기(랜덤 지정)
	for(int i=0; i<actionArr.length; i++)
	{
		// 랜덤 인덱스 생성
		r = rd.nextInt(actionArr.length-1);
		
		// 자리 바꾸기
		temp = actionArr[i];
		actionArr[i] = actionArr[r];
		actionArr[r] = temp;
	}
	
	for(int i=0; i<nameArr.length; i++)
	{
		peopleStr += "<td><input type='text' name='name" + "' value='" + nameArr[i] + "'></td>";
		vertiStr += "<td>│</td>";
		resultStr += "<td><input type='text' name='action" + "' value='" + actionArr[i] + "'></td>";
	}
	
	tableStr = "<div><form action='' method='post'><table>"
			+ "<tr>" + numStrResult + "</tr>"
			+ "<tr>" + peopleStr + "</tr>"
			+ "<tr>" + vertiStr + "</tr>"
			+ "<tr>" + resultStr + "</tr></table>"
			//+ "<button type='submit' class='btn control'>새 게임</button></form></div>"
			+ "<button type='submit' class='btn control' onclick='this.form.action='LadderGameResult.jsp' class='newGame'>다시 하기</button></form>"
			
			+ "<form action='LadderGame.jsp' method='post'><button type='submit' class='newGame'>새 게임</button></form></div>";


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
	.newGame {width:420px;}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>

<div>
	<h1>게임 결과 화면~~~</h1>
	<hr>
</div>

<%=tableStr %>
</body>
</html>