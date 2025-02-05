<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 동적인 StringBuffer 혹은 StringBuilder 를 써야 메모리 낭비 줄일 수 있다.
	StringBuffer str = new StringBuffer();
	MemberDAO dao = null;
	
	String memberCount = "<span id='membercount'>전체 인원 수 : ";
	
	// dao 만들 때 다 throws 시키게 했으니까 여기서 try~catch하자!
	try
	{
		dao = new MemberDAO();
		
		memberCount += dao.count() + "명</span>";
		
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th><th>전화번호</th></tr>");
		
		// MemberDAO 객체의 lists() 메소드 호출
		//-- 반복문 구성을 통해 <table> 하위 엘리먼트 생성
		for(MemberDTO member : dao.lists())
		{
			str.append("<tr>");
			str.append("<td class='record'>" + member.getSid() + "</td>");
			str.append("<td class='record'>" + member.getName() + "</td>");
			str.append("<td class='record'>" + member.getTel() + "</td>");
			str.append("</tr>");
			
		}
		str.append("</table>");
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터베이스 연결 종료
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
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.record {text-align: center;}
	input {width: 200px; border-raius: 6px;}
	button {width: 380px; height: 40px; font-family: 맑은 고딕; font-weight: bold;}
	.errMsg {font-size: small; color: red; display: none;}
	.inputTh {width: 140px;}
</style>
<script type="text/javascript">

	function formCheck()
	{
		// 확인
		//alert("함수 호출 확인~!!!");
		
		//return true;
		//return false;
		
		var userName = document.getElementById("userName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		if (userName.value == "")
		{
			nameMsg.style.display = "inline";
			userName.focus();
			return false;
		}
		
		return true;
	}
	
</script>
</head>
<body>

<div>
	<h1>데이터베이스 연동 회원관리 실습</h1>
	<p>DAO, DTO 개념 적용</p>
	<hr>
</div>

<!-- div>form>table.table>(tr>th{이름(*)}+td>input#userName.txt+span.errMsg#nameMsg{이름을 입력해야 합니다.}*2) -->
<div>
	<form action="MemberInsert.jsp" method="post" onsubmit="return formCheck()">
		<table class="table">
			<tr>
				<th class="inputTh">이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th class="inputTh">전화번호</th>
				<td>
					<input type="text" id="userTel" name="userTel" class="txt">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn" id="btnAdd">회원 추가</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<br><br>

<!-- div>span#membercount{전체 인원 수 : 3명}+table.table>(tr>th{번호}+th{이름}+th{전화번호})+tr*3>td.record*3 -->
<div>
	<!--
	<span id="membercount">전체 인원 수 : 3명</span>
	<table class="table">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
		</tr>
		<tr>
			<td class="record">1</td>
			<td class="record">고길동</td>
			<td class="record">010-1111-1111</td>
		</tr>
		<tr>
			<td class="record">2</td>
			<td class="record">도우너</td>
			<td class="record">010-2222-2222</td>
		</tr>
		<tr>
			<td class="record">3</td>
			<td class="record">마이콜</td>
			<td class="record">010-3333-3333</td>
		</tr>
	</table>
	-->
	
	<!-- 전체 인원 수 확인 -->
	<%=memberCount %>
	
	<!-- 번호, 이름, 전화번호 항목에 대한 리스트 구성 -->
	<!-- 그냥 str을 찍으면 StringBuffer니까 .toString()을 통해 String으로 만들어서 출력시키자. -->
	<!-- 그냥 str로 찍어도 나오긴 하지만.. 타입이 StringBuffer니까.. -->
	<%=str.toString() %>
	
</div>

</body>
</html>