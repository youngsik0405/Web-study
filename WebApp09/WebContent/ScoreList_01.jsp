<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 결과 String
	String str = "";

	// DB 연결
	Connection conn = DBConn.getConnection();

	// sql 준비 (select)
	String sql = "SELECT SID, NAME, KOR, ENG, MAT"
			   + ", (KOR + ENG + MAT) AS TOT, ROUND((KOR + ENG + MAT)/3, 1) AS AVG FROM TBL_SCORE"
			   + " ORDER BY SID";
	// 작업객체 준비
	Statement sttm = conn.createStatement();
	
	// sql 실행
	ResultSet rs = sttm.executeQuery(sql);
	
	str += "<table class='table'>";
	str += "<tr><th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th>";
	while (rs.next())
	{
		str += "<tr>";
		str += "<td>" + rs.getString("SID") + "</td>";
		str += "<td>" + rs.getString("NAME") + "</td>";
		str += "<td>" + rs.getInt("KOR") + "</td>";
		str += "<td>" + rs.getInt("ENG") + "</td>";
		str += "<td>" + rs.getInt("MAT") + "</td>";
		str += "<td>" + rs.getInt("TOT") + "</td>";
		str += "<td>" + rs.getDouble("AVG") + "</td>";
		str += "</tr>";
	}
	str += "</table>";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList_01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.msg {font-size:small; color:red; display:none;}
</style>
<script type="text/javascript">
	
	function formCheck()
	{
		var userName = document.getElementById("userName");
		//alert(userName);
		var nameMsg = document.getElementById("nameMsg");
		var scoreMsg = document.getElementById("scoreMsg");
		
		var userKor = document.getElementById("userKor");
		var userEng = document.getElementById("userEng");
		var userMat = document.getElementById("userMat");
		
		nameMsg.style.display = "none";
		scoreMsg.style.display = "none";
		
		if (userName.value == "" || userName.value == null)
		{
			nameMsg.style.display = "inline";
			return false;
		}
		
		if (userKor.value == "" || userEng.value == "" || userMat.value == "")
		{
			scoreMsg.style.display = "inline";
			return false;
		}
		
		var kor = Number(userKor.value);
		var eng = Number(userEng.value);
		var mat = Number(userMat.value);
	
		if ((kor < 0 || kor > 100) || (eng < 0 || eng > 100) || (mat < 0 || mat > 100))
		{
			scoreMsg.style.display = "inline";
			return false;
		}
		
		return true;
	}

</script>
</head>
<body>

<!-- 
	○ WebApp09
	
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
	     
	     번호		이름		국어점수 영어점수 수학점수   총점   평균
	      1			정승민			90		80		70		 xxx	xx.x	
	      2			박제훈			80		70		60		 xxx	xx.x
	      3			안석창			60		50		40		 xxx	xx.x
	      4			정영훈			40		30		20		 xxx	xx.x
	      
	     ---------------------------------------------------------------
	     
	○ 물리적 파일 구성
	
	   - WebApp09_scott.sql
	   - ScoreList.jsp
	   - ScoreInsert.jsp
	   - com.util.DBConn.java
	   
 -->
 
 <div>
 	<h1>데이터베이스 연결 및 데이터 처리</h1>
 	<hr>
 	<h2>성적 처리</h2>
 </div>
 
 <div>
 	<br>
 	<form action="ScoreInsert_01.jsp" method="post" onsubmit="return formCheck()">
 	<span id="nameMsg" class="msg">이름을 입력하세요!</span>
 	<span id="scoreMsg" class="msg">0 ~ 100 사이의 숫자를 입력하세요!!!</span>
 	<table class="table">
 		<tr>
 			<th>이름(*)</th>
 			<td><input type="text" name="userName" id="userName" class="txt"></td>
 		</tr>
 		<tr>
 			<th>국어점수</th>
 			<td><input type="text" name="userKor" id="userKor" class="txt" placeholder="0 ~ 100 사이 정수 입력"></td>
 		</tr>
 		<tr>
 			<th>영어점수</th>
 			<td><input type="text" name="userEng" id="userEng" class="txt" placeholder="0 ~ 100 사이 정수 입력"></td>
 		</tr>
 		<tr>
 			<th>수학점수</th>
 			<td><input type="text" name="userMat" id="userMat" class="txt" placeholder="0 ~ 100 사이 정수 입력"></td>
 		</tr>
 		<tr>
 			<td colspan="2">
 				<button type="submit" class="btn control">성적 입력</button>
 			</td>
 		</tr>
 	</table>
 	</form>
 </div>
 
 <div>
 <!-- DB에서 TBL_SCORE 조회한 결과 출력해줄 공간 -->
 <%=str %>
 </div>


</body>
</html>