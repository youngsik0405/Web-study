<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(core) 활용</h1>
	<p>회원 정보 입력</p>
	<hr>
</div>

<!-- 
	○ 물리적 파일 구성
	   - MemberInsertForm.jsp
	   - MemberInsert.jsp
	   - MemberList.jsp
	   
	   - com.test.MemberDTO 객체 생성 및 활용(→ 사용자 정의 데이터타입)
-->

<div>
	<form action="MemberInsert.jsp" method="post">
	
	<!-- (이름, 전화번호, 주소) * 5명 분 입력 -->
	<!-- → submit 액션 처리 -->
	<%--
	<c:forEach var="n" begin="1" end="5" step="1">
	이름 : <input type="text" class="txt" name="name" style="margin-left: 35px;"><br>
	전화번호 : <input type="tel" class="txt" name="tel"><br>
	주소 : <input type="text" class="txt" name="addr" style="margin-left: 35px;"><br><br>
	<hr>
	</c:forEach>
	<br>
	<button type="submit" class="btn" style="width: 400px; font-size: 16pt;">제출하기</button>
	</form>
	 --%>
	 
	<table class="table">
		<tr>
			<th>이름</th>
			<td>
				<!-- 	
				<input type="text" class="txt" name="name1">
				<input type="text" class="txt" name="name2">
				<input type="text" class="txt" name="name3">
				<input type="text" class="txt" name="name4">
				<input type="text" class="txt" name="name5">
				 -->
				 
				 <c:set var="i" value="1"></c:set>
				 <c:forEach var="a" begin="1" end="5" step="1">
				 	<input type="text" class="txt" name="name${i }">
				 	<c:set var="i" value="${i+1 }"></c:set>
				 </c:forEach>
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<!-- 
				<input type="text" class="txt" name="tel1">
				<input type="text" class="txt" name="tel2">
				<input type="text" class="txt" name="tel3">
				<input type="text" class="txt" name="tel4">
				<input type="text" class="txt" name="tel5">
				-->
				 
				<c:set var="i" value="1"></c:set>
				<c:forEach var="a" begin="1" end="5" step="1">
					<input type="text" class="txt" name="tel${i }">
				<c:set var="i" value="${i+1 }"></c:set>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<!-- 
				<input type="text" class="txt" name="addr1">
				<input type="text" class="txt" name="addr2">
				<input type="text" class="txt" name="addr3">
				<input type="text" class="txt" name="addr4">
				<input type="text" class="txt" name="addr5">
				-->
				
				<c:set var="i" value="1"></c:set>
				 <c:forEach var="a" begin="1" end="5" step="1">
				 	<input type="text" class="txt" name="addr${i }">
				 	<c:set var="i" value="${i+1 }"></c:set>
				 </c:forEach>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit" class="btn"
				style="width:100%; font-size:16pt;">입력</button>
			</td>
		</tr>
	</table>
	</form>
</div>

</body>
</html>