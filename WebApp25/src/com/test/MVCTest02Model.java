/*=================================
	MVCTest02Model.java
	- Model 역할을 수행할 클래스
	- 비즈니스 로직 처리
==================================*/

package com.test;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCTest02Model
{
	public String actionCount(HttpServletRequest request, HttpServletResponse response)
	{
		String result = "";
		
		// 업무 구성(처리)
		//-- 1 부터 100 까지의 수를 객체(컬렉션)에 저장하는 과정
		List<String> lists = new ArrayList<String>();
		
		for (int i=1; i<=100; i++)	// i : 1 ~ 100
		{
			lists.add(String.valueOf(i));
		}
		
		// 매개변수로 받은(컨트롤러가 넘겨준 요청) request에 setAttribute할 수 있음
		request.setAttribute("modelActionResult", lists);

		// 모델인 내 생각엔.. 이런 이름의 뷰가 내 결과를 잘 처리해줄 것 같아. -> 컨트롤러에게 반환.
		result = "WEB-INF/view/MVCTest02.jsp";
		
		return result;
	}
}
