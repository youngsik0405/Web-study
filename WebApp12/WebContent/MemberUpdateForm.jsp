<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(→ MemberList.jsp)로부터 넘어온 데이터 수신
	// → sid
	
	// ※ 수신한 sid 를 가지고 회원 데이터 조회
	//    이를 통해 얻어낸 데이터를 활용하여 폼의 내용 구성
	
	String sid = request.getParameter("sid");

	String name = "";
	String tel = "";
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		MemberDTO member = dao.searchMember(sid);
		
		name = member.getName();
		tel = member.getTel();
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
<title>MemberUpdateForm.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberListScore.css">

<script type="text/javascript">
	
	function memberSubmit()
	{	
		// 확인
		//alert("입력 호출 확인~!!!");
		
		var memberForm = document.getElementById("memberForm");
		
		var uName = document.getElementById("uName");		
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		if (uName.value == "")
		{
			nameMsg.style.display = "inline";
			uName.focus();
			
			return;					//-- memberSubmit() 메소드 종료
		}
		
		// form 을 직접 지정하여 submit 액션 수행
		memberForm.submit();
	}

	function memberReset()
	{
		// 확인
		//alert("리셋 함수 호출~!!!");
		
		var memberForm = document.getElementById("memberForm");
		var nameMsg = document.getElementById("nameMsg");
		var uName = document.getElementById("uName");
		
		nameMsg.style.display = "none";
		
		// form 을 직접 지정하여 reset 액션 수행
		memberForm.reset();
		
		uName.focus();
	}
</script>

</head>
<body>

<div>
	<!-- 페이지 정체성 -->
	<h1>회원<span style="color: red;">명단</span>관리 및 수정 페이지</h1>
	<hr>	
</div>

<div>
	<!-- 기본 메뉴 구성(기능별 페이지 이동) -->
	<a href="MemberList.jsp"><button>회원 명단 관리</button></a>
</div>
<br>

<div>
	<!-- 회원 데이터 수정 폼 구성 -->
	<form action="MemberUpdate.jsp?sid=<%=sid %>" method="post" id="memberForm">
		<table>
			<%-- 
			<tr>
				<th>번호</th>
				<td>
					<input type="text" id="sid" name="sid" value="<%=sid%>" disabled="disabled">
				</td>
			</tr>
		 	--%>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="uName" name="uName" value=<%=name %>> 
				</td>
				<td>
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
				<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="uTel" name="uTel" value=<%=tel %>> 
				</td>
				<td>
				</td>
			</tr>
		</table>
		
		<%-- <input type="hidden" name="sid" value=<%=sid %>> --%>
		<br>
		
		<!-- <a href="javascript:memberSubmit()"><button type="button">입력하기</button></a> -->
		<a href="javascript:memberSubmit()"><button type="button">수정하기</button></a>
		
		<!-- <button type="button" onclick="memberReset()">취소하기</button> -->
		<a href="javascript:memberReset()"><button type="button">취소하기</button></a>
		
		<a href="MemberList.jsp"><button type="button">목록으로</button></a>
	</form>
</div>



</body>
</html>