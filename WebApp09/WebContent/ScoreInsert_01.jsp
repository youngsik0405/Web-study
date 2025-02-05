<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//ScoreInsert_01.jsp
	// 이전 페이지(ScoreList_01.jsp)로부터 넘어온 데이터 수신
	// → userName, userKor, userEng, userMat
	
	request.setCharacterEncoding("UTF-8");
	String nameStr = request.getParameter("userName");
	String korStr = request.getParameter("userKor");
	String engStr = request.getParameter("userEng");
	String matStr = request.getParameter("userMat");
	
	// DB연결
	Connection conn = DBConn.getConnection();
	
	// 작업객체 생성
	Statement sttm = conn.createStatement();
	
	int kor, eng, mat;
	kor=eng=mat=0;
	String sql = "";
	
	try
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
		
		sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
						  + " VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)", nameStr, kor, eng, mat);
		
		// 작업객체 실행
		int result = sttm.executeUpdate(sql);
		
		if (result == 1)
		{
			response.sendRedirect("ScoreList_01.jsp");
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	

%>