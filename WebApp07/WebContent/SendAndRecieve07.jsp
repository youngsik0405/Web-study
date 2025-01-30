<%@ page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(SendAndReceive07_1.jsp)로부터 넘어온 데이터 수신
	// → year, month
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	// Calendar 객체 생성
	//java.util.Calendar cal  = java.util.Calendar.getInstance();
	//-- 자바에서 생성하는 것과 같이 인텔리센스 기능 활용하여 객체 생성 가능
	Calendar cal = Calendar.getInstance();
	
	// 현재 년, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);			//-- 2023
	int nowMonth = cal.get(Calendar.MONTH)+1;		//-- 5
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);	//-- 18 (당일 -> 캘린더에 다르게 표시 하기 위해)
	
	// 표시할 달력의 년, 월 구성 → 페이지 최초 요청을 감안한 코드
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	// 페이지에 대한 요청이 최초가 아닐 경우
	// → line 6 ~ 7 을 통해 수신한 데이터로 표시할 달력의 년, 월 구성 
	if(sYear != null || sMonth!= null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	// 테스트
	//out.print("<h1>selectYear : "+ selectYear+ "</h1>");
	//out.print("<h1>selectMonth : "+ selectMonth+ "</h1>");
	
	// 확인한 날짜로 년도 select option 구성==========================================
	// <option value="2013">2013</option>
	//						:
	// <option value="2013" selected="selected">2023</option>
	//						:
	// <option value="2033">2033</option>
	String yOptions = "";
	for (int year=(selectYear-10); year<=(selectYear+10); year++)
	{
		// 관찰 1,2 경우 -- 최초 요청 페이지 부분만 구성
		// 관찰1 -- 년도 구성
		// year 는 실제 구성시 <option value='year'>
		// "<option value='" + year + "' + year + >
		// yOptions += "<option value='" + year + "'>" + year + "</option>";
		
		// 관찰2 -- selected 되게 만들기
		//if(year==nowYear)
		//	yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		//else	// 선택 년도가 아닐때는 그냥 추가
		//	yOptions += "<option value='" + year + "'>" + year + "</option>";
		
		// 상황1. 페이지 최초 요청일 때 → sYear 는 null / 현재 년도와 옵션이 같을 때 → selected(○)
		// 상황2. 페이지 최초 요청이 아닐 때 → sYear 는 null 아님 / 선택된 년도와 옵션이 같을 때 → selected(○)
		// 상황3. 나머지 → selected(Χ)
		
		// 관찰3 -- 변경된 요청까지 selected 되게 만들기
		if(year==nowYear && sYear == null)
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		else if(year==selectYear && sYear != null)
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		else	// 선택 년도가 아닐때는 그냥 추가
			yOptions += "<option value='" + year + "'>" + year + "</option>";
	}
	
	// ==========================================확인한 날짜로 년도 select option 구성
	
	// 확인한 날짜로 월 select option 구성==========================================
	// <option value='1'>1</option>
	//				:
	// <option value='5' selected='selected'>5</option>
	//				:
	// <option value='12'>12</option>
	String mOptions = "";
	for (int month=1; month<=12; month++)
	{
		// 상황1. 페이지 최초 요청일 때 → sMonth 는 null / 현재 월과 옵션이 같을 때 → selected(○)
		// 상황2. 페이지 최초 요청이 아닐 때 → sMonth 는 null 아님 / 선택된 월과 옵션이 같을 때 → selected(○)
		// 상황3. 나머지 → selected(Χ)
		
		// year 관찰 -> 월 구성
		if(month==nowMonth && sMonth == null)
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		else if(month==selectMonth && sMonth != null)
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		else	// 선택 년도가 아닐때는 그냥 추가
			mOptions += "<option value='" + month + "'>" + month + "</option>";
	}
	
	// ==========================================확인한 날짜로 월 select option 구성	
			
	// 그려야 할 달력의 1일이 무슨 요일인지 확인 필요 
	// 만년달력
	
	int[] months = {31,28,31,30,31,30,31,31,30,31,30,31};
	if(selectYear%4==0&&selectYear%100!=0||selectYear%400==0)
		months[1] = 29;
	
	// 총 날 수 누적 변수
	int nalsu;
	
	// 요일 항목 배열 구성
	String[] weekNames = {"일요일","월요일","화요일","수요일","목요일","금요일","토요일"};
	
	// 현재 년도 → 입력 받은 년도 이전 년도 가지 날 수 계산
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 현재 월 → 입력받은 월 이전 월까지의 날 수 계산
	for (int i=0; i<selectMonth-1; i++)
		nalsu += months[i];
	
	nalsu++;	// 해당월 1일
	
	int week = nalsu%7;	//요일변수
	int lastDay = months[selectMonth-1]; //마지막 날짜 변수
	
	// 달력그리기-------------------------------------------------------------
	String calStr = "";
	calStr += "<table border='1'>";
	
	// 요일 이름 발생
	calStr += "<tr>";
	for(int i=0; i<weekNames.length; i++)
	{
		//calStr += "<th>" + weekNames[i] + "</th>";
		
		// 요일에 스타일 추가를 위해 분기
		if(i==0)
			calStr += "<th style='color:red;'>" + weekNames[i] + "</th>";
		else if(i==6)
			calStr += "<th style='color:blue;'>" + weekNames[i] + "</th>";
		else
			calStr += "<th>" + weekNames[i] + "</th>";
	}
	calStr += "</tr>";
	
	// 빈 칸 공백 td 발생
	calStr += "<tr>";
	for (int i=1; i<=week; i++)
		calStr += "<td></td>";
		
	// 날짜 td 발생
	for (int i=1; i<=lastDay; i++)
	{
		week++;
		//-- 날짜가 하루씩 찍힐 때 마다(구성이 이루어질 때 마다)
		//   요일도 함께 1씩 증가할 수 있도록 처리
		//calStr += "<td>" + i + "</td>";
		
		if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0) //-- 토요일인 오늘
			calStr += "<td class='nowSat'>" + i + "</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==1) //-- 일요일인 오늘
			calStr += "<td class='nowSun'>" + i + "</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay) //-- 평일인 오늘
			calStr += "<td class='now'>" + i + "</td>";
		else if(week%7==0)	//-- 오늘이 아닌 토요일
			calStr += "<td class='sat'>" + i + "</td>";
		else if(week%7==1) 	//-- 오늘이 아닌 일요일
			calStr += "<td class='sun'>" + i + "</td>";
		else 				//-- 오늘이 아닌 평일
			calStr += "<td>" + i + "</td>";
		
		if(week%7==0)
			calStr += "</tr><tr>";
	}
	
	// 빈 칸 공백 td 발생
	for(int i=0; i<=week; i++, week++)		//-- 『week++』 → 공백이 발생되는 동안에도 요일 증가
	{
		if(week%7==0)
			break;
		calStr += "<td></td>";
	}
	
	
	calStr += "</tr>";
		
	calStr += "</table>";
	// -------------------------------------------------------------달력그리기	
