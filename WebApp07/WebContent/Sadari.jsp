<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String strCount = request.getParameter("count");
	int count = 1;  
	
	if (strCount != null)
	    count = Integer.parseInt(strCount);
	  
	String action = request.getParameter("action");
	
	if (action != null)
	{
	    if (action.equals("increase"))
	        count++;
	    else if (action.equals("decrease") && count > 1)
	        count--;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사다리 게임</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	* {
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	    text-align: center;
	    font-family: 'Noto Sans KR', sans-serif;
	}
	
	body {
	    background-color: #f5f5f5;
	    padding: 20px;
	}
	
	h1 {
	    color: #333;
	    margin: 20px 0;
	    font-weight: 700;
	}
	
	hr {
	    border: none;
	    border-top: 2px solid #ddd;
	    margin: 20px auto;
	    width: 80%;
	    max-width: 800px;
	}
	
	.btn {
	    display: inline-block;
	    text-decoration: none;
	    font-size: 25pt;
	    color: #4a90e2;
	    width: 40px;
	    height: 40px;
	    line-height: 35px;
	    border: 2px solid #4a90e2;
	    border-radius: 50%;
	    margin: 0 15px;
	    transition: all 0.3s ease;
	}
	
	.btn:hover {
	    background-color: #4a90e2;
	    color: white;
	}
	
	.txt {
	    width: 50px !important;
	    height: 40px;
	    border: 2px solid #ddd;
	    border-radius: 5px;
	    text-align: center;
	    font-size: 18pt;
	    background-color: white;
	}
	
	form {
	    max-width: 600px;
	    margin: 0 auto;
	    background-color: white;
	    padding: 30px;
	    border-radius: 10px;
	    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
	}
	
	input[type="text"] {
	    width: 200px;
	    height: 40px;
	    margin: 5px;
	    padding: 0 15px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    font-size: 14px;
	    transition: border-color 0.3s ease;
	}
	
	input[type="text"]:focus {
	    outline: none;
	    border-color: #4a90e2;
	}
	
	input[type="submit"] {
	    background-color: #4a90e2;
	    color: white;
	    border: none;
	    padding: 12px 30px;
	    border-radius: 5px;
	    font-size: 16px;
	    cursor: pointer;
	    transition: background-color 0.3s ease;
	    margin-top: 20px;
	}
	
	input[type="submit"]:hover {
	    background-color: #357abd;
	}
	
	a[style*="font-size: 20pt"] {
	    display: inline-block;
	    text-decoration: none;
	    color: #4a90e2;
	    font-weight: 500;
	    margin: 20px 0;
	    transition: color 0.3s ease;
	}
	
	a[style*="font-size: 20pt"]:hover {
	    color: #357abd;
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
	<input type="text" name="count" class="txt" value=<%=count %> style="width: 50px;" readonly="readonly">
	<a href="Sadari.jsp?action=increase&count=<%=count%>" class="btn">+</a>
	<br><br>
	<a href="Sadari.jsp?action=start&count=<%=count%>" style="font-size: 20pt;">시 작</a>
	<br><br>
</div>

<% if (action != null && action.equals("start")) 
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
<% } %>

</body>
</html>