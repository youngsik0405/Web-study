/*=======================
	MyUtil.java
	- 게시판 페이징 처리
========================*/

// check~!!!
// 지금 같이 확인해보고자 하는 페이징 처리 기법은
// 다양한 여러 방법들 중 한가지(그나마 쉬운거 골라서...) 이다.
// 학습을 마친 이후에... 꼭~!!! 추가적으로 개념을 정리하고
// 확장시키고, 다른 방법들도 찾아보고 공부해야 한다~!!!


package com.util;

public class MyUtil
{
	// ■ 전체 페이지 수를 구하는 메소드
	// numPerPage : 한 페이지에 표시할 데이터(게시물)의 수
	// dataCount : 전체 데이터(게시물)의 수
	public int getPageCount(int numPerPage, int dataCount)
	{
		int pageCount = 0;
		
		// 몫만 취하는 나눗셈 연산
		pageCount = dataCount/numPerPage;
		
		if (dataCount%numPerPage != 0)	//-- 자투리 게시물이 남아있다면
			pageCount++;
		
		return pageCount;
	}
	//-- 한 페이지에 10개의 게시물을 구성할 때
	//   총 32개의 게시물을 페이지로 처리하기 위해서는
	//   『32 / 10』의 연산을 수행하여 결과 3을 얻을 수 있다.
	//   → 『pageCount = dataCount/numPerPage;』
	//	 그런데 이 때, 나머지 2개의 게시물을 출력해주기 위해서는
	//   페이지 하나가 더 필요하다.
	//   → 『pageCount++;』
	
	
	// ■ 페이징 처리 기능의 메소드
	// currentPage : 현재 표시할 페이지
	// totalPage : 전체 페이지 수
	// listUrl : 링크를 설정할 url (각 a태그의 href 속성에 들어갈 링크)
	public String pageIndexList(int currentPage, int totalPage, String listUrl)
	{
		// 실제 페이징을 저장할 StringBuffer 변수
		StringBuffer strList = new StringBuffer();
		
		int numPerBlock = 10;
		//-- 페이징 처리 시 게시물 리스트 하단의 숫자를 10개씩 보여주도록 설정
		
		
		// check~!!!
		int currentPageSetup;
		//-- 현재 페이지 설정
		//   (이 페이지를 기준으로 보여주는 숫자가 달라져야 하기 때문에...)

		
		int page;
		int n;
		//-- 이전 페이지 블럭과 같은 처리에서 이동하기 위한 변수
		//   (얼마만큼 이동해야 하는지 알아야 하기 때문에...)
		
		
		// 페이징 처리가 별도로 필요하지 않은 경우
		//-- 데이터가 존재하지 않거나 데이터의 수가 1페이지도 못채우는 경우는
		//   별도로 페이징 처리를 할 필요가 없다.
		if (currentPage==0) // 데이터 수가(게시물이) 아예 없으면 밑에 만들어줄 필요없음.
			return "";
		
		
		// ※ 페이지 요청을 처리하는 과정에서
		//    URL 경로의 패턴에 대한 처리
		/*
			- 클라이언트 요청의 형태 → List.jsp ................... + PageNum=5
			  → (가공) → List.jsp + 『?』 + PageNum=5
			  → (결과) → List.jsp?PageNum=5
			
			- 클라이언트 요청의 형태 → List.jsp?subject=study ..... + PageNum=5 (검색기능까지 고려한 요청 형태)
			  → (가공) → List.jsp?subject=study + 『?』 + PageNum=5
			  → (결과) → List.jsp?subject=study?PageNum=5			---- (Ⅹ)
			  
			  → (가공) → List.jsp?subject=study + 『&』 + PageNum=5
			  → (결과) → List.jsp?subject=study&PageNum=5			---- (○)
		*/
		
		// 링크를 구성할 URL 에 대한 사전 가공 처리~!!!
		if (listUrl.indexOf("?") != -1) //-- 링크를 구성할 URL 에 『?』가 들어있으면...
			listUrl = listUrl + "&";	//-- listUrl += "&";
		else							//-- 링크를 구성할 URL 에 『?』가 없으면...
			listUrl = listUrl + "?";	//-- listUrl += "?";
		//-- 예를 들어, 검색값이 존재하면
		//   이미 request 값에 searchKey 와 searchValue 가 들어있는 상황이므로
		//   『&』를 붙여서 속성에 추가해 주어야 한다.
		
		
		// currentPageSetup = 표시할 첫 페이지 -1
		currentPageSetup = (currentPage / numPerBlock) * numPerBlock;
		//-- 만약 현재 페이지가 5페이지이고 (→ currentPage=5)
		//   리스트 하단에 보여줄 페이지 갯수가 10이면 (→ numPerBlock=10)
		//   『5 / 10 = 0』 이며... 여기에 『* 10』 (→ 10을 곱해도) 0 이다.
		//   하지만, 현재 페이지가 11페이지라면 (→ currentPage==11)
		//   『11 / 10 = 1』 이며... 여기에 『* 10』 (→ 10을 곱하면) 10 이다.
		//   그러면... currentPageSetup 은 10 이 되는 것이다.
		
		
		if (currentPage % numPerBlock == 0)
		{
			currentPageSetup = currentPageSetup - numPerBlock;
			// currentPageSetup -= numPerBlock;
		}
		//-- 만약 위 처리에서... (라인 99 코드)
		//	 현재 페이지가 20 페이지였다면 (→ currentPage=20)
		//   『20 / 10 = 2』 이며... 여기에 『* 10』 (→ 10을 곱해서) 20 이 되는데
		//   이와 같은 상황일 경우... 다시 10을 빼서 10으로 만들어주기 위한 구문.
		
		
		// 1 페이지(맨처음으로)
		if ( (totalPage>numPerBlock) && (currentPageSetup>0) )	//적어도 10 페이지가 넘어가야하고, 1~10까지보다 더 클 때..
		{
			strList.append(" <a href='" + listUrl + "pageNum=1'>1</a>"); //1페이지로 가는 거니까 pageNum=1
		}
		//-- listUrl 은 위에서... (라인 82 ~ 92 코드)
		//   이미 전처리가 끝난 상황이기 때문에
		//   『...?』 상태 또는 『...?...&...&』 인 상태이다.
		//   이로 인해 결과는
		//   『...?pageNum=1』 이거나 『...?...&...&pageNum=1』 이 되는 상황이다.
		
		// Prev(이전으로)
		n = currentPage - numPerBlock;
		//-- n : 현재 머물고 있는 페이지에서
		//       페이지를 처리하는 갯수만큼 앞으로 보내기 위한 변수
		//-- 예를 들어, 현재 23 페이지에 머물고 있다면
		//   Prev 를 통해 이동하게 되면 13 페이지로...
		
		if ( (totalPage>numPerBlock) && (currentPageSetup>0) )
		{
			strList.append(" <a href='" + listUrl + "pageNum=" + n + "'>Prev</a>");
		}
		//-- currentPageSetup 이 0 보다 큰 경우는
		//   이미 페이지가 11 이상이라는 의미이며
		//   이 때, 현재 페이지(→ currentPage)가 11 이상일 경우
		//   『Prev』를 등장시키기 위한 구문.
		//-- 『Prev』를 클릭하여 링크로 이동할 경우
		//   n 변수 페이지로 이동하는데
		//   12 에서 『Prev』 할 경우 2 페이지가 되고,
		//   22 에서 『Prev』 할 경우 12 페이지가 될 수 있도록 처리하는 방식이다.
		
		
		// 각 페이지 바로가기
		page = currentPageSetup + 1;
		//-- 『+1』을 수행하는 이유는
		//   앞서 currentPageSetup 에서 10을 가져왔다면
		//   10 부터 시작하는 것이 아니라
		//   바로가기 페이지는 11 부터 시작해야 하기 때문이다.
		
		while ( (page<=totalPage) && (page<=currentPageSetup+numPerBlock) )
		{
			if (page==currentPage)
			{
				// 현재 페이지 구성 (링크 없이 스타일만 부여)
				strList.append(" <span style='color:orange; font-weight:bold;'>" + page + "</span>");
			}
			else
			{
				// 현재 페이지를 제외한 나머지 바로가기 구성 (링크 있음)
				strList.append(" <a href='" + listUrl + "pageNum=" + page + "'>" + page + "</a>");
			}
			
			page++;
		}
		
		// Next(다음으로)
		n = currentPage + numPerBlock;
		if ( (totalPage-currentPageSetup) > numPerBlock )
		{
			strList.append(" <a href='" + listUrl + "pageNum=" + n + "'>Next</a>");
		}
		
		// 마지막 페이지(맨마지막으로)
		if ( (totalPage>numPerBlock) && (currentPageSetup+numPerBlock)<totalPage )
		{
			strList.append(" <a href='" + listUrl + "pageNum=" + totalPage + "'>" + totalPage +"</a>");
		}
		
		// StringBuffer 타입인 strList을 String으로 형변환해서 반환해주기
		return strList.toString();
		
	}
	
}
