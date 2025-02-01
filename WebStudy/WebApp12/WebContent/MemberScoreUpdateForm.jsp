<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 데이터(→ MemberScoreList.jsp)로부터 넘어온 데이터 수신
	// → sid
	String sid = request.getParameter("sid");
	String name = "";
	int kor = 0;
	int eng = 0;
	int mat = 0;
	
	// sid 를 활용하여 각 속성을 얻어내기 위한 dao 객체 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// 수신한 sid 를 활용하여 name 및 각 과목의 점수 얻어내기
		MemberScoreDTO score = dao.search(sid);
		
		name = score.getName();
		kor = score.getKor();
		eng = score.getEng();
		mat = score.getMat();
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreUpdateForm.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberListScore.css">

<script type="text/javascript">
	
	function memberScoreSubmit()
	{
		var memberScoreForm = document.getElementById("memberScoreForm");
		
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if (kor.value == "" || isNaN(kor.value) || Number(kor.value)<0 || Number(kor.value)>100)
		{
			korMsg.style.display = "inline";
			kor.focus();
			return;
		}
		
		if (eng.value == "" || isNaN(eng.value) || Number(eng.value)<0 || Number(eng.value)>100)
		{
			engMsg.style.display = "inline";
			eng.focus();
			return;
		}
		
		if (mat.value == "" || isNaN(mat.value) || Number(mat.value)<0 || Number(mat.value)>100)
		{
			matMsg.style.display = "inline";
			mat.focus();
			return;
		}
		
		memberScoreForm.submit();
		
	}
</script>


</head>
<body>

<div>
	<!-- 페이지 정체성 -->
	<h1>회원<span style="color: blue;">성적</span>관리 및 수정 페이지</h1>
	<hr>
</div>

<div>
	<!-- 기본 메뉴 구성(기능별 페이지 이동) -->
	<a href="MemberScoreList.jsp"><button>회원 성적 관리</button></a>
</div>
<br>

<div>
	<!-- 회원 성적 데이터 입력 폼 구성 -->
	<form action="MemberScoreUpdate.jsp?sid=<%=sid %>" method="post" id="memberScoreForm">
		<table class="table">
			<tr>
				<th>번호</th>
				<td>
					<%=sid %>
				</td>
				<td></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%=name %></td>
				<td></td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="kor" name="kor" class="txtScore" value=<%=kor %>>
				</td>
				<td>
					<span class="errMsg" id="korMsg">
						0 ~ 100 사이의 국어점수를 입력해야 합니다.
					</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="eng" name="eng" class="txtScore" value=<%=eng %>> 
				</td>
				<td>
					<span class="errMsg" id="engMsg">
						0 ~ 100 사이의 영어점수를 입력해야 합니다.
					</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="mat" name="mat" class="txtScore" value=<%=mat %>>
				</td>
				<td>
					<span class="errMsg" id="matMsg">
						0 ~ 100 사이의 수학점수를 입력해야 합니다.
					</span>
				</td>
			</tr>
		</table>
		<br>
		
		<a href="javascript:memberScoreSubmit()">
			<button type="button">수정하기</button>
		</a>
		<a href="javascript:memberScoreReset()">
			<button type="button">되돌하기</button>
		</a>
		<a href="MemberScoreList.jsp">
			<button type="button">목록하기</button>
		</a>
	</form>
</div>


</body>
</html>