<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	*
	{
		font-family : 맑은 고딕;
		text-align: center;
	}
	.table
	{
		border-collapse: collapse;
		width: 50%;
		margin : auto;
	}
	.table th, .table td
	{
		padding: 3px;
		line-height: 150%;
		text-align: center;
	}
	.table td
	{
		padding: 3px;
		line-height: 150%;
		text-align: left;
	}
	.table th
	{
		font-weight: bold;
		background-color: #D9E5FF;
		color : #745fe8;
	}
	.btn
	{
		font-weight: bold;
		background-color: #D9E5FF;
		color : #745fe8;
		border: #c5b8fe;
		border-radius: 50px;
	}
	.btn:hover
	{
		color: white;
		background-color: #9f93c7;
		border: #9f93c7;
	}
</style>



<script type="text/javascript">
	
	function sendIt()
	{
		var f = document.myForm;
		
		if (!f.name.value)
		{
			alert("이름을 입력하세요.");
			f.name.focus();
			return;
		}
		
		f.submit();
		
	}
</script>


</head>
<body>

<div>
	<h1>데이터 입력</h1>
	<hr>
</div>

<!--  
	○ 물리적 파일 구성
	   - Friend.jsp 
	   	 → 이름(*), 나이
	   	    , 성별(radio 남/여)
	   	    , 이상형(check, 한가인, 강동원, 이준혁, 원지안, 이영지, 박보영, 양세찬, 박은빈)
	   - com.test.FriendDTO → Java Bean
	   - Friend_Ok.jsp → 데이터 수신 → 객체 생성 → 결과화면 구성
-->

<div>
	<form action="Friend_Ok.jsp" method="post" id="myForm">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" name="name" class="txt">
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input type="text" name="age" class="txt">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="gender" id="male" value="남자">남자</label>
					<label><input type="radio" name="gender" id="female" value="여자">여자</label>
				</td>
			</tr>
			<tr>
				<th>이상형</th>
				<td>
					<label><input type="checkbox" name="type" id="check1" value="한가인">한가인</label>
					<label><input type="checkbox" name="type" id="check2" value="강동원">강동원</label>
					<label><input type="checkbox" name="type" id="check3" value="이준혁">이준혁</label>
					<label><input type="checkbox" name="type" id="check4" value="원지안">원지안</label>
					<br>
					
					<label><input type="checkbox" name="type" id="check5" value="이영지">이영지</label>
					<label><input type="checkbox" name="type" id="check6" value="박보영">박보영</label>
					<label><input type="checkbox" name="type" id="check7" value="양세찬">양세찬</label>
					<label><input type="checkbox" name="type" id="check8" value="박은빈">박은빈</label>
				</td>
			</tr>
		</table>
		<br>
		<button type="button" onclick="sendIt()" class="btn control" style="width: 200px; height: 30px;">확인</button>
	</form>
</div>



</body>
</html>