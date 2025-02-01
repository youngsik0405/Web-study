<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로부터 넘어온 데이터 수신
	// → name, kor, eng, mat
	
	// 한글 데이터 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	
	String mName = request.getParameter("name");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matSTr = request.getParameter("mat");
	
	int mKor =0;
	int mEng =0;	
	int mMat =0;
	
	if (korStr != null || engStr != null || matSTr != null)
	{
		 mKor = Integer.parseInt(korStr);
		 mEng = Integer.parseInt(engStr);
		 mMat = Integer.parseInt(matSTr);
	}
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비(→ insert)
	String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)", mName, mKor, mEng, mMat);

	Statement stmt = conn.createStatement();
	int result = 0;
	
	result = stmt.executeUpdate(sql);
	
	stmt.close();
	DBConn.close();
	
	if (result < 1)
	{
		response.sendRedirect("Error.jsp");
	}
	else  		
	{
		response.sendRedirect("ScoreList.jsp");
	}
	
%>