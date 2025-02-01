<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	//-- 이전 페이지로부터 데이터를 넘겨받아
	//   데이터베이스의 테이블 TBL_MEMBER 에 회원 데이터 추가 액션 처리 수행
	//   ... 이후, 다시 리스트 페이지(MemberList.jsp)를 요청할 수 있도록 안내
	
	// 인코딩 설정
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지(→ MemberInsertForm.jsp)로부터 넘어온 데이터 수신
	// → uName, uTel
	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	
	// MemberDAO 객체 생성
	MemberDAO dao = new MemberDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// MemberDTO 객체 생성 및 속성 구성
		// → dao 의 add() 메소드 호출 위해 필요
		MemberDTO member = new MemberDTO();
		
		member.setName(uName);
		member.setTel(uTel);
		
		// insert 쿼리문을 수행하는 dao 의 add() 메소드 호출
		dao.add(member);
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
	
	// check~!!!
	// 클라이언트가 MemberList.jsp 페이지를 다시 요청할 수 있도록 안내
	response.sendRedirect("MemberList.jsp");
	
// 아래 보여주는 코드 모두 제거	
%>