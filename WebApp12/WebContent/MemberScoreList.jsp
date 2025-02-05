<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberScoreDAO dao = new MemberScoreDAO();
	
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		str.append("	<table class='table'>");
		str.append("		<tr>");
		str.append("			<th class='numTh'>번호</th>");
		str.append("			<th class='nameTh'>이름</th>");
		str.append("			<th>국어점수</th><th>영어점수</th><th>수학점수</th>");
		str.append("			<th>총점</th><th>평균</th><th>석차</th>");
		str.append("			<th>성적처리</th>");
		str.append("		</tr>");
		
		for (MemberScoreDTO score : dao.lists())
		{
			str.append("	<tr>");
			str.append("		<td>" + score.getSid() + "</td>");
			str.append("		<td>" + score.getName() + "</td>");
			str.append("		<td class='txtScore'>" + score.getKor() + "</td>");
			str.append("		<td class='txtScore'>" + score.getEng() + "</td>");
			str.append("		<td class='txtScore'>" + score.getMat() + "</td>");
			str.append("		<td class='txtScore'>" + score.getTot() + "</td>");
			str.append("		<td class='txtScore'>" + String.format("%.2f", score.getAvg()) + "</td>");
			str.append("		<td class='txtScore'>" + score.getRank() + "</td>");
			
			// 성적 처리 항목(입력, 수정, 삭제)
			/*
			str.append("		<td>");
			str.append("			<button type='button' class='btnSmallNon'>");
			str.append("			입력");
			str.append("			</button>");
			str.append("			<button type='button' class='btnSmallAct'>");
			str.append("			수정");
			str.append("			</button>");
			str.append("			<button type='button' class='btnSmallAct'>");
			str.append("			삭제");
			str.append("			</button>");
			str.append("		</td>");
			*/
			
			if (score.getKor()==-1 && score.getEng()==-1 && score.getMat()==-1)
			{
				// 성적 데이터 미입력 → 수정 삭제 불가, 입력만 가능
				str.append("		<td>");
				
				// TBL_MEMBER에 이미 등록된 학생 sid가 TBL_MEMBERSCORE와 참조관계이므로 sid를 받아서 주소 만듦
				str.append("<a href='MemberScoreInsertForm.jsp?sid=" + score.getSid() + "'>");
				str.append("			<button type='button' class='btnSmallAct'>");
				str.append("			입력");
				str.append("			</button>");
				str.append("</a>");
				
				str.append("			<button type='button' class='btnSmallNon' disabled='disabled'>");
				str.append("			수정");
				str.append("			</button>");
				str.append("			<button type='button' class='btnSmallNon' disabled='disabled'>");
				str.append("			삭제");
				str.append("			</button>");
				
				str.append("		</td>");
			}
			else
			{
				// 성적 데이터 입력 → 입력 불가, 수정 삭제만 가능
				str.append("		<td>");
				
				str.append("			<button type='button' class='btnSmallNon' disabled='disabled'>");
				str.append("			입력");
				str.append("			</button>");
				
				str.append("<a href='MemberScoreUpdateForm.jsp?sid=" + score.getSid() + "'>");
				str.append("			<button type='button' class='btnSmallAct'>");
				str.append("			수정");
				str.append("			</button>");
				str.append("</a>");
				
				str.append("<a href='javascript:memberScoreDelete(" + score.getSid() + ", \"" + score.getName() + "\")'>");
				str.append("			<button type='button' class='btnSmallAct'>");
				str.append("			삭제");
				str.append("			</button>");
				str.append("</a>");
				str.append("		</td>");
			}
			
			
			
			
			
			
			str.append("	</tr>");
					
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
<title>MemberScoreList.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/MemberListScore.css">
<script type="text/javascript">

	function memberScoreDelete(sid, name)
	{
		// 확인
		//alert("삭제 함수 호출 확인~!!!");
		
		// ※ name 문자열 넘기는 과정에서 따옴표 구성에 유의할 것~!!!
		
		var response = confirm("번호:" + sid + ", 이름:" + name + "\n이 회원의 성적 데이터를 정말 삭제하시겠습니까?");
		
		if (response)
			window.location.href='MemberScoreDelete.jsp?sid=' + sid;
	}
	
</script>
</head>
<body>

<div>
	<!-- 페이지 정체성 -->
	<h1>회원 <span style="color: blue;">성적</span> 관리 및 출력 페이지</h1>
	<hr>
</div>

<div>
	<!-- 기본 메뉴 구성(기능별 페이지 이동) -->
	<a href="MemberList.jsp"><button>회원 명단 관리</button></a>
</div>
<br>

<div>
	<!-- 리스트 출력 -->
	<!-- 
	<table class="table">
		<tr>
			<th class="numTh">번호</th>
			<th class="nameTh">이름</th>
			<th>국어점수</th><th>영어점수</th><th>수학점수</th>
			<th>총점</th><th>평균</th><th>석차</th>
			<th>성적처리</th>
		</tr>
		<tr>
			<td>1</td>
			<td>희동이</td>
			<td>90</td>
			<td>80</td>
			<td>70</td>
			<td>240</td>
			<td>80.00</td>
			<td>1</td>
			<td>
				<a href="MemberScoreInsertForm.jsp"><button type="button" class="btnSmallNon">입력</button></a>
				<a href="MemberScoreUpdateForm.jsp"><button type="button" class="btnSmallAct">수정</button></a>
				<a href=""><button type="button" class="btnSmallAct">삭제</button></a>
			</td>
		</tr>
		<tr>
			<td>2</td>
			<td>도우너</td>
			<td>80</td>
			<td>70</td>
			<td>60</td>
			<td>210</td>
			<td>70.00</td>
			<td>2</td>
			<td>
				<a href="MemberScoreInsertForm.jsp"><button type="button" class="btnSmallNon">입력</button></a>
				<a href="MemberScoreUpdateForm.jsp"><button type="button" class="btnSmallAct">수정</button></a>
				<a href=""><button type="button" class="btnSmallAct">삭제</button></a>
			</td>
		</tr>
		<tr>
			<td>3</td>
			<td>마이콜</td>
			<td>70</td>
			<td>60</td>
			<td>50</td>
			<td>180</td>
			<td>60.00</td>
			<td>3</td>
			<td>
				<a href="MemberScoreInsertForm.jsp"><button type="button" class="btnSmallAct">입력</button></a>
				<a href=""><button type="button" class="btnSmallNon">수정</button></a>
				<a href=""><button type="button" class="btnSmallNon">삭제</button></a>
			</td>
		</tr>
	</table>
	 -->
	 <%=str.toString() %>
</div>

</body>
</html>