<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Logout.jsp
	//-- 세션의 속성을 제거하여 로그아웃 액션 처리
	
	session.removeAttribute("userId");
	session.removeAttribute("userName");
	//-- 세션의 사용자 아이디, 이름 삭제
	
	// 기존 세션에 저장되어 있는 모~~~ 든 속성을 제거하고
	// 세션을 초기화 (세션 자체를 클리어)
	session.invalidate();
	
	// 클라이언트에 다시 로그인 페이지를 요청할 수 있도록 안내
	response.sendRedirect("TestSession01.jsp");
	
%>