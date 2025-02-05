<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LadderGame.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	* {text-align: center;}
	input {font-family: 나눔고딕코딩;}
	#num {border-radius: 20%; width:150px}
	#numMsg {font-size: small; color: red; display: none;}
</style>
<script type="text/javascript">

	function formCheck()
	{
		// 확인
		//alert("함수 호출 확인~!!!");
		
		var num = document.getElementById("num");
		var numMsg = document.getElementById("numMsg");
		
		numMsg.style.display = "none";
				
		if (num.value == "")
		{
			numMsg.style.display = "inline";
			return false;
		}
		
		return true;
	}

</script>


</head>
<body>

<div>
	<h1>☞ 사다리 게임 ☜</h1>
	<hr>
</div>

<div>
	<form action="LadderGameStart.jsp" method="get" onsubmit="return formCheck()">
		<h2>참가인원 : <input type="number" name="num" id="num" placeholder="ex)숫자만 입력" min="2"> 명</h2>
		<p id="numMsg">참가인원 수를 입력해주세요!!!</p>
		<br>
		<button type="submit" class="btn control">게임 만들기~~</button>
	</form>
</div>


</body>
</html>