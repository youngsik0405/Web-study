<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberUpdate.jsp
	//-- 이전 페이지로부터 데이터를 넘겨받아
	//   데이터베이스의 테이블 TBL_MEMBER 에 회원 데이터 수정 액션 처리 수행
	//   ... 이후, 다시 리스트 페이지(MemberList.jsp)를 요청할 수 있도록 안내
	
	// 인코딩 설정
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지(→ MemberUpdateForm.jsp)로부터 넘어온 데이터 수신
	// → sid, uName, uTel
	
	String sid = request.getParameter("sid");
	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	
	// MemberDAO 객체 생성
	MemberDAO dao = new MemberDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// MemberDTO 객체 생성 및 속성 구성
		// → dao 의 modify() 메소드 호출 위해 필요
		MemberDTO member = new MemberDTO();
		member.setSid(sid);
		member.setName(uName);
		member.setTel(uTel);
		
		// update 쿼리문을 수행하는 dao 의 modify() 메소드 호출
		dao.modify(member);
		
		// 이후 반환 결과에 따른 분기 처리 가능~!!!
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
	
	// 클라이언트에 MemberList.jsp 페이지를 다시 요청할 수 있도록 안내
	response.sendRedirect("MemberList.jsp");
	
	
// 이후 보여지는 페이지 구성 모두 삭제
%>