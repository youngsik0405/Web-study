<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Redirect11.jsp)로부터 넘어온 데이터 수신
	// → result
	//String result = request.getParameter("result");
	
	// "Receive12.jsp?num1=" + num1 + "&num2=" + num2 + "&op=" + op + "&result=" + result
	// → num1, num2, op + result
	//-- 직접 Redirect11.jsp 로부터 데이터를 넘겨받는 것이 아니라
	//   클라이언트가 새로운 요청을 하는 과정에서 넘긴 값을 새롭게 수신하게 되는 개념~!!!
	//---------> 이전 페이지가 가진 데이터를 넘겨주는 게 아니라,
	//           이전 페이지에서는 클라이언트한테 이 새 주소로 가세요~라고 안내해주는 것 뿐.
	//           다만, 이렇게 get방식으로 주소를 꾸린 경우에는 이전 페이지에서 이 값 이 값 적어가라고 쪽지 적어준 것 뿐..
	//       포워딩이 훨씬 더 효율적인데 리다이렉트를 버릴 수 없는 이유..
	//         input에 데이터를 넣을 때 DB상에 그 데이터를 insert하라고 하고 싶어..
	//         그런데 DB상에 잘 들어갔는지 확인하려면 새로고침을 해야하니까 ->
	//		   그럴 때는 클라이언트한테 새로고침하라고 리다이렉트 시킬 수밖에 없음.
	
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String op = request.getParameter("op");
	String result = request.getParameter("result");
	
	if (op.equals("1"))
		op = "+";
	else if (op.equals("2"))
		op = "-";
	else if (op.equals("3"))
		op = "*";
	else if (op.equals("4"))
		op = "/";
	
	String strResult = String.format("%s %s %s = %s", num1, op, num2, result);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive12.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 12</h1>
	<hr>
</div>

<div>
	<!-- <h2>연산 결과 : xxx</h2> -->
	<%-- <h2>연산 결과 : <%=result %></h2> --%>
	
	<h2><%=strResult %></h2>
</div>

</body>
</html>