<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();

	ScoreDAO dao = null;
	
	String scorecount = "<span id='scorecount'>전체 인원 수 : ";
	
	try
	{
		dao = new ScoreDAO();
		
		scorecount += dao.count() + "명</span>";
		
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th>");
		
		for (ScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td class='record'>" + score.getSid() + "</td>");
			str.append("<td class='record'>" + score.getName() + "</td>");
			str.append("<td class='record'>" + score.getKor() + "</td>");
			str.append("<td class='record'>" + score.getEng() + "</td>");
			str.append("<td class='record'>" + score.getMat() + "</td>");
			str.append("<td class='record'>" + score.getTot() + "</td>");
			str.append("<td class='record'>" + score.getAvg() + "</td>");
			str.append("</tr>");
		}
		str.append("</table>");
		
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
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	button {width: 280px; height: 50px; font-weight: bold;}
	.errMsg {font-size: small; color: red; display: none;}
	.record {text-align: center;}
</style>



<script type="text/javascript">

	function formCheck()
	{
		var userName = document.getElementById("userName");
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		
		var nameMsg = document.getElementById("nameErr");
		var korMsg = document.getElementById("korErr");
		var engMsg = document.getElementById("engErr");
		var matMsg = document.getElementById("matErr");
		
		nameMsg.style.display = "none";
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if (userName.value == "")
		{
			nameMsg.style.display = "inline";
			userName.focus();
			return false;
		}
		
		if (kor.value == "" || (kor.value < 0 || kor.value > 100))
		{
			korMsg.style.display = "inline";
			kor.focus();
			return false;
		}
		if (eng.value == "" || (eng.value < 0 || eng.value > 100))
		{
			engMsg.style.display = "inline";
			eng.focus();
			return false;
		}
		if (mat.value == "" (mat.value < 0 || mat.value > 100))
		{
			matMsg.style.display = "inline";
			mat.focus();
			return false;
		}
		
		return true;
		
	}
</script>


</head>
<body>

<!-- 
	○ WebApp11
	
	   - 여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
	     총점과 평균을 계산하여 출력해 줄 수 있는 프로그램을 구현한다.
	   - 리스트 출력시 번호 오름차순으로 정렬하여 처리할 수 있도록 한다.
	   - 데이터베이스 연동하여 처리한다.
	     (TBL_SCORE, SCORESEQ 활용)
	   - 즉, 성적 처리 프로그램을 데이터 연동하여
	     JSP로 구성할 수 있도록 한다.
	     
	     데이터베이스 연결 및 데이터 처리 
	     ----------------------------------------------------------------
	     성적 처리
	     
	     이름(*)	[ textbox ]	→ 이름 입력 처리
	     국어점수	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	     영어점수	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	     수학점수	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
		
		 < 성적 데이터 추가 > → button
		 
		 
		 전체 인원 수 : 4명
		 -----------------------------------------------------------------
		 번호		이름 		국어점수  영어점수  수학점수  총점  평균
		 1			정승민		   90		80			70	   xxx   xx.x
		 2			박제훈		   80		70			60	   xxx   xx.x
		 3			안석창		   60		50			40	   xxx   xx.x
		 4			정영훈		   40		30			20	   xxx   xx.x
		 -----------------------------------------------------------------
		 
		 
		 -----------------------------------------------------------------
		 
		 ○ 물리적 파일 구성
		 
		 - WebApp11_scott.sql
		 - com.test.ScoreDTO.java
		 - com.test.ScoreDAO.java
		 - ScottList.jsp
		 - ScoreInsert.jsp
		 - com.util.DBConn.java
-->

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt">
					<span class="errMsg" id="nameErr">이름을 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="kor" name="kor" class="txt">
					<span class="errMsg" id="korErr">0 ~ 100 사이의 정수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="eng" name="eng" class="txt">
					<span class="errMsg" id="engErr">0 ~ 100 사이의 정수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="mat" name="mat" class="txt">
					<span class="errMsg" id="matErr">0 ~ 100 사이의 정수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn" id="btnAdd">데이터 추가</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<br><br>

<div>
	<%=scorecount %>
	<%=str.toString() %>
</div>


</body>
</html>