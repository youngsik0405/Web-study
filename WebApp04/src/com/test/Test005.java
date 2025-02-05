/*==================
	Test005.java
	- Servlet 실습
===================*/

// 현재... 자바의 기본 클래스 Test004
// 이를 Servlet 으로 구성하는 방법

// HttpServlet 을 상속받는 클래스로 설계 → Servlet

package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//public class Test005
public class Test005 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식의 요청에 대해 처리하는 코드
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식일 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// POST 방식의 요청에 대해 처리하는 코드
		doGetPost(request, response);
	}
	
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		// request → 요청 객체
		// → 클라이언트로부터 서버로... 전송된 데이터...를 담고있는 객체
		// request 객체에 대한 세팅 → 인코딩 방식 세팅(처리) → 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
		
		// 클라이언트로부터 데이터 수신
		String id = request.getParameter("userId");		// "superman"
		String pwd = request.getParameter("userPwd");	// "java006"
		
		// response → 응답 객체
		// → 서버로부터 클라이언트로...
		response.setContentType("text/html; charset=UTF-8");
		
		// 문자열 변수 선언(str) → 변수에 수신한 데이터 담아내기
		String str = "아이디 : " + id + ", 패스워드 : " + pwd;
		
		// 응답을 출력 스트림으로 구성하기 위한 준비
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"UTF-8\">");
		out.println("<title>Test005.java</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("");
		out.println("<div>");
		out.println("	<h1>서블릿 관련 실습</h1>");
		out.println("	<hr>");
		out.println("</div>");
		out.println("");
		out.println("<div>");
		out.println("	<h2>HttpServlet 클래스를 이용한 서블릿 테스트</h2>");
		out.println("	");
		/* out.println("	<p>결과확인</p>"); */
		out.println("	<p>" + str + "</p>");
		out.println("</div>");
		out.println("");
		out.println("</body>");
		out.println("</html>");
	}
	
}
