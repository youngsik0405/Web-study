<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberScoreUpdate.jsp
	// 이전 페이지로부터 넘어온 데이터 수신
	// → kor, eng, mat + sid
	String sid = request.getParameter("sid");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	MemberScoreDAO dao = new MemberScoreDAO();
	
	int kor = 0;
	int eng = 0;
	int mat = 0;
	
	try
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
		
		dao.connection();
		
		MemberScoreDTO score = new MemberScoreDTO();
		score.setSid(sid);
		score.setKor(kor);
		score.setEng(eng);
		score.setMat(mat);
		
		dao.modify(score);
		
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
	
	// 변경된 URL로 다시 요청할 수 있도록 안내
	response.sendRedirect("MemberScoreList.jsp");
%>

<!DOCTYPE html>
<html>
<head>
