<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(→TestSession01.jsp)로부터 넘어온 데이터 수신
	// → userName, userTel
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	// check~!!!
	// 추가
	session.setAttribute("userName", userName);
	session.setAttribute("userTel", userTel);
	/* 
	session.setAttribute("name", userName);
	session.setAttribute("tel", userTel);
 	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	/* 
	function formSubmit()
	{
		var f = document.idPwdForm;
		
		if (!f.userId.value)
		{
			alert("이름을 입력하세요!!");
			f.userId.focus();
			return;
		}
		if (!f.userPwd.value)
		{
			alert("전화번호를 입력하세요!!!!");
			f.userPwd.focus();
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
		
		if (!f.userId.value)
		{
			alert("아이디를 입력해야 합니다~!!!");
			f.userId.focus();
			return;
		}
		
		if (!f.userPwd.value)
		{
			alert("패스워드를 입력해야 합니다~!!!");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
		
		
	}
</script>
</head>
<body>
<!-- 
 <div>
 	<h1>◐ 세션Session 실습 이어서... ◑</h1>
 	<hr>
 </div>
 <div>
 	<form action="TestSession03.jsp" method="post" name="idPwdForm">
 		<p>아이디 <input type="text" class="txt" name="userId" style="margin-left:18px;"></p>
 		<p>패스워드 <input type="tel" class="txt" name="userPwd"></p>
 		<a>
 			<button type="button" class="btn" style="margin-left: 240px;" onclick="javascript:formSubmit()">입력</button>
 		</a>
 	</form>
 </div>
 -->
  
<div>
	<h1>TestSession02.jsp</h1>
	<p>아이디와 비밀번호</p>
	<hr>
</div>
  
<div>
  	<form action="TestSession03.jsp" method="post">
  		<table class="table">
  			<tr>
  				<th>아이디</th>
  				<td>
  					<input type="text" name="userId" class="txt">
  				</td>
  			</tr>
  			<tr>
  				<th>패스워드</th>
  				<td>
  					<input type="text" name="userPwd" class="txt">
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