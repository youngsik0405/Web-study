<%@page import="java.sql.Statement"%>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.State"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	
	// 이전 페이지(Test002.jsp)로부터 넘어온 데이터 수신
	// → userName, userTel
	
	// 한글 데이터 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");

	String uName = request.getParameter("userName");
	String uTel = request.getParameter("userTel");

	// ※ 수신한 데이터를 활용하여 데이터베이스 액션처리
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비(→ insert 쿼리문)
	String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '%s', '%s')", uName, uTel);
	
	// 작업 객체 생성 및 쿼리문 실행 → executeUpdate() → 적용된 행의 갯수 반환
	Statement stmt = conn.createStatement();
	int result = 0;
	
	result = stmt.executeUpdate(sql);
	
	stmt.close();
	DBConn.close();
	
	if (result < 1) //-- 적용된 행의 갯수가 1미만
	{
		// → 에러 페이지를 요청할 수 있도록 안내
		response.sendRedirect("ErrorTest002.jsp");
		//-- 처리 과정에서 문제가 발생했으니...
		//   이와 관련한 안내 페이지를 다시 요청해서 찾아가보도록 해~!!!
	}
	else  			//-- 적용된 행의 갯수가 1 미만 아님
	{
		// → 현재 페이지에서 정상 입력 안내(생략)
		// → 이전 페이지를 다시 요청할 수 있도록 안내
		response.sendRedirect("Test002.jsp");
		//-- 이 페이지로 넘어오기 전에 네가 머물던 리스트 페이지 주소를 다시 요청해서 찾아가봐~!!!
		//   그러면 네가 입력해달라고 요청한 데이처가 추가된 상태로 리스트의 내용이 변경되어 있을꺼야~!!!
	}
	
	
%>
