/*==========================
	MVCTest02.java
	- Controller 역할을 수행할 서블릿 클래스
===========================*/

package com.svt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.MVCTest02Model;

public class MVCTest02 extends HttpServlet
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
		
		
		// 모델 객체 생성 및 액션 처리 → 모델이 처리한 결과 수신(→ View 페이지 정보 획득)
		MVCTest02Model model = new MVCTest02Model();
		String view = model.actionCount(request, response);
		//     반환받은 view는 view페이지에 대한 조언이나 추천.
		
		// ......... 추천이 마음에 들지 않는다면 view를 다른 형태로 갱신할 수도 있음.
		
		//     추천이 마음에 들었다면... 이렇게 view 넘겨주면 됨.
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
		
	}
	
}