%>





<%-- 나의 풀이
<%
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	
	Calendar cal = Calendar.getInstance();
	
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DATE);
	
	int year = nowYear;
	int month = nowMonth;
	
	if (yearStr != null || monthStr != null)
	{
		year = Integer.parseInt(yearStr);
		month = Integer.parseInt(monthStr);
	}
	
    int[] days = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    
 
    if(year%4==0 && year%100!=0 || year%400==0)
        days[1] = 29;
    
   
    int nalsu = (year-1)*365 + (year-1)/4 - (year-1)/100 + (year-1)/400;
    
   
    for(int i=0; i<month-1; i++)
        nalsu += days[i];
    
    nalsu++;    
    
    int week = nalsu%7;   
    int lastDay = days[month-1];
	
    
	
	String sYear = "";
	
	for (int i = year-10; i<= year+10; i++)
	{
		if (i == nowYear && yearStr == null)
		{
			sYear += "<option selected='"selected"'>" + i + "</option>";
		}
		else if (i == year && yearStr != null)
		{
			sYear += "<option selected='"selected"'>" + i + "</option>";
		}
		else
			sYear += "<option>" + i + "</option>";
	}
		
	String sMonth = "";
	
	for (int i = 1; i<=12; i++)
	{
		if (i == nowMonth && monthStr == null)
		{
			sMonth += "<option selected='"selected"'>" + i + "</option>";
		}
		else if (i == month && monthStr != null)
		{
			sMonth += "<option selected='"selected"'>" + i + "</option>";
		}
		else
			sMonth += "<option>" + i + "</option>";
	}
