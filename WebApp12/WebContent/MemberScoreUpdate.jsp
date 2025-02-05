<%@page import="com.test.MemberScoreDAO"%>
<%@page import="com.test.MemberScoreDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberScoreUpdate.jsp
	
	// 이전 페이지(→ MemberScoreUpdateForm.jsp)로부터 넘어온 데이터 수신
	// → kor, eng, mat + sid
	String sid = request.getParameter("sid");
	String strKor = request.getParameter("kor");
	String strEng = request.getParameter("eng");
	String strMat = request.getParameter("mat");
	//String name = request.getParameter("name");
	
	int kor = 0;
	int eng = 0;
	int mat = 0;
	
	// MemberScoreDAO 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		kor = Integer.parseInt(strKor);
		eng = Integer.parseInt(strEng);
		mat = Integer.parseInt(strMat);
		
		// 데이터베이스 연결
		dao.connection();
		
		MemberScoreDTO score = new MemberScoreDTO();
		score.setSid(sid);
		score.setKor(kor);
		score.setEng(eng);
		score.setMat(mat);
		
		//score.setName(name);
		
		dao.modify(score);
		
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터베이스 연결 끊기
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 변경된 URL로 다시 요청할 수 있도록 안내
	response.sendRedirect("MemberScoreList.jsp");

%>
