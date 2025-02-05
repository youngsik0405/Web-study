<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 데이터 수신 이전에 한글 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");						// check~!!!
	//(넘긴 쪽에서 UTF-16 or EUC-KR 으로 넘겼다~ 받을 때도 UTF-16 or EUC-KR 으로 받으면 한글 안 깨짐.
	// 그런데 우리는 작업환경 자체를 전부 UTF-8로 맞춰놨기 때문에 맞춰서 UTF-8로 세팅하라는 것 뿐..)
	
	// 이전 페이지(RadioSelect.jsp)로부터 넘어온 데이터 수신
	// → name, gender, major, hobby
	String nameStr = request.getParameter("name");				//-- 텍스트박스... 단일값 수신
	String genderStr = request.getParameter("gender");			//-- 라디오버튼... 단일값 수신
	String majorStr = request.getParameter("major");			//-- 선택상자...   단일값 수신
	// check~!!!
	String[] hobbyArr = request.getParameterValues("hobby");	//-- 선택상자...   다중값 수신
	//-- 다중 선택이 가능한 선택상자일 경우...
	//   『getParameterValues()』로 데이터 수신
	//   → 배열 반환
	
	
	// 수신된 데이터에 대한 처리
	
	// name → 특이사항 없음~!!!
	
	// gender
	String gender = "";
	if (genderStr.equals("M"))
		gender = "남자";
	else if (genderStr.equals("F"))
		gender = "여자";
	else
		gender = "성별확인불가";
	
	// major → 특이사항 없음~!!!
	
	// hobby
	String hobby = "";
	// 배열을 수신했을 때는 항상 배열값이 제대로 채워져있는지 확인 후 처리
	if (hobbyArr != null)
	{
		for (String item : hobbyArr)
			hobby += "[" + item + "] ";
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReaioSelectOk.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {color: red; font-weight: bold;}
</style>

</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<p>RadioSelect.jsp → <span>RadioSelectOk.jsp</span></p>
	<hr>
</div>

<div>
	<h2>radio, select 데이터 수신 결과 확인</h2>
	
	<div>
		<!-- <p>이름 : 박세진</p> -->
		<p>이름 : <%=nameStr %></p>
		
		<!-- <p>성별 : M(남자)</p> -->
		<p>성별 : <%=genderStr %>(<%=gender %>)</p>
		
		<!-- <p>전공 : 국문학</p> -->
		<p>전공 : <%=majorStr %></p>
		
		<!-- <p>취미 : [영화감상] [암벽등반] [종이접기]</p> -->
		<p>취미 : <%=hobby %></p>
	</div>
</div>









</body>
</html>