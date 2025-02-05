<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ScoreInsert.jsp
	
	// 인코딩방식 세팅
	request.setCharacterEncoding("UTF-8");

	// 요청 받아오기
	String userName = request.getParameter("userName");
	String userKor = request.getParameter("userKor");
	String userEng = request.getParameter("userEng");
	String userMat = request.getParameter("userMat");
	
	
	ScoreDAO dao = null;

	try
	{
		dao = new ScoreDAO();
		
		// ScoreDTO 객체 구성
		ScoreDTO dto = new ScoreDTO();
		dto.setName(userName);
		dto.setKor(userKor);
		dto.setEng(userEng);
		dto.setMat(userMat);
		
		// DB에 데이터 넣기
		dao.add(dto);
		
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