/*==================================
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
		
		for (int i = 1; i <= 100 ; i++)	// i : 1 ~ 100
		{
			lists.add(String.valueOf(i));
		}
		
		request.setAttribute("modelActionResult", lists);
		
		result = "WEB-INF/view/MVCTest02.jsp";
		
		return result;
	}
}
