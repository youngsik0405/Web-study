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
<script type="text/javascript">
	/* 
	function submitForm()
	{
		// 확인
		//alert("함수 호출 확인~!~!~!");
		
		var f = document.forms[0];
		
		if (f.userName.value == "")
		{
			alert("이름을 입력하세요");			
			return false;
		}
		
		f.submit();
	}
	*/
	
	function sendIt()
	{
		// 확인
		//alert("함수 호출 확인~!!!");
		
		var f = document.myForm;
		
		if (!f.name.value)
		{
			alert("이름을 입력해야 합니다~!!!");
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
	        , 성별(radio, 남/여)
	        , 이상형(check, 한가인, 강동원, 이준혁, 원지안, 이영지, 박보영, 양세찬, 박은빈)
	   - com.test.FriendDTO → Java Bean
	   - Friend_ok.jsp → 데이터 수신 → 객체 생성 → 결과화면 구성

-->
<!--
<div>
	<form action="Friend_ok.jsp" method="post">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" class="txt" name="userName">
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input type="num" class="txt" name="userAge">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="userGender" value="남자">남자</label>
					<label><input type="radio" name="userGender" value="여자" checked="checked">여자</label>
				</td>
			</tr>
			<tr>
				<th>이상형</th>
				<td>
					<label><input type="checkbox" name="userLover" value="한가인">한가인</label>
					<label><input type="checkbox" name="userLover" value="강동원">강동원</label>
					<label><input type="checkbox" name="userLover" value="이준혁">이준혁</label>
					<label><input type="checkbox" name="userLover" value="원지안">원지안</label>
					<label><input type="checkbox" name="userLover" value="이영지">이영지</label>
					<label><input type="checkbox" name="userLover" value="박보영">박보영</label>
					<label><input type="checkbox" name="userLover" value="양세찬">양세찬</label>
					<label><input type="checkbox" name="userLover" value="박은빈">박은빈</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="submitForm()"; class="btn control"
					style="width:100%">제출하기</button>
				</td>
			</tr>
		</table>
	</form>
</div>
-->


<div>
	<form action="Friend_ok.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td><input type="text" class="txt" name="name"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" class="txt" name="age"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="gender" id="male" value="남자">남자
					</label>
					<label><input type="radio" name="gender" id="female" value="여자">여자
					</label>
				</td>
			</tr>
			<tr>
				<th>이상형</th>
				<td>
					<label><input type="checkbox" name="idealType" id="t1" value="한가인">한가인</label>
					<label><input type="checkbox" name="idealType" id="t2" value="강동원">강동원</label>
					<label><input type="checkbox" name="idealType" id="t3" value="이준혁">이준혁</label>
					<label><input type="checkbox" name="idealType" id="t4" value="원지안">원지안</label>
					<br>                                
					<label><input type="checkbox" name="idealType" id="t5" value="이영지">이영지</label>
					<label><input type="checkbox" name="idealType" id="t6" value="박보영">박보영</label>
					<label><input type="checkbox" name="idealType" id="t7" value="양세찬">양세찬</label>
					<label><input type="checkbox" name="idealType" id="t8" value="박은빈">박은빈</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" style="width:100%; font-size: 16pt;"
					onclick="sendIt()">등록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>