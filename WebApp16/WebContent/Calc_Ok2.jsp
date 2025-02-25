<%@page import="com.test.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(→ Calc.jsp)로부터 넘어온 데이터 수신
	// → su1, su2, op
	/*
	String strSu1 = request.getParameter("su1");
	String strSu2 = request.getParameter("su2");
	String op = request.getParameter("op");
	
	int su1, su2;
	su1 = su2 = 0;
	String str = "";
	
	if (strSu1==null || strSu2==null)
	{
		response.sendRedirect("Calc.jsp");
	}
	else
	{
		su1 = Integer.parseInt(strSu1);
		su2 = Integer.parseInt(strSu2);
		
		// 자바에서 우리가 설계한 클래스를 사용하기 위해... → 객체 생성
		Calc ob = new Calc();
		//-- 이클립스 자동완성 기능을 사용하여 구문을 작성할 경우
		//   『@page import="com.test.Calc"』 구문도 함께 생성되어 처리됨.
		//   혹은, 자동완성 기능을 사용하지 않을 경우
		//   『@page import="com.test.Calc"』 구문을 우리가 직접 작성해서
		//   해당 클래스를 사용할 수 있도록 처리해 주어야 함.
		//   또는
		//   『com.test.Calc ob = new com.test.Calc();』와 같이
		//   생성 구문에 직접 함께 작성하는 것도 가능함.
		
		ob.setSu1(su1);
		ob.setSu2(su2);
		ob.setOp(op);
		
		str = ob.result();
		
	}
	*/

%>

<%
	/*
	String strSu1 = request.getParameter("su1");
	int su1 = Integer.parseInt(strSu1);
	String strSu2 = request.getParameter("su2");
	int su2 = Integer.parseInt(strSu2);
	String op = request.getParameter("op");
	*/
%>

<!-- 서블릿컨테이너에게.. 객체(Bean)를 사용해줘(use).
그 객체 설계도는 com.test.Calc에 있어. 네가 설계도 보고 ob라는 id를 붙여서 객체를 생성해줘 -->
<!-- ※ Calc 클래스의 객체를 현재 페이지에서 사용할 수 있도록 지정 -->
<jsp:useBean id="ob" class="com.test.Calc"></jsp:useBean>
<!-- 이 구문은 스크립릿 영역에서
	 『com.test.Calc ob = new com.test.Calc();』
	 구분을 작성하여 import 구문을 자동으로 처리한 것과
	 마찬가지 효과를 적용하게 된다. -->
	 
<!-- op 객체의 su1 속성에... value값 su1을 넣어줘 -->
<!-- ※ request.getParameter() 메소드를 통해 넘겨받은(전달받은) 데이터를
        『Calc』 클래스 기반으로 만들어진 『ob』 객체에 넘겨주기 위한 속성 지정 -->
<%-- <jsp:setProperty property="su1" name="ob" value="<%=su1 %>"/> --%>
<!-- 이 구문은 스크립릿 영역에서
     『ob.setSu1(su1);』
     구문과 같은 효과를 적용하게 된다. -->

<%-- <jsp:setProperty property="su2" name="ob" value="<%=su2 %>"/> --%>
<%-- <jsp:setProperty property="op" name="ob" value="<%=op %>"/> --%>

<!-- check~!!! -->
<!-- ※ 객체의 속성명과 동일한 파라미터인 경우
        『request.getParameter()』 메소드 없이 바로 받을 수 있으며
        value 속성을 통해 넘겨주지 않아도 데이터 바인딩이 가능하다. -->
<jsp:setProperty property="su1" name="ob"/>
<jsp:setProperty property="su2" name="ob"/>
<jsp:setProperty property="op" name="ob"/>
<!-- ① request.getParameter() 처리 → 매개변수를 전달하기 위한 데이터 수신 처리 -->
<!-- ② Integer.parseInt() 처리 → 매개변수를 전달하기 위한 형(type) 변환 처리 -->
<!-- ③ ob.su1 → ob.setSu1() 호출 처리
<!--    ob.su2 → ob.setSu2() 호출 처리
		ob.op  → ob.setOp() 호출 처리 -->
<!-- ==> 최종적으로 ob → Calc 기반의 ob 객체의 각각의 속성에
         이전 페이지로부터 넘겨받은 데이터를 적절한 타입(형)으로 변환하여 전달 -->





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok2.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>두 번째 방법 처리 결과</h1>
	<hr>
</div>

<div>
	<!-- <h2>결과</h2> -->
	<h2><%=ob.result() %></h2>
</div>

</body>
</html>