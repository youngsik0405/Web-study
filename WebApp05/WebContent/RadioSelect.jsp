<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {color: red; font-weight: bold;}
</style>

</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<p><span>RadioSelect.jsp</span> → RadioSelectOk.jsp</p>
	<hr>
</div>

<div>
	<h2>radio, select 데이터 전송</h2>
	
	<!-- ※ <form> 구성 -->
	<form action="RadioSelectOk.jsp" method="post">
		이름
		<!-- name 속성 구성 → name -->
		<input type="text" class="txt" name="name">
		<br><br>
		
		성별
		<!-- name 속성 구성 → gender -->
		<label><input type="radio" value="M" name="gender">남자</label>
		<label><input type="radio" value="F" name="gender">여자</label>
		<br><br>
		
		전공
		<!-- name 속성 구성 → major -->
		<select name="major">
			<option value="국문학">국문학</option>
			<option value="영문학">영문학</option>
			<option value="컴퓨터공학">컴퓨터공학</option>
			<option value="수학">수학</option>
			<option value="신문방송학">신문방송학</option>
			<option value="경영학">경영학</option>
		</select>
		<br><br>
		
		취미
		<!-- name 속성 구성 → hobby -->
		<select size="7" multiple="multiple" name="hobby">
			<option value="영화감상">영화감상</option>
			<option value="음악감상">음악감상</option>
			<option value="배낭여행">배낭여행</option>
			<option value="공원산책">공원산책</option>
			<option value="스노클링">스노클링</option>
			<option value="암벽등반">암벽등반</option>
			<option value="종이접기">종이접기</option>
		</select>
		<br><br>
		
		<!-- submit 액션 수행 -->
		<input type="submit" value="내용 전송" class="btn control"> 
		
		
	</form>

</div>




</body>
</html>