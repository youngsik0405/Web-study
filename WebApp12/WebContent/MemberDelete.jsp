<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberDelete.jsp
	
	// 이전 페이지(→ MemberList.jsp)로부터 넘어온 데이터 수신
	// → sid
	String sid = request.getParameter("sid");

	MemberDAO dao = new MemberDAO();
	
	// 사용자에게 다시 요청할 수 있도록 안내하는 주소 문자열
	// --> 상황에 따라 다른 문자열주소 제공
	String strAddr = "";
	
	try
	{
		dao.connection();
		
		//dao.remove(sid);
		
		// 참조 레코드 수 확인
		int checkCount = dao.refCount(sid);
		//-- TBL_MEMBER(→ 부모) 테이블의 제거하고자 하는 데이터의
		//   SID 를 참조하는 TBL_MEMBERSCORE(→ 자식) 테이블 내의 데이터 갯수 확인
		
		if (checkCount == 0)	//-- 제거 가능
		{
			dao.remove(sid);
			strAddr = "MemberList.jsp";
		}
		else					//-- 제거 불가
		{
			//dao.remove(sid);
			//-- TBL_MEMBERSCORE 테이블의 데이터가 TBL_MEMBER 테이블의 데이터를
			//   참조하고 있는 경우로 삭제가 불가능한 상황
			//	 → 제거하지 못하는 사유를 안내할 수 있는 페이지로 이동
			//      + 리스트로 돌아갈 수 있는 방법 제공
			strAddr = "Notice.jsp";
		}
		
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
	
	// check~!!!
	response.sendRedirect(strAddr);
	
	
// 나머지 보여주는 코드 모두 제거~!!!
%>
