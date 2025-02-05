<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// TestSession01Ok.jsp 페이지에서
	// 이 페이지를 다시 요청할 수 있도록 안내하면서
	// session 의 userId 에 superman 을... userName 에 박제훈 을 담아서 보낸 상황
	String userId = (String)session.getAttribute("userId");		// getAttribute()의 반환형은 Object이지만, 실제 담긴 값은 String이므로 다운캐스팅
	String userName = (String)session.getAttribute("userName");
	//-- 『session.getAttribute("userId");』는
	//   Object 타입을 반환하므로
	//   String 타입으로 변환하는 과정 필요(다운캐스팅)
	
	// or
	
	// 최초 요청 상황 → userId:null / memberName:null
	
	
	// 추가~!!!
	// 세션 시간 변경 ------------------------------------------------------------
	
	// ※ 세션의 기본(default) 시간은 1800초.
	
	session.setMaxInactiveInterval(10);
	//-- 세션이 유지되는 시간을 10초로 설정한 상태 (활동하고 있는 동안에는 카운팅하지 않음)
	//   이로 인해...
	//   로그인 후 10초 동안 아무 액션도 없는 상태에서
	//   다시 페이지 새로고침을 수행하면 로그아웃 처리된 것을 확인할 수 있다.
	
	
	// ------------------------------------------------------------ 세션 시간 변경 
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberListScore.css">
<style type="text/css">
	a {text-decoration: none;}
	.btnMenu
	{
		border: 1px solid gray;
		font-size: 8pt;
		width: 70px;
		height: 20px;
	}
</style>
<script type="text/javascript">

	function sendIt()
	{
		// 확인
		//alert("함수 호출 확인~!!");
		
		//name으로 엘리먼트 가져올 때는 document.getElementById()가 아니고 냅다 이렇게 가져올 수 있는 거???
		// check~!!! name속성에 접근하는 방법~!!!
		var f = document.loginForm;
		
		if (!f.userId.value)	//form에서 name이 userId인 엘리먼트에 값이 없으면
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

<div>
	<h1>세션 처리</h1>
	<p>로그인</p>
	<hr>
</div>

<div>
	<table>
		<tr>
			<td>
				<a href="">
					<button type="button" class="btnSmallAct btnMenu">게시판</button>
				</a>
				
				<%
				if (userId==null)	// 로그인 Ⅹ
				{
				%>
				<a href="">
					<button type="button" class="btnSmallNon btnMenu" disabled="disabled">일정관리</button>
				</a>
				<a href="">
					<button type="button" class="btnSmallNon btnMenu" disabled="disabled">친구관리</button>
				</a>
				<%
				}
				else				// 로그인 ○
				{
				%>
				<a href="Sce.jsp">
					<button type="button" class="btnSmallAct btnMenu">일정관리</button>
				</a>
				<a href="Fri.jsp">
					<button type="button" class="btnSmallAct btnMenu">친구관리</button>
				</a>
				<%
				}
				%>
				
				
			</td>
		</tr>
	</table>
</div>
<br><br>

<div>
	<table>
		<tr>
			<td>
			
				<%
				if (userId==null)		//-- 로그인 Ⅹ
				{
				%>
				<form action="TestSession01Ok.jsp" method="post" name="loginForm">
					<table>
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" name="userId" class="txt" style="width: 150px;">
							</td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td>
								<!-- <input type="password" name="userPwd" class="txt" style="width: 150px;"> -->
								<!-- 테스트 확인을 위해 password타입이 아니라 text타입으로 쓰자~ -->
								<input type="text" name="userPwd" class="txt" style="width: 150px;">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" class="btn" style="width: 100%;"
								onclick="sendIt()">로그인</button>
							</td>
						</tr>
					</table>
				</form>
				<%
				}
				else				//-- 로그인 ○
				{
				%>
					<h2><%=userName %>(<%=userId %>)님, 환영합니다.</h2>
					<h2>이제 일정관리와 친구관리 서비스를 이용할 수 있습니다.</h2>
					
					<p>
						<a href="Logout.jsp">
							<button type="button" class="btn">로그아웃</button>
						</a>
					</p>
				<%
				}
				%>
			</td>
		</tr>
	</table>
</div>

</body>
</html>