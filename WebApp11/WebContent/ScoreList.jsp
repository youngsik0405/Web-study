<%@page import="java.util.ArrayList"%>
<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	ScoreDAO dao = null;
	StringBuffer str = new StringBuffer();
	String inwonStr = "<span id='membercount'>전체 인원 수 : ";
	
	// 인원 수 변수 count;
	int count = 0;
	try
	{
		dao = new ScoreDAO();
		
		count = dao.count();
		
		inwonStr += count + "명</span>";
		
		
		str.append("<table class='table'>");
		str.append("<tr>");
		str.append("<th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th>");
		str.append("</tr>");
		
		for (ScoreDTO member : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>" + member.getSid() + "</td>");
			str.append("<td>" + member.getName() + "</td>");
			str.append("<td>" + member.getKor() + "</td>");
			str.append("<td>" + member.getEng() + "</td>");
			str.append("<td>" + member.getMat() + "</td>");
			str.append("<td>" + member.getTot() + "</td>");
			str.append("<td>" + member.getAvg() + "</td>");
			str.append("</tr>");
		}
		
		str.append("</table>");
		
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.record {text-align: center;}
	input {width: 200px; border-raius: 6px;}
	button {width: 380px; height: 40px; font-family: 맑은 고딕; font-weight: bold;}
	.errMsg {font-size: small; color: red; display: none;}
	.inputTh {width: 140px;}
</style>
<script type="text/javascript">

	function formCheck()
	{
		// 확인
		//alert("함수 호출 확인~!!!");
		
		var userName = document.getElementById("userName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		if (userName.value == "")
		{
			nameMsg.style.display = "inline";
			userName.focus();
			return false;
		}
		
		/*
		var kor = Number(document.getElementById("userKor").value);
		var eng = Number(document.getElementById("userEng").value);
		var mat = Number(document.getElementById("userMat").value);
		
		if (kor < 0 || kor > 100 || eng < 0 || eng > 100 || mat < 0 || mat > 100)
		{
			alert("점수는 0 ~ 100 사이의 수만 입력할 수 있습니다.");
			return false;
			
		}
		*/
		
		var userKor = document.getElementById("userKor");
		var korMsg = document.getElementById("korMsg");
		
		var userEng = document.getElementById("userEng");
		var engMsg = document.getElementById("engMsg");
		
		var userMat = document.getElementById("userMat");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if (userKor.value == "" || Number(userKor.value) < 0 || Number(userKor.value) > 100)
		{
			korMsg.style.display = "inline";
			//userKor.value = "";		//입력한 값을 지우고
			//userKor.focuse();			//해당 칸에 focus하게 하니.. null값이 DB로 입력된다! 왤까?
			return false;
		}
		if (userEng.value == "" || Number(userEng.value) < 0 || Number(userEng.value) > 100)
		{
			engMsg.style.display = "inline";
			//userEng.value = "";
			//userEng.focuse();
			return false;
		}
		if (userMat.value == "" || Number(userMat.value) < 0 || Number(userMat.value) > 100)
		{
			matMsg.style.display = "inline";
			//userMat.value = "";
			//userMat.focuse();
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
	     총점과 평균을 계산하여 출력해줄 수 있는 프로그램을 구현한다.
	   - 리스트 출력 시 번호 오름차순으로 정렬하여 처리할 수 있도록 한다.
	   - 데이터베이스 연동하여 처리한다.
	     (TBL_SCORE, SCORESEQ 활용)
	   - 즉, 성적 처리 프로그램을 데이터베이스 연동하여
	     JSP로 구성할 수 있도록 한다.
	     
	     데이터베이스 연결 및 데이터 처리
	     ---------------------------------------------------------------
	     성적 처리
	     
	     이름(*)	[ textbox ] → 이름 입력 확인
	     국어점수	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	     영어점수	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	     수학점수	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	     
	     < 성적 데이터 추가 >	→ button
	     
	     전체 인원 수 : 4명
	     ---------------------------------------------------------------
	     번호		이름		국어점수 영어점수 수학점수   총점   평균
	      1			정승민			90		80		70		 xxx	xx.x	
	      2			박제훈			80		70		60		 xxx	xx.x
	      3			안석창			60		50		40		 xxx	xx.x
	      4			정영훈			40		30		20		 xxx	xx.x
	     ---------------------------------------------------------------
	     
	     ---------------------------------------------------------------------------------
	     
	     
	○ 물리적 파일 구성
	
	   - WebApp11_scott.sql
	   - com.test.ScoreDTO.java
	   - com.test.ScoreDAO.java
	   - ScoreList.jsp
	   - ScoreInsert.jsp
	   - com.util.DBConn.java
	   
 -->
 
<div>
	<h1>데이터베이스 연동 점수관리 실습</h1>
	<p>DAO, DTO 개념 적용</p>
	<hr>
</div>

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table class="table">
			<tr>
				<th class="inputTh">이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th class="inputTh">국어점수</th>
				<td>
					<input type="text" id="userKor" name="userKor" class="txt">
					<span class="errMsg" id="korMsg">0 ~ 100 사이의 국어점수를 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th class="inputTh">영어점수</th>
				<td>
					<input type="text" id="userEng" name="userEng" class="txt">
					<span class="errMsg" id="engMsg">0 ~ 100 사이의 영어점수를 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th class="inputTh">수학점수</th>
				<td>
					<input type="text" id="userMat" name="userMat" class="txt">
					<span class="errMsg" id="matMsg">0 ~ 100 사이의 수학점수를 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn" id="btnAdd">점수 추가</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<br><br>
<div>
	<form action="ScoreDelete.jsp" method="get" onsubmit="return sidCheck()">
		<table class="table">
			<tr>
				<th class="inputTh">학번(*)</th>
				<td>
					<input type="text" id="userSid" name="userSid" class="txt">
					<span class="errMsg" id="sidMsg">학번을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn" id="btnAdd">점수 삭제</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<br><br>


<div>
<!-- DB에서 조회한 테이블 여기에 표시할 예정 -->
<%=inwonStr %>
<%=str.toString() %>
</div>
 
 
</body>
</html>