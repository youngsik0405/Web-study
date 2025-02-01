<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// MemberDTO 를 요소로 취하는 자료구조 생성
	List<MemberDTO> lists = new ArrayList<MemberDTO>();

	for (int i=1; i<=5; i++)
	{
		MemberDTO dto = new MemberDTO(
									  request.getParameter("name"+i)
									, request.getParameter("tel"+i)
									, request.getParameter("addr"+i));
		
		lists.add(dto);
	}
	
	request.setAttribute("lists", lists);
	
	/* 나의 풀이
	List<MemberDTO> lists = new ArrayList<MemberDTO>();

	for (int i=1; i<=5; i++)
	{
		MemberDTO dto = new MemberDTO(request.getParameter("name"+i), request.getParameter("tel"+i), request.getParameter("addr"+i));
		
		lists.add(dto);
	}

	request.setAttribute("lists", lists);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("MemberList.jsp");
    dispatcher.forward(request, response);
     */
%>

<jsp:forward page="MemberList.jsp"></jsp:forward>