/*=============================================
	MVCTest01.java
	- Controller 역할을 수행할 서블릿 클래스
===============================================*/

package com.svt;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCTest01 extends HttpServlet
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
		
		// 업무 구성(처리)
		//-- 1 부터 100 까지의 수를 객체(컬렉션)에 저장하는 과정
		
		//어차피 결과물을 문자 형태로 뿌릴 거라 String으로 구성한 것.
		//숫자 형태로 넣겠다~ 했으면 Integer로 하면 됨
		List<String> lists = new ArrayList<String>();
		
		for (int i=1; i<=100; i++)	// i : 1 ~ 100
		{
			lists.add(String.valueOf(i));
		}
		
		request.setAttribute("lists", lists);

		
		// 뷰(View → MVCTest01.jsp)에 제어권 넘김
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/MVCTest01.jsp");
		dispatcher.forward(request, response);
		
	}
	
}
