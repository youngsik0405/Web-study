<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(→ SendAndReceive07.jsp)로부터 넘어온 데이터 수신
	//                --------------------
	//                  자기 자신 페이지
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	// Calendar 객체 생성
	// 원칙적으로는 Calendar클래스가 있는 위치를 직접 이렇게 명시해줘야함
	//java.util.Calendar cal = java.util.Calendar.getInstance();
	
	// 그러나 자동으로 import속성을 추가할 수 있음!!!(line1 참고)
	Calendar cal = Calendar.getInstance();
	
	// 현재 연, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);			//-- 2025
	int nowMonth = cal.get(Calendar.MONTH)+1;		//-- (0+1)=1
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);	//-- 8
	
	// 표시할 달력의 연, 월 구성
	// → 페이지 최초 요청을 감안한 코드 처리
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	// 페이지에 대한 요청이 최초 요청이 아닐 경우(사용자가 선택했을 때)
	// → 선택한 값(수신한 값)을 활용한 달력의 연, 월 구성
	if (sYear != null || sMonth != null)
	{
			selectYear = Integer.parseInt(sYear);
			selectMonth = Integer.parseInt(sMonth);
	}
	
	// 테스트
	//out.print("<h1>selectYear : " + selectYear + "</h1>");
	//out.print("<h1>selectMonth : " + selectMonth + "</h1>");
	
	// 확인한 날짜로 년도 select option 구성
	//---------------------------------------------
	// <option value="2015">2015</option>
	// <option value="2016">2016</option>
	// <option value="2017">2017</option>
	//                   :
	// <option value="2025" selected="selected">2025</option>
	//                   :
	// <option value="2033">2033</option>
	// <option value="2034">2034</option>
	// <option value="2035">2035</option>
	//---------------------------------------------
	
	String yOptions = "";
	for (int year=(selectYear-10); year<=(selectYear+10); year++)	// 2015 ~ 2035
	{
		// 관찰 ⓐ
		//yOptions += "<option value=" + year + ">" + year + "</option>";
		//yOptions += "<option value='" + year + "'>" + year + "</option>";
		
		// 관찰 ⓑ
		//if (year==nowYear)
		//	yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		//else
		//	yOptions += "<option value='" + year + "'>" + year + "</option>";
		
		// 상황 1 : 페이지 최초 요청일 때 → sYear 는 null
		//			현재의 연도와 옵션 값이 같을 때
		// ==> selected(○)
		
		// 상황 2 : 페이지 최초 요청이 아닐 때 → sYear 는 null 아님
		//          선택된 연도와 옵션 값이 같을 때
		// ==> selected(○)
		
		// 상황 3 : 나머지
		// ==> selected(Ⅹ)
		
		if (sYear==null && year==nowYear)
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		else if (sYear!=null && year==Integer.parseInt(sYear))
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		else
			yOptions += "<option value='" + year + "'>" + year + "</option>";
		
		
		
	}
	
	// 확인한 날짜로 년도 select option 구성
	//---------------------------------------------
	// <option value="1" selected="selected">1</option>
	// <option value="2">2</option>
	// <option value="3">3</option>
	//                   :
	// <option value="10">10</option>
	// <option value="11">11</option>
	// <option value="12">12</option>
	//---------------------------------------------
	
	String mOptions = "";
	for (int month=1; month<=12; month++)	// 1 ~ 12
	{
		// 상황 1 : 페이지 최초 요청일 때 → sMonth 는 null
		//			현재의 연도와 옵션 값이 같을 때
		// ==> selected(○)
		
		// 상황 2 : 페이지 최초 요청이 아닐 때 → sMonth 는 null 아님
		//          선택된 연도와 옵션 값이 같을 때
		// ==> selected(○)
		
		// 상황 3 : 나머지
		// ==> selected(Ⅹ)
		if (sMonth == null && month==nowMonth)
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		else if (sMonth != null && month==Integer.parseInt(sMonth))
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		else
			mOptions += "<option value='" + month + "'>" + month + "</option>";
		
	}
	
	// 그려야 할 달력의 1일이 무슨 요일인지 확인 필요
	// (만년 달력 구조)
	
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};	//-- 각 월의 최대 날짜
	
	if (selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)		//-- 윤년
		months[1] = 29;
	
	// 총 날 수 누적 변수
	int nalsu;
	
	// 요일 항목 타이틀 배열 구성
	String[] weekNames = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	// 입력받은 년도 이전 년도까지의 날 수 계산
	nalsu = (selectYear-1) * 365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 위 계산 항목에 입력받은 월의 이전 월까지의 날 수 추가
	for (int i=0; i<selectMonth-1; i++)
		nalsu += months[i];
	
	nalsu++;								//-- 『+ 1』 (입력받은 월의 1일이 되게 하기 위해서)
	
	int week = nalsu%7;						//-- 요일 변수
	int lastDay = months[selectMonth-1];	//-- 해당 월의 마지막 날짜 변수
	
	
	// 달력 그리기 -------------------------------------------------------------------------------
	String calStr = "";
	calStr += "<table border='1'>";
	
	// 요일 이름 발생
	calStr += "<tr>";
	for (int i=0; i<weekNames.length; i++)
	{
		// 확인
		//calStr += "<th>" + weekNames[i] + "</th>";
		
		if (i==0)															//-- 일요일
			/* calStr += "<th style='color:red;'>" + weekNames[i] + "</th>"; */
			calStr += "<th class='sun'>" + weekNames[i] + "</th>";
		else if (i==6)														//-- 토요일
			//calStr += "<th style='color:blue;'>" + weekNames[i] + "</th>";
			calStr += "<th class='sat'>" + weekNames[i] + "</th>";
		else																//-- 평일
			calStr += "<th>" + weekNames[i] + "</th>";	
	}
	calStr += "</tr>";
	
	// 공백(빈 칸 td) 발생
	calStr += "<tr>";
	for (int i=1; i<=week; i++)
		calStr += "<td></td>";
		
	
	// 날짜 td 발생
	for (int i=1; i<=lastDay; i++)
	{	
		week++;								//-- 날짜가 하루씩 처리될 때 마다(구성이 이루어질 때 마다)
											//   요일도 함께 1씩 증가할 수 있도록 처리				check~!!!
		// 확인
		//calStr += "<td>" + i + "</td>";
		
		// 서버의 시간을 바꿔서 오늘 날짜를 바꿔보면 각자 if문 잘 실행되는지 확인할 수 있다.
		// 클라이언트 쪽에서 시간을 바꿔도 적용X 서버 시간을 바꾸는 거라서 오늘을 바꿀 수 있는 것이다!
		if (selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0)//-- 토요일인 오늘(앞서서 week++를 해가지고 week%7==0;)
			calStr += "<td class='nowSat'>" + i + "</td>";
		else if (selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==1)//-- 일요일인 오늘
			calStr += "<td class='nowSun'>" + i + "</td>";
		else if (selectYear==nowYear && selectMonth==nowMonth && i==nowDay)//-- 평일인 오늘(토요일, 일요일은 위 if에서 걸러진다)
			calStr += "<td class='now'>" + i + "</td>";
		else if (week%7==0)//-- 오늘이 아닌 토요일
			calStr += "<td class='sat'>" + i + "</td>";
		else if (week%7==1)//-- 오늘이 아닌 일요일
			calStr += "<td class='sun'>" + i + "</td>";
		else	// 오늘이 아닌 평일
			calStr += "<td>" + i + "</td>";
		
		
			
		//week++;
		
		if (week%7==0)
			calStr += "</tr><tr>";
		
	}
	
	
	// 공백(빈 칸 td) 발생
	for (int i=0; i<=week; i++, week++)		//-- 『week++』 → 공백이 발생되는 동안에도 요일 증가
	{
		if (week%7==0)
			break;
		
		calStr += "<td></td>";
		
	}
	calStr += "</tr>";
	
	calStr += "</table>";
	// ------------------------------------------------------------------------------- 달력 그리기
	

	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	td {text-align: right;}
	td.now {background-color: aqua; font-weight: bold;}
	.sat {color: blue;}
	.sun {color: red;}
	td.nowSat {background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun {background-color: aqua; font-weight: bold; color: red;}
</style>

<script type="text/javascript">

	function formCalendar(obj)
	{
		// 유효성 검사가 필요한 경우 삽입할 수 있는 영역~!!!
		
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
	   
	   - 연도 구성은 현재 연도를 기준으로 이전 10년, 이후 10년으로 구성한다.
	     (기본적으로 만년달력을 구성하는데, 현재의 연, 월은 달력 객체를 활용할 수 있도록 한다.)
	     
	   - 월 구성은 1월 부터 12월 까지로 구성한다.
		   
		   2014
	         :
	     [ 2024 ▼ ] 년 [ 1 ▼ ] 월
	         :			  :
	       2034          12
	       
	     ---------------------------------
	     ---------------------------------
	     ---------------------------------
	     ---------------------------------
	     ---------------------------------
	     
	   - 연도 select 나 월 select 의 내용이 변화되면
	     해당 연 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	     
	   - 사용자 최초 요청 주소
	     http://localhost:3306/WebApp07/SendAndReceive07.jsp
	     
	     
	○ 물리적 파일 구성
	
	   - SendAndReceive07.jsp	   	     
 -->

<div>
	<!-- form 의 action 속성 -->
	<form action="" method="post">
		<select id="year" name="year" onChange="formCalendar(this.form)">
			<!-- <option>선택</option> 빈 값을 넣어둘 필요 없음!!-->
			<!--
			<option value="9998">9998</option>
			<option value="9999">9999</option>
			-->
			<%=yOptions %>
		</select> 년
		<select id="month" name="month" onChange="formCalendar(this.form)">
			<!-- 
			<option value="98">98</option>
			<option value="99">99</option>
			-->
			<%=mOptions %>
		</select> 월
	</form>
</div>

<br><br>

<div>
	<!-- 달력을 그리게 될 지점 -->
	<%=calStr %>
</div>

</body>
</html>