%> 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndRecieve07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	td {text-align: right;}
	td.now {background-color: aqua; font-weight: bold;}
	.sat {color: blue;}
	.sun {color: red;}
	td.nowSat{background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun{background-color: aqua; font-weight: bold; color: red;}
</style>

<script type="text/javascript">
	function formCalendar(obj)
	{
		// 유효성 검사가 필요한 경우 삽입할 수 있는 영역
		obj.submit();
	}
</script>

</head>
<body>

<div>
	<h1>데이터 송수신 실습 07</h1>
	<hr>
</div>

<!--  
	○ 데이터 송수신 실습 07
	
		- 연도와 월을 입력받아 해당 연월의 달력을 화면에 출력하는 JSP 페이지를 구성한다.
		
		- 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
		
		- 전송한 내용을 수신하여 출력해주는 형태의 페이지로 구성한다.
		
		- 연도 구성은 현재 연도를 기준을 이전 10년, 이후 10년으로 구성한다.
		  (기본적으로 만년달력을 구성하는데, 현재의 연, 월은 달력 객체를 활용할 수 있도록 한다.)
		  
		- 월 구성은 1월 부터 12월 까지로 구성한다.
		
		  2014
			:
		[ 2024 ▼ ] 년 [ 1 ▼ ] 월
			:			 :
		  2034			12
		------------------------------------
		------------------------------------
		------------------------------------
		------------------------------------
		------------------------------------
		
		- 연도 select 나 월 select 의 내용이 변화되면
		  해당 연 월의 달력을 출력해주는 형태의 페이지로 구성한다.
		  
		- 사용자 최초 요청 주소
		  http://localhost:3306/WebApp07/SendAndReceive07.jsp
		  
		  
	○ 물리적 파일 구성
	
		- SendAndReceive07.jsp 
		
	1. submit 액션 처리 → 스크립트 제어
	
	2. 수신한 데이터에 대한 처리
	   (이전 페이지로부터 데이터 수신)
	   → 연도, 월
	   
	3. Calendar 객체 생성
	   → 현재의 연, 월, 일 확인
	   
	4. 표시할 달력의 연, 월 구성
	   → 페이지 최초 요청을 감안한 코드 처리
	      (연도 select, 월 select)
	     
	5. 페이지에 대한 요청이 최초 요청이 아닐 경우
	   → 선택한 값을 활용한 달력의 연, 월 구성
	
	6. 해당 연, 월의 달력 그리기
	
	   
	   
-->


<div>
	<!-- form 의 action 속성 값 생략 → 요청 페이지 / 전송 데이터의 수신처는 자기 자신  -->
	<form action="">
		<select id="year" name="year" onchange="formCalendar(this.form)">
			<%=yOptions %>
		</select> 년
		
		<select id="month" name="month" onchange="formCalendar(this.form)">
			<%=mOptions %>
		</select> 월
	</form>
	
	
	<%-- 	
	<form action="">
		<select id="year" name="year" onchange="formCalendar(this.form)">
			<%=sYear %>
		</select> 년
		
		<select id="month" name="month" onchange="formCalendar(this.form)">
			<option><%=sMonth %></option>
		</select> 월
	</form> 
	--%>
</div>

<br><br>

<div>
	<%=calStr %>
</div>


<%-- 
<div>
	<!-- 달력을 그리게 될 지점 -->
	<table>
		<tr>
			<th class="sun">일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th class="sat">토</th>
		</tr>
		<%
		out.print("<tr>");


        for(int i=1; i<=week; i++)
            out.print("<td></td>");
            
        for(int i=1; i<=lastDay; i++)
        {
            week++;
            
            String tdClass = "";
            
            if(week%7==1) 
            	tdClass = "sun";
            else if(week%7==0) 
            	tdClass = "sat";
            
            if(year==nowYear && month==nowMonth && i==nowDay)
                tdClass += "today";
                
            out.print("<td class='" + tdClass + "'>" + i + "</td>");
                
            if(week%7==0)
                out.print("</tr><tr>");
        }
        
        while(week%7!=0)
        {
            out.print("<td></td>");
            week++;
        }
        out.print("</tr>");
        %>
	</table>
</div> 
--%>

</body>
</html>