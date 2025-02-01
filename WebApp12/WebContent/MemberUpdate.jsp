<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberUpdate.jsp
	request.setCharacterEncoding("UTF-8");
	
	String sid = request.getParameter("sid");
	String name = request.getParameter("uName");
	String tel = request.getParameter("uTel");
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		
		MemberDTO member = new MemberDTO();
		
		member.setSid(sid);
		member.setName(name);
		member.setTel(tel);
		
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
	
// 이후 보여지는 페이지 구성 삭제
%>