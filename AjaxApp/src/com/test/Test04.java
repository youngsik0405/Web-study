/*==========================
	Test04.java
===========================*/

package com.test;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test04 extends HttpServlet
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
		
		// 한글 깨짐 방지 처리(AjaxTest04.jsp로부터 한글로 입력받은 addr값이 넘어오기 때문)
		request.setCharacterEncoding("UTF-8");
		
		// 이전 페이지(→ AjaxTest04.jsp)로부터 넘어온 데이터 수신
		//-- addr(→ 동 이름)
		String addr = request.getParameter("addr");
		//-- 서교 or 역삼
		
		// ※ 여기서도 앞에서 처리했던 실습 내용과 마찬가지로
		//    우편번호 데이터베이스가 처리되었다고 가정하고
		//    대신 직접 자료구조 구성
		ArrayList<ZipCodeDTO> lists = new ArrayList<ZipCodeDTO>();
		
		if (addr.indexOf("서교") > -1)
		{
			lists.add(new ZipCodeDTO("04047", "서울특별시 마포구 독막로3길 40 (서교동, 서교동다세대주택)"));
			lists.add(new ZipCodeDTO("04048", "서울특별시 마포구 독막로7길 34 (서교동, 서교빌딩)"));
			lists.add(new ZipCodeDTO("04029", "서울특별시 마포구 동교로 116 (서교동, 서교동교회)"));
			lists.add(new ZipCodeDTO("04030", "서울특별시 마포구 동교로 144-9 (서교동, 서교빌라)"));
			lists.add(new ZipCodeDTO("04031", "서울특별시 마포구 동교로 162-6 (서교동, 서교동다세대빌라)"));
			lists.add(new ZipCodeDTO("04035", "서울특별시 마포구 동교로12길 41-12 (서교동, 서교마임)"));
			lists.add(new ZipCodeDTO("04029", "서울특별시 마포구 동교로12안길 20 (서교동, 서교동정태수다세대주택)"));
			lists.add(new ZipCodeDTO("03997", "서울특별시 마포구 동교로13길 65 (서교동, 서교블레스빌)"));
			lists.add(new ZipCodeDTO("04003", "서울특별시 마포구 동교로15길 4 (서교동, 서교467-4)"));
			lists.add(new ZipCodeDTO("04003", "서울특별시 마포구 동교로15길 7 (서교동, 서교동주민센터)"));
			lists.add(new ZipCodeDTO("04029", "서울특별시 마포구 동교로16길 26 (서교동, 서교벨라스)"));
			lists.add(new ZipCodeDTO("04029", "서울특별시 마포구 동교로16길 28 (서교동, 서교벨라스)"));
			lists.add(new ZipCodeDTO("04002", "서울특별시 마포구 동교로17길 42 (서교동, 서교글로벌센터)"));
		}
		else if (addr.indexOf("역삼") > -1)
		{
			lists.add(new ZipCodeDTO("06252", "서울특별시 강남구 강남대로 324 (역삼동, 역삼디오슈페리움)"));
			lists.add(new ZipCodeDTO("06242", "서울특별시 강남구 강남대로 342 (역삼동, 역삼빌딩)"));
			lists.add(new ZipCodeDTO("06129", "서울특별시 강남구 강남대로 420 (역삼동, 역삼빌딩)"));
			lists.add(new ZipCodeDTO("06254", "서울특별시 강남구 강남대로62길 34 (역삼동, 역삼동839-5공동주택)"));
			lists.add(new ZipCodeDTO("06251", "서울특별시 강남구 강남대로66길 21 (역삼동, 역삼초등학교)"));
			lists.add(new ZipCodeDTO("06240", "서울특별시 강남구 강남대로78길 33-3 (역삼동, 역삼동827-72공동주택)"));
			lists.add(new ZipCodeDTO("06240", "서울특별시 강남구 강남대로84길 24-10 (역삼동, 역삼동빌딩)"));
			lists.add(new ZipCodeDTO("06129", "서울특별시 강남구 강남대로94길 19 (역삼동, 역삼동빌딩)"));
			lists.add(new ZipCodeDTO("06130", "서울특별시 강남구 강남대로94길 57 (역삼동, 역삼동빌딩)"));
			lists.add(new ZipCodeDTO("06262", "서울특별시 강남구 논현로 213 (도곡동, 역삼럭키아파트)"));
		}
		
		request.setAttribute("lists", lists);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test04ok.jsp");
		//RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/Test04ok.jsp");
		
		dispatcher.forward(request, response);

	}
	
}
