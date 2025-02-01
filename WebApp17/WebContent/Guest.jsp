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
		// 체크 및 검증할 내용의 코드 작성
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
	   - Guest_Ok.jsp → 데이터 수신 → 객체 생성 → 결과화면 구성
-->

<div>
	<form action="Guest_Ok.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="userName" class="txt">	
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" class="txt">	
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" cols="32" rows="5"></textarea>	
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="sendIt()" class="btn control" style="width: 100%;">방명록 작성</button>
				</td>
			</tr>
		</table>
	</form>
</div>




<!-- 나의 풀이
<div>
	<form action="Guest_Ok.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="userName" class="txt">	
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" class="txt">	
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" cols="30" rows="10"></textarea>	
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn control" style="width: 35%;">확인</button>
				</td>
			</tr>
		</table>
	</form>
</div>
-->

</body>
</html>