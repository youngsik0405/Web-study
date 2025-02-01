<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String str = "";

	Connection conn = DBConn.getConnection();
	
	String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG FROM TBL_SCORE ORDER BY SID";
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	str += "<table>";
	str += "<tr>";
	str += "<th id='numTitle'>번호</th>";
	str += "<th id='nameTitle'>이름</th>";
	str += "<th id='korTitle'>국어점수</th>";
	str += "<th id='engTitle'>영어점수</th>";
	str += "<th id='matTitle'>수학점수</th>";
	str += "<th id='totTitle'>총점</th>";
	str += "<th id='avgTitle'>평균</th>";
	str += "</tr>";
	
	while (rs.next())
	{
		str += "<tr>";
		str += "<td class='list'>" + rs.getString("SID") + "</td>";
		str += "<td class='list'>" + rs.getString("NAME") + "</td>";
		str += "<td class='list'>" + rs.getString("KOR") + "</td>";
		str += "<td class='list'>" + rs.getString("ENG") + "</td>";
		str += "<td class='list'>" + rs.getString("MAT") + "</td>";
		str += "<td class='list'>" + rs.getString("TOT") + "</td>";
		str += "<td class='list'>" + rs.getString("AVG") + "</td>";
		str += "</tr>";
	}
	
	str += "</table>";
	
	rs.close();
	stmt.close();
	DBConn.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	button {width: 208px; height: 50px; font-weight: bold;}
	#numTitle {width: 50px;}
	#nameTitle {width: 100px;}
	#korTitle {width: 80px;}
	#engTitle {width: 80px;}
	#matTitle {width: 80px;}
	#totTitle {width: 80px;}
	#avgTitle {width: 80px;}
	.errMsg {font-size: small; color: red; display: none;}
	.list {text-align: center;}
</style>

<script type="text/javascript">

	function formChange() 
	{
	    var name = document.getElementById("name");
	    var kor = document.getElementById("kor");
	    var eng = document.getElementById("eng");
	    var mat = document.getElementById("mat");
	
	    var nameErr = document.getElementById("nameErr");
	    var korErr = document.getElementById("korErr");
	    var engErr = document.getElementById("engErr");
	    var matErr = document.getElementById("matErr");
	
	    nameErr.style.display = "none";
	    korErr.style.display = "none";
	    engErr.style.display = "none";
	    matErr.style.display = "none";
	    
	    if(name.value == "") 
	    {
	        nameErr.style.display = "inline";
	        return false;
	    }
	    if (kor.value == "" || (kor.value < 0 || kor.value > 100)) 
	    {
	        korErr.style.display = "inline";
	        return false;
	    }
	    if (eng.value == "" || eng.value < 0 || eng.value > 100) 
	    {
	        engErr.style.display = "inline";
	        return false;
	    }
	    if (mat.value == "" || mat.value < 0 || mat.value > 100) 
	    {
	        matErr.style.display = "inline";
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
		 
		 번호		이름 		국어점수  영어점수  수학점수  총점  평균
		 1			정승민		   90		80			70	   xxx   xx.x
		 2			박제훈		   80		70			60	   xxx   xx.x
		 3			안석창		   60		50			40	   xxx   xx.x
		 4			정영훈		   40		30			20	   xxx   xx.x
		 
		 ----------------------------------------------------------------
		 
		 ○ 물리적 파일 구성
		 
		 - WebApp09_scott.sql
		 - ScottList.jsp
		 - ScoreInsert.jsp
		 - com.util.DBConn.java
-->

<div>
	<h2>성적 처리</h2>
</div>

<div>
	<form action="ScoreInsert.jsp" method="get" onsubmit="return formChange()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="name" name="name" class="txt">
					<span class="errMsg" id="nameErr">이름을 입력해 주세요.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" name="kor" id="kor" class="txt">
					<span class="errMsg" id="korErr">0 ~ 100 사이의 정수를 입력해 주세요.</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" name="eng" id="eng" class="txt">
					<span class="errMsg" id="engErr">0 ~ 100 사이의 정수를 입력해 주세요.</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" name="mat" id="mat" class="txt">
					<span class="errMsg" id="matErr">0 ~ 100 사이의 정수를 입력해 주세요.</span>
				</td>
			</tr>
		</table>
		<br><br>
		<button type="submit" class="btn">성적 데이터 추가</button>	
	</form>
	<br><br>
	
	
	<%=str %>
</div>

</body>
</html>