<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberScoreDelete.jsp
	
	// 이전 페이지(→MemberScoreList.jsp)로부터 넘어온 데이터 수신
	// → sid
	String sid = request.getParameter("sid");

	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		dao.remove(sid);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	response.sendRedirect("MemberScoreList.jsp");
%>
