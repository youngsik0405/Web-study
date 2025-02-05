<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	
	
	//캘린더 객체 생성
	Calendar cal = Calendar.getInstance();
					
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH) + 1;
	int nowDay = cal.get(Calendar.DATE);
	
	int nYear = nowYear;
	int nMonth = nowMonth;
	int nDay = nowDay;
	
	// 최초 요청이 아니라면
	if (yearStr != null || monthStr != null)
	{
		nYear = Integer.parseInt(yearStr);
		nMonth = Integer.parseInt(monthStr);
		
	}
	
	// 달력 그리기
	String str = "";
	String[] yoils = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	str += "<table class='table' border='1'>";		//<table style="border:1px;">로 하니까 보더가 안 생김.. 왜지??
	str += "<tr>";
	for(int i=0; i<yoils.length; i++)
	{
		if (i==0)
			str += "<th class='sun'>" + yoils[i] + "</th>";
		else if (i==yoils.length-1)
			str += "<th class='sat'>" + yoils[i] + "</th>";
		else
			str += "<th>" + yoils[i] + "</th>";
	}
	str += "</tr>";
	
	// 1. 달력 첫 줄에 공백 넣기
	//1-1. 달력 1일으로 세팅
	cal.set(nYear, nMonth-1, 1);
	//cal.set(2024, 11, 1);		//2024년 12월 1일로 세팅...
	
	//1-2. 1일의 요일 구하기
	int w = cal.get(Calendar.DAY_OF_WEEK);
	
	//System.out.println("w = " + w);
	//--==>> 2025년 1월로 세팅됐을 때.. w == 4로 찍힌다.(수요일)	//일요일이 1로 나옴..??
	
	str += "<tr>";
	for(int i=1; i<w; i++)
	{
		str += "<td></td>";
	}
	
	// 2. 이제 숫자 넣어주기~~~~
	//2-1. 마지막날 구하기
	int lastDay = cal.getActualMaximum(Calendar.DATE);
	
	//2-2. 숫자 넣기
	for(int i=1; i<=lastDay; i++)
	{
		//str += "<td>" + i + "</td>";
		if (nYear==nowYear && nMonth==nowMonth && i==nDay && w%7==0) //오늘이 토요일일 때
			str += "<td class='todaySat'>" + i + "</td>";	
		else if (nYear==nowYear && nMonth==nowMonth && i==nDay && w%7==1) //오늘이 일요일일 때
			str += "<td class='todaySun'>" + i + "</td>";	
		else if (nYear==nowYear && nMonth==nowMonth && i==nDay) //오늘이 평일일 때
			str += "<td class='today'>" + i + "</td>";
		else if (w%7==0)	//오늘이 아닌 토요일
			str += "<td class='sat'>" + i + "</td>";
		else if (w%7==1)	//오늘이 아닌 일요일
			str += "<td class='sun'>" + i + "</td>";
		else //오늘이 아닌 평일
			str += "<td>" + i + "</td>";
		
		if (w%7==0 && i!=lastDay)			//마지막날이 토요일일때, </tr><tr>로 들어가면 쓸데없는 한 줄이 더 생긴다.
		{
			//System.out.println("개행");
			str += "</tr><tr>";
		}
		w++;
		//System.out.println("w : " + w);
	}
	
	//w--;
	//System.out.println("w : " + w);
	
	//2-3. 마지막에 개행되지 않았다면.. 공백칸 넣어주기
	for(int i=1; i<w; i++)
	{
		if (w%7==1)
		{
			//System.out.println("개행");
			break;
		}
		str += "<td></td>";
		w++;
	}
	
	str += "</tr></table>";
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<style type="text/css">
	.table {width: 800px; border-color: #ebebeb; font-weight: bold; weight: 400px;}
	th { font-weight: bold; background-color: #eeeeee;}
	td {text-align: left; vertical-align: top; font-weight: bold; height: 100px;}
	.sat {color:blue;}
	.sun {color:red;}
	.todaySat {color:blue; background-color: aqua;}
	.todaySun {color:red; background-color: aqua;}
	.today {background-color: aqua;}
</style>

<script type="text/javascript">

	function formSubmit(obj, n)
	{
		// 확인
		//alert("함수 호출 확인");
		
		var yearObj = document.getElementById("year");
		var monthObj = document.getElementById("month");
		
		//alert(yearObj.value + "년 " + monthObj.value + "월");
		
		if(n==-1)	// ◀버튼을 눌렀다면
		{
			monthObj.value--;
			if(monthObj.value == 0)
			{
				yearObj.value--;
				monthObj.value = 12;
			}
		}
		else		// ▶버튼을 눌렀다면
		{
			monthObj.value++;
			if(monthObj.value == 13)
			{
				yearObj.value++;
				monthObj.value = 1;
			}
		}
		
		//alert(yearObj.value + "년 " + monthObj.value + "월");
		
		obj.submit();
		
	}
</script>
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

<div>
	<form action="" method="get">
		<input type="button" value="◀" onclick="formSubmit(this.form, -1)">
		<input type="text" name="year" id="year" value=<%=nYear %> readonly="readonly" style="border:0px; width:80px; text-align: right;">년
		<input type="text" name="month" id="month" value=<%=nMonth %> readonly="readonly" style="border:0px; width:30px; text-align: right;">월
		<input type="button" value="▶" onclick="formSubmit(this.form, 1)">
	</form>
</div>

<div>
	<!-- 달력 그릴 장소 -->
	<%=str %>
</div>

</body>
</html>