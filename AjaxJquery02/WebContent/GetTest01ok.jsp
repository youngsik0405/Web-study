<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// GetTest01ok.jsp
	
	//String nickName = request.getParameter("nickName");
%>
<%-- <%=nickName%>님 안녕하세요.<br>반갑습니다. --%>

<%-- setAttribute한 게 아니라 request의 param값이니까 EL로 쓰려면 param.을 앞에 붙여줘야 한다!!! --%>
${param.nickName}님 안녕하세요.<br>반갑습니다.