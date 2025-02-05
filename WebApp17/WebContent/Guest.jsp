<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	
	function sendIt()
	{
		// 확인
		//alert("함수 호출 확인~!!!");
		
		var f = document.myForm;
		
		//		:
		// 체크 및 검증할 내용의 코드 작성...
		//		:
			
		f.submit();
		
	}
</script>
</head>
<body>

<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<hr>
</div>

<!--  
	○ 물리적 파일 구성
	   - Guest.jsp → 작성자, 제목, 내용
	   - com.test.GuestDTO → Java Bean
	   - Guest_ok.jsp → 데이터 수신 → 객체 생성 → 결과화면 구성

-->
<!-- 
<div>
	<form action="Guest_ok.jsp" method="post">
		<table class="table">
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="uName"/>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="uTitle"/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="10" cols="50" name="uText"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn control" style="width: 450px; height:40px;">작성하기</button>
				</td>
			</tr>
		</table>
	</form>
</div>
-->
<div>
	<form action="Guest_ok.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" class="txt" name="userName"/>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" class="txt" name="subject"/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="5" cols="32" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="sendIt()" class="btn control"
					 style="width: 100%">작성하기</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>