/*====================
	Test004.java
	- Servlet 실습
==================== */

// 현재... 자바의 기본 클래스 Test004
// 이를 Servlet 으로 구성하는 방법

// GenericServlet 을 상속받는 클래스로 설계 → Servlet

package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

//public class Test004
//public class Test004 implements Servlet
public class Test004 extends GenericServlet
{
	//다 쓰고 나니까 Test004에 밑줄쳐지고 경고창 떠있어서 line25 자동삽입.
	//(우리가 out.print()하는 동안 그 사이에 다른 게 끼어들면 안되니까, 서블릿컨테이너가 객체직렬화를 잘 할 수 있도록 끼워넣는구문?)
	private static final long serialVersionUID = 1L;

	// GenericServlet 의 추상 메소드 재정의~!!! (새로고침할 때마다(요청이 있을 때마다) service 메소드가 매번 호출된다)
	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException
	{
		// 요청에 대한 응답 처리 (서블릿컨테이너에 의해 service 메소드가 호출될 때마다 이렇게 응답할 거야..)
		
		// 요청에 대한 응답 방법 (이렇게 응답할 거야)
		response.setContentType("text/html; charset=UTF-8");	//text를 기반으로 UTF-8방식으로 해석한 거를 넘길테니까 알아서 해석해~
		
		try
		{
			// 출력 스트림 구성
			PrintWriter out = response.getWriter();			//마우스 갖다대니까 getWrite()함수의 반환형이 PrintWriter 이므로 그에 맞춰서 out 변수 선언
			
			out.print("<html>");
			out.print("<head>");
			out.print("<title>");
			out.print("Test004.java");
			out.print("</title>");
			out.print("</head>");
			
			out.print("<body>");
			out.print("<div>");
			out.print("<h1>");
			out.print("서블릿 관련 실습 및 관찰");
			out.print("</h1>");
			out.print("<hr>");
			out.print("</div>");
			
			out.print("<div>");
			out.print("<h2>");
			out.print("&lt;GenericServlet 클래스를 이용한 서블릿 테스트&gt;");
			out.print("</h2>");
			out.print("</div>");
			
			out.print("</body>");
			
			out.print("</html>");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
	}

}
