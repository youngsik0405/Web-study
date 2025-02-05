<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ScoreDelete.jsp
	
	// 인코딩방식 세팅
	request.setCharacterEncoding("UTF-8");

	// 요청 받아오기
	String userSid = request.getParameter("userSid");

	ScoreDAO dao = null;

	try
	{
		dao = new ScoreDAO();
		
		// DB의 데이터 삭제
		int result = dao.delete(userSid);
		
		if (result != 1)
			System.out.println("해당 학생 찾기 불가~!");
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 연결 닫기
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// ScoreList.jsp 페이지로 리다이렉트
	response.sendRedirect("ScoreList.jsp");
%>