/*==========================
	Test02.java
===========================*/

package com.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test02 extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식일 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// 서블릿 관련 코드 구성
		
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		// 이전 페이지(→ AjaxTest02.jsp)로부터 넘어온 데이터 수신
		//-- n1, n2
		int n1 = Integer.parseInt(request.getParameter("n1"));
		int n2 = Integer.parseInt(request.getParameter("n2"));
		
		// 덧셈 로직을 처리하는 모듈을 따로 만들어도 되지만, 여기서 그냥 컨트롤러 처리도 같이 해버리기
		// 업무 로직 처리(덧셈 연산 처리)
		int result = n1 + n2;
		
		// 반환할 결과값 준비
		request.setAttribute("result", result);
		
		// 요청 내용 전달
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test02ok.jsp");
		dispatcher.forward(request, response);
		

	}
	
}
