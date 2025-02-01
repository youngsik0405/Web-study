<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckArea.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {color: red; font-weight: bold;}
</style>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<p><span>CheckArea.jsp</span> → CheckAreaOk.jsp</p>
	<hr>
</div>

<div>
	<h2>textarea, check 데이터 전송</h2>
	
	<form action="CheckAreaOk.jsp" method="post">
		이름
		<input type="text" class="txt" name="name">
		<br><br>
		
		메모<br>
		<textarea rows="5" cols="30" name="memo"></textarea>
		<br><br>
		
		이상형<br>
		<label><input type="checkBox" value="송가인" name="checkGroup">송가인</label>
		<label><input type="checkBox" value="강동원" name="checkGroup">강동원</label>
		<label><input type="checkBox" value="이준혁" name="checkGroup">이준혁</label>
		<label><input type="checkBox" value="아이유" name="checkGroup">아이유</label>
		<br>
		
		<label><input type="checkBox" value="안유진" name="checkGroup">안유진</label>
		<label><input type="checkBox" value="박보영" name="checkGroup">박보영</label>
		<label><input type="checkBox" value="이동욱" name="checkGroup">이동욱</label>
		<label><input type="checkBox" value="박은빈" name="checkGroup">박은빈</label>
		<br><br>
		
		<input type="submit" value="결과 확인" class="btn control" style="width: 200px;">
		
	</form>
	
</div>



</body>
</html>