<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// count, action을 수신
	String strCount = request.getParameter("count");
	String action = request.getParameter("action");
	
	// count를 1로 초기화
	int count = 1;  
	
	// count가 null이 아닐 경우 
	if (strCount != null)
	    count = Integer.parseInt(strCount);
	
	// action이 null이 아닐 경우
	if (action != null)
	{
		// + 버튼을 누를 경우 count 값이 1씩 증가
	    if (action.equals("increase"))
	        count++;
	 	// - 버튼을 누를 경우 count 값이 1씩 감소
	    else if (action.equals("decrease") && count > 1)
	        count--;
	}
	
	String str = "";
	
	// 시작을 누를 경우 테이블을 생성(참가자, 결과를 입력을 위한 테이블)
	if (action != null && action.equals("start")) 
	{
	    str += "<div>";
	    str += "<form action='Result.jsp' method='post'>";
	    str += "<table>";
	    
	    str += "<tr>";
	    for (int i = 1; i <= count; i++) 
	    {
	        str += "<td><input type='text' name='input" + i + "' placeholder='참가자'></td>";
	    }
	    str += "</tr>";
	    
	    str += "<tr>";
	    for (int i = 1; i <= count; i++) 
	    {
	        str += "<td><input type='text' name='result" + i + "' placeholder='결과'></td>";
	    }
	    str += "</tr>";

	    str += "</table><br>";
	    str += "<input type='submit' value='사다리 시작'>";
	    str += "</form>";
	    str += "</div>";
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사다리 게임</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	* 
	{
	    text-align: center;
	    margin: 0;
	    padding: 0;
	}
	
	body 
	{
	 	background-color: #f5f5f5;
	    align-items: center;
	    display: flex;
	    flex-direction: column;
	    min-height: 100vh;
	}
	
	table 
	{
	    margin: 0 auto;
	    width: auto;
	}
	
	form 
	{
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    width: 100%;
	}
	
	input[type="text"] 
	{
	    margin: 5px;
	    padding: 5px;
	}
	
	.btn 
	{
	    text-decoration: none;
	    font-size: 20pt;
	    margin: 0 10px;
	}
	
	.txt 
	{
	    width: 50px;
	    text-align: center;
	    margin: 0 10px;
	}

</style>

</head>
<body>

<div>
	<h1>사다리 게임</h1>
	<hr>
</div>

<div>
	<a href="Sadari.jsp?action=decrease&count=<%=count%>" class="btn">-</a>
	<input type="text" name="count" class="txt" value=<%=count%> style="width: 50px;" readonly="readonly">
	<a href="Sadari.jsp?action=increase&count=<%=count%>" class="btn">+</a>
	<br><br>
	<a href="Sadari.jsp?action=start&count=<%=count%>" style="font-size: 20pt;">시 작</a>
	<br><br>
</div>


<%-- <% if (action != null && action.equals("start")) 
   { 
%>
    <div>
        <form action="Result.jsp" method="post">
            <%
                for (int i = 1; i <= count; i++) 
                {
            %>
	                <input type="text" name="input<%=i%>" placeholder="참가자"> 
	                <input type="text" name="result<%=i%>" placeholder="결과"><br>
            <%
                }
            %>
            <br>
            <input type="submit" value="사다리 시작">
        </form>
    </div>
<% } %> --%>

<%=str %>

</body>
</html>