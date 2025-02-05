<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%--
<%
	List<MemberDTO> lists = new ArrayList<MemberDTO>();

	MemberDTO ob = new MemberDTO();
	
	
	String[] names = request.getParameterValues("name");
	String[] tels = request.getParameterValues("tel");
	String[] addrs = request.getParameterValues("addr");
	
	for(int i=0; i<names.length; i++)
	{
		ob = new MemberDTO(names[i], tels[i], addrs[i]);
		lists.add(ob);
	}
	
	request.setAttribute("lists", lists);
%>
--%>
<%--
<%
	List<MemberDTO> lists = new ArrayList<MemberDTO>();

	MemberDTO ob = new MemberDTO();
	
	String name = "";
	String tel = "";
	String addr = "";
	for(int i=1; i<=5; i++)
	{
		name = request.getParameter("name" + i);
		tel = request.getParameter("tel" + i);
		addr = request.getParameter("addr" + i);
		ob = new MemberDTO(name, tel, addr);
		lists.add(ob);
	}
	
	request.setAttribute("lists", lists);
%>
--%>

<%
	// MemberDTO 를 요소로 취하는 자료구조 생성
	List<MemberDTO> lists = new ArrayList<MemberDTO>();

	for(int i=1; i<=5; i++)
	{
		MemberDTO ob = new MemberDTO(request.getParameter("name"+i)
								   , request.getParameter("tel"+i)
								   , request.getParameter("addr"+i));
		
		lists.add(ob);
	}
	
	request.setAttribute("lists", lists);
	
%>
<jsp:forward page="MemberList.jsp"></jsp:forward>
