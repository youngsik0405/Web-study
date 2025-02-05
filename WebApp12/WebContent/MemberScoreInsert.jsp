<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberScoreInsert.jsp
	
	// 이전 페이지(→ MemberScoreInsertForm.jsp)로부터 넘어온 데이터 수신
	// → kor, eng, mat, sid
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	String sid = request.getParameter("sid");
	
	// MemberScoreDAO 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	request.setCharacterEncoding("UTF-8");


	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// 수신된 데이터로 MemberScoreDTO 생성 및 속성 구성 → add() 메소드의 매개변수로 전달
		MemberScoreDTO dto = new MemberScoreDTO();
		dto.setKor(Integer.parseInt(kor));
		dto.setEng(Integer.parseInt(eng));
		dto.setMat(Integer.parseInt(mat));
		dto.setSid(sid);
		
		
		// dao 의 add() 메소드 호출 → 데이터 입력(insert 쿼리문 수행)
		dao.add(dto);
		
		// 위의 메소드가 반환하는 값에 따라 결과 분기 처리 가능~!!!
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{	
			// 데이터베이스 연결 종료
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	response.sendRedirect("MemberScoreList.jsp");

%>