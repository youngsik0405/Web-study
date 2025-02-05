<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(→ SendAndReceive08.jsp)로부터 넘어온 데이터 수신
	// → year, month
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	// 달력 객체 생성
	Calendar cal = Calendar.getInstance();
	
	// 오늘의 날짜 확인
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH) + 1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	
	// 표시할 달력의 연, 월 구성
	int year = nowYear;
	int month = nowMonth;
	
	// 최초 요청이 아니라면...
	if (strYear != null)
		year = Integer.parseInt(strYear);
	if (strMonth != null)
		month = Integer.parseInt(strMonth);
	
	// 이전(◀)
	int preYear = year;
	int preMonth = month-1;
	
	if (preMonth < 1)
	{
		preYear = year-1;
		preMonth = 12;
	}
	
	// 다음(▶)
	int nextYear = year;
	int nextMonth = month+1;
	
	if (nextMonth > 12)
	{
		nextYear = year+1;
		nextMonth = 1;
	}	
	
	
	// 표시할 달력 세팅
	cal.set(year, month-1, 1);
	int startDay = 1;
	
	// 해당 연, 월의 마지막 날짜 구하기
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	// 요일 확인
	int week = cal.get(Calendar.DAY_OF_WEEK);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	a {text-decoration: none;}
	td {text-align: center; font-size: 16pt; height: 40px;}
</style>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 08</h1>
	<hr>
</div>
<!-- 
	○ 데이터 송수신 실습 08
	
	   - 사용자가 선택한 연도와 월에 대해 달력을 구성하는 JSP 페이지를 구성한다.
	   
	   - 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	   
	   - 전송한 내용을 자신 페이지로 수신하여 출력해주는 형태의 단독 페이지로 구성한다.
	   
	     ◀ 2025년 1월 ▶
	     
	     ---------------------------
	     ---------------------------
	     ---------------------------
	     ---------------------------
	     ---------------------------
	     
	   - 『◀』 이나 『▶』 클릭 시
	     해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	     
	   - 사용자 최초 요청 주소
	     http://localhost:3306/WebApp07/SendAndReceive08.jsp
	     
	     
	○ 물리적 파일 구성
	
	   - SendAndReceive08.jsp	     	     	     
	     
-->

<%-- <h2>확인 : <%=nowYear %>년 <%=nowMonth %>월 <%=nowDay %>일 <%=week %>요일</h2> --%>
<%-- <h2>year : <%=year %>, month : <%=month %></h2> --%>

<div>
	<br><br>
	<table class="table" style="text-align: center;">
		<tr>
			<td>
				<!-- <a href="">◀</a> -->
				<a href="SendAndReceive08.jsp?year=<%=preYear%>&month=<%=preMonth%>">◀</a>
				
				<!-- <b>2025년 1월</b> -->
				<b><%=year %>년 <%=month %>월</b>
				
				<!-- <a href="">▶</a> -->
				<a href="SendAndReceive08.jsp?year=<%=nextYear%>&month=<%=nextMonth%>">▶</a>
			</td>
		</tr>
	</table>
	
	<table class="table">
		<tr>
			<th bgcolor="#e6e4e6" style="color: red;">일</th>
			<th bgcolor="#e6e4e6">월</th>
			<th bgcolor="#e6e4e6">화</th>
			<th bgcolor="#e6e4e6">수</th>
			<th bgcolor="#e6e4e6">목</th>
			<th bgcolor="#e6e4e6">금</th>
			<th bgcolor="#e6e4e6" style="color: blue;">토</th>
		</tr>
		
		<%
		
		int newLine = 0;
		
		out.print("<tr>");
		for (int i=1; i<week; i++)
		{
			out.print("<td bgcolor='#f8f8f8'>&nbsp;</td>");
			newLine++;
		}
		
		for (int i=startDay; i<=endDay; i++)
		{
			String fontColor = (newLine==0) ? "red" : (newLine==6) ? "blue" : "white";
			String bgColor = (nowYear==year)&&(nowMonth==month)&&(nowDay==i) ? "#d2d4ba" : "#f8f8f8";
			
			out.print("<td bgcolor='"+bgColor+"'><span color='"+fontColor+"'>" + i + "</span></td>");
			newLine++;
			
			if(newLine==7 && i!=endDay)
			{
				out.print("</tr><tr>");
				newLine = 0;
			}
		}
		
		while (newLine < 7)
		{
			out.print("<td bgcolor='#f8f8f8'>&nbsp;</td>");
			newLine++;
		}
		
		out.print("</tr>");
		
		%>
		
	</table>
	
	
</div>













</body>
</html>