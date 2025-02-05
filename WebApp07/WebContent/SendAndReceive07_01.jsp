<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 2. 수신한 데이터에 대한 처리
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	
	int nYear = 0;
	int nMonth = 0;
	
	//System.out.println(yearStr +"년 " + monthStr + "월");
	//--==>> (최초 요청 시)null년 null월
	//--==>> (선택 후)9999년 99월
	
	// 3. 캘린더 객체 생성
	Calendar cal = Calendar.getInstance();
	
	// 3-1. 현재의 연, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH) +1;
	int nowDay = cal.get(Calendar.DATE);
	
	//System.out.println("오늘은 " + nowYear +"년 " + nowMonth +"월 " + nowDay +"일");
	//--==>> 오늘은 2025년 1월 8일
			
	// 4. 표시할 달력의 연, 월 구성
	int[] yearArr = new int[21];
	// 4-1. 페이지 최초 요청 시..
	if (yearStr == null && monthStr == null)
	{
		//연도 배열 채우기
		int temp = 11;
		//현재 연도가 2025년일 때, 2015 ... 2025 ... 2035
		for (int i=0; i<yearArr.length; i++)
		{
			//System.out.println("temp : " + temp);
			if(i<=10)
				yearArr[i] = nowYear - (--temp);
			else if(i==11)
			{
				temp=1;
				yearArr[i] = nowYear + (temp);
			}
			else
				yearArr[i] = nowYear + (++temp);
		}
		
		//확인
		/* for(int n :yearArr)
		{
			System.out.println(n);
		} */
	}
	
	// 4-1. 최초요청이 아닐 때(사용자가 선택했을 때)..
	else
	{
		try
		{
			nYear = Integer.parseInt(yearStr);
			nMonth = Integer.parseInt(monthStr);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		//연도 배열 채우기
		int temp = 11;
		//현재 연도가 2025년일 때, 2015 ... 2025 ... 2035
		for (int i=0; i<yearArr.length; i++)
		{
			//System.out.println("temp : " + temp);
			if(i<=10)
				yearArr[i] = nYear - (--temp);
			else if(i==11)
			{
				temp=1;
				yearArr[i] = nYear + (temp);
			}
			else
				yearArr[i] = nYear + (++temp);
		}
		// 확인
		/* for(int n :yearArr)
		{
			System.out.println(n);
		} */
		
		
	}
		
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07_01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.table {width: 800px; border-color: #ebebeb;}
	td {text-align: left; vertical-align: top; font-weight: bold; height: 100px;}
	.table th, .table td {border :1px solid #ebebeb;}
	#today {color: red; background-color: #fffbe8;}
</style>

<script type="text/javascript">

	// 1. submit 액션 처리 → 스크립트 제어
	function submitCheck(obj)
	{
		var year = document.getElementById("year");
		var month = document.getElementById("month");
		
		if (year.value == -1)
			year.focus();
		if (month.value == -1)
			month.focus();
		if (year.value != -1 && month.value != -1)
		{
			obj.submit();
		}
	}
	
	// 추가 : 오늘로 돌아가는 버튼
	function selectToday(obj)
	{
		var year = document.getElementById("year");
		var month = document.getElementById("month");
		
		year.value = null;
		month.value = null;
		
		obj.submit();
	}

</script>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 07_01</h1>
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
	<form action="" method="get">
		<select id="year" name="year" onchange="submitCheck(this.form)">
			<!-- <option value="-1">-- 선택하세요 --</option> -->
			<!-- <option value="9998">9998</option> -->
			<!-- <option value="9999">9999</option> -->
			<%
				for(int i=0; i<yearArr.length; i++)
				{
					if (i==10)
						out.print("<option value=" + yearArr[i] + " selected='selected'>" + yearArr[i] + "</option>");
					else
						out.print("<option value=" + yearArr[i] + ">" + yearArr[i] + "</option>");
				}
			%>
		</select> 년
		<select id="month" name="month" onchange="submitCheck(this.form)">
			<!-- <option value="-1">-- 선택하세요 --</option> -->
			<!-- <option value="98">98</option> -->
			<!-- <option value="99">99</option> -->
			<%
				for(int i=1; i<=12; i++)
				{
					//최초 요청이라면..
					if (yearStr == null && monthStr == null)
					{
						if (i == nowMonth)
							out.print("<option value=" + nowMonth + " selected='selected'>" + nowMonth + "</option>");
						else
							out.print("<option value=" + i + ">" + i + "</option>");
					}
					//최초 요청이 아니라면...
					else
					{
						if (i == nMonth)
							out.print("<option value=" + nMonth + " selected='selected'>" + nMonth + "</option>");
						else
							out.print("<option value=" + i + ">" + i + "</option>");
					}
				}
			%>
		</select> 월
		
		<button type="submit" class="btn control" onclick="return selectToday(this.form)" 
		style="margin-left: 520px; border-radius: 20%; height:40px;">오늘로 돌아가기</button>
	</form>
</div>



<br>

<div>
	<!-- 달력을 그리게 될 지점 -->
	<table class="table">
	<tr>
		<th>일</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
		<th>토</th>
	</tr>
	
	<%
		// 달력 그리기
		
		//최초 요청일 때(nowYear, nowMonth, nowDay로 컨트롤하기)
		if(yearStr == null && monthStr == null)
		{
			//달력을 현재 달의 1일로 세팅하기(1일의 요일을 알기 위해)
			cal.set(nowYear, nowMonth-1, 1);
			
			//1일의 요일 알아내기
			int w = cal.get(Calendar.DAY_OF_WEEK);
			
			//System.out.println("w : " + w);
			
			// 테이블에 첫번째 주 공백 칸 만들기
			out.print("<tr>");
			for (int i=1; i<w; i++)
			{
				out.print("<td id='voidCan'>");
				out.print("</td>");
			}
			
			// 테이블에 1일부터 차근차근 넣어주기
			for (int i=1; i<=cal.getActualMaximum(Calendar.DATE); i++)
			{
				if (w%7==1)
				{	out.print("</tr>");
					out.print("<tr>");
				}
				//w++;
				if(i==nowDay)
					out.print("<td id='today'>");
				else
					out.print("<td>");
				out.print(i);
				out.print("</td>");
				w++;
				//System.out.println("하루 넣고 w : " + w);
				
			}
			
			//System.out.println("w : " + w);
			
			// 최종 출력 후 남은 칸 공백 넣어주기
			for(int i=1; i<w; i++, w++)
			{
				if(w%7==1)
				{
					out.print("</tr>");
					break;
				}
				// 최종 출력 후 개행되지 않았을 때(</tr>이 삽입되지 않았을 경우..)
				out.print("<td>");
				out.print("</td>");
				
			}
			
			
			
		}
		
		//최초 요청이 아닐 때(nYear, nMonth로 컨트롤하기)
		else
		{
			//달력을 현재 달의 1일로 세팅하기(1일의 요일을 알기 위해)
			cal.set(nYear, nMonth-1, 1);
			
			//1일의 요일 알아내기
			int w = cal.get(Calendar.DAY_OF_WEEK);
			
			// 테이블에 첫번째 주 공백 칸 만들기
			out.print("<tr>");
			for (int i=1; i<w; i++)
			{
				out.print("<td>");
				out.print("</td>");
			}
			
			// 테이블에 1일부터 차근차근 넣어주기
			for (int i=1; i<=cal.getActualMaximum(Calendar.DATE); i++)
			{
				//w++;
				if (w%7==1)
				{	out.print("</tr>");
					out.print("<tr>");
				}
				out.print("<td>");
				out.print(i);
				out.print("</td>");
				w++;
				
			}
			
			
			/* // 최종 출력 후 남은 칸 공백 넣어주기
			for(int i=1; i<w; i++, w++)
			{
				if(w%7==0)
				{
					out.print("</tr>");
					break;
				}
				// 최종 출력 후 개행되지 않았을 때(</tr>이 삽입되지 않았을 경우..)
				out.print("<td>");
				out.print("</td>");
				
			} */
			
			// 공백(빈 칸 td) 발생
			for (int i=0; i<=w; i++, w++)		//-- 『week++』 → 공백이 발생되는 동안에도 요일 증가
			{
				if (w%7==1)
				{
					out.print("</tr>");
					break;
				}
				
				out.print("<td>");
				out.print("</td>");
				
			}
			
		}
	
	
	%>
	</table>
</div>

</body>
</html>