<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">

	/*
	function formSubmit()
	{
		var f = document.nameTelForm;
		
		if (!f.userName.value)
		{
			alert("이름을 입력하세요!!");
			f.userName.focus();
			return;
		}
		if (!f.userTel.value)
		{
			alert("전화번호를 입력하세요!!!!");
			f.userTel.focus();
			return;
		}
		
		f.submit();
	}
	*/
	
	function sendIt()
	{
		// 확인
		//alert("함수 호출 확인~!~!~!");
		
		//name도 id도 붙이지 않은 form 가져오기
		var f = document.forms[0];
		
		if (!f.userName.value)
		{
			alert("이름을 입력해야 합니다~!!!");
			f.userName.focus();
			return;
		}
		
		if (!f.userTel.value)
		{
			alert("전화번호를 입력해야 합니다~!!!");
			f.userTel.focus();
			return;
		}
		
		f.submit();
		
		
	}
</script>
</head>
<body>

<!-- 
	○ TestSession01.jsp 에서 TestSession02.jsp 로
	   이름과 전화번호를 입력받아 전송
	   
	   TestSession02.jsp 에서 TestSession03.jsp 로
	   아이디와 패스워드를 입력받고
	   앞에서 전달받은 이름과 전화번호를 함께 전송
	   
	   TestSession03.jsp 에서
	   전달받은 이름, 전화번호, 아이디, 패스워드 출력
	   
	   01 ────────→ 02 ────────→ 03
	   이름, 전화	   		 아이디, 패스워드	   이름, 전화, 아이디, 패스워드	
	   입력			   		 입력				   출력
	   
	   
	※ 즉, 01 에서 02 로 넘겨받을 때에는 getParameter
	   02 에서 03 으로 넘겨받을 때에는 getParameter 와 getAttribute 로 세션 활용
	   01 에서 03 으로 직접 넘겨줄 수 없기 때문에 세션(session)에 저장
	   

	※ session 외에 input type hidden 속성을 이용한 정보 전달도 가능~!!!	   

 -->
<!--  
 <div>
 	<h1>◐ 세션Session 실습 ◑</h1>
 	<hr>
 </div>
 <div>
 	<form action="TestSession02.jsp" method="post" name="nameTelForm">
 		<p>이름 <input type="text" class="txt" name="userName"></p>
 		<p>전화 <input type="tel" class="txt" name="userTel"></p>
 		<a>
 			<button type="button" class="btn" style="margin-left: 210px;" onclick="javascript:formSubmit()">입력</button>
 		</a>
 	</form>
 </div>
  -->
  
 <div>
 	<h1>TestSession01.jsp</h1>
 	<p>이름과 전화번호</p>
 	<hr>
 </div>
  
 <!--  div>form>table.table>(tr>th{이름}+td>input#userName.txt)*3 -->
<div>
  	<form action="TestSession02.jsp" method="post">
  		<table class="table">
  			<tr>
  				<th>이름</th>
  				<td>
  					<input type="text" name="userName" class="txt">
  				</td>
  			</tr>
  			<tr>
  				<th>전화번호</th>
  				<td>
  					<input type="text" name="userTel" class="txt">
  				</td>
  			</tr>
  			<tr>
  				<td colspan="2">
  					<button type="button" class="btn" onclick="sendIt()"
  					style="width: 400px; height: 40px; font-size: 16pt;">다음 페이지로 전송</button>
  				</td>
  			</tr>
  		</table>
  	</form>
</div>
  
</body>
</html>