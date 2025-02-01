<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String before = request.getParameter("before");
	String after = request.getParameter("after");
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	Calendar cal = Calendar.getInstance();
	
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	int selectYear = nowYear;
	int selectMonth = nowMonth;

	if (sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	if (before != null)
	{
		selectMonth -= 1;
		if (selectMonth == 0)
		{
			selectYear -= 1;
			selectMonth = 12;
		}
	}
	
	if (after != null)
	{
		selectMonth += 1;
		if (selectMonth == 13)
		{
			selectYear += 1;
			selectMonth = 1;
		}
	}
	
	cal.set(selectYear, selectMonth-1, 1);
	
	int week = cal.get(Calendar.DAY_OF_WEEK)-1;
	
	int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	String[] weekNames = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	
	String calStr = "";
	calStr += "<table border = 1>";
	
	calStr += "<tr>";
	for (int i=0; i<weekNames.length; i++)
	{
		if(i==0)
			calStr += "<th style='color:red;'>" + weekNames[i] + "</th>";
		else if(i==6)
			calStr += "<th style='color:blue;'>" + weekNames[i] + "</th>";
		else
			calStr += "<th>" + weekNames[i] + "</th>";
	}
	calStr += "</tr>";
	
	calStr += "<tr>";
	for (int i=1; i<=week; i++)
		calStr += "<td></td>";
		
	for (int i=1; i<=lastDay; i++)
	{
		week++;
		
		if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0) 
			calStr += "<td class='nowSat'>" + i + "</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==1) 
			calStr += "<td class='nowSun'>" + i + "</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay) 
			calStr += "<td class='now'>" + i + "</td>";
		else if(week%7==0)	
			calStr += "<td class='sat'>" + i + "</td>";
		else if(week%7==1) 	
			calStr += "<td class='sun'>" + i + "</td>";
		else 				
			calStr += "<td>" + i + "</td>";

		if(week%7==0)
			calStr += "</tr><tr>";
	}
		
	for(int i=0; i<=week; i++, week++)
	{
		if(week%7==0)
			break;
		calStr += "<td></td>";
	}
	
	
	calStr += "</tr>";
		
	calStr += "</table>";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	td {text-align: right;}
	td.now {background-color: aqua; font-weight: bold;}
	.sat {color: blue;}
	.sun {color: red;}
	td.nowSat{background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun{background-color: aqua; font-weight: bold; color: red;}
</style>

</head>
<body>

<div>
	<h1>데이터 송수신 실습 07</h1>
	<hr>
</div>

<!--  
	○ 데이터 송수신 실습 08
	
		- 사용자가 선택한 연도와 월에 대해 달력을 구성하는 JSP 페이지를 구성한다.
		
		- 단, submit 버튼 없이 이벤트 처리를 살 수 있도록 한다.
		
		- 전송한 내용을 자신 페이지로 수신하여 출력해주는 형태의 단독 페이지로 구성한다.
		
			◀ 2025년 1월 ▶
			
			-------------------------------
			-------------------------------
			-------------------------------
			-------------------------------
			-------------------------------
			
		- 『◀』 이나 『▶』 클릭 시
		   해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
		   
		- 사용자 최초 요청 주소
		  http://localhost:3306/WebApp07/SendAndReceive08.jsp
		  
		  
	○ 물리적 파일 구성
	
		- SendAndReceive08.jsp 

-->

<div>
	<form method="get">
		<input type="hidden" name="year" value="<%= selectYear %>">
        <input type="hidden" name="month" value="<%= selectMonth %>">
		<button type="submit" name="before">◀</button>
		<%= selectYear %> 년 <%=selectMonth %> 월
		<button type="submit" name="after">▶</button>
	</form>
</div>
<br><br>

<div>
	<%=calStr %>
</div>


</body>
</html>