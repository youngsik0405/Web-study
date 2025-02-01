<%@page import="com.sun.javafx.scene.control.SelectedCellsMap"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.test.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.util.MyUtil"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%

   // 페이지 요청 → 최초 요청(○) → 이전 페이지로부터 넘어온 데이터 없음 → List.jsp
   //             → 최초 요청(Ⅹ) → 이전 페이지로부터 넘어온 데이터 수신 → List.jsp?pageNum=xxx
   
   // 이전 페이지로부터 넘어온 페이지 번호 수신
   String pageNum = request.getParameter("pageNum");
   int currentPage = 1;
   
   if (pageNum != null)
      currentPage = Integer.parseInt(pageNum);
   
   // 이전 페이지로부터 넘어온 검색 키와 검색 값 수신
   String searchKey = request.getParameter("searchKey");
   String searchValue = request.getParameter("searchValue");
   
   if (searchKey != null)	//-- 검색 기능을 통해 이 페이지가 요청되었을 경우...
   {
		//System.out.println(searchKey + " : " + searchValue);
		
		// 넘어온 요청 방식이 GET 방식이라면...
		// → GET 은 한글 문자열을 인코딩해서 보내기 때문에...
		if (request.getMethod().equalsIgnoreCase("GET"))
		{
			// 디코딩 처리
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
   }
   else						//-- 검색 기능이 아닌 기본적인 페이지 요청이 이루어졌을 경우...
   {
	   searchKey = "subject";
	   searchValue = "";
   }
   
   Connection conn = DBConn.getConnection();
   BoardDAO dao = new BoardDAO(conn);
   MyUtil myUtil = new MyUtil();
   
   // 전체 데이터 갯수 구하기
   int dataCount = dao.getDataCount(searchKey, searchValue);
   
   // 전체 데이터 기준으로 총 페이지 수 계산
   int numPerPage = 10;                                 //-- 한 페이지에 표시할 데이터 갯수
   int totalPage = myUtil.getPageCount(numPerPage,dataCount);
   
   // 전체 페이지 수 보다 표시할 페이지가 큰 경우
   // 표시할 페이지를 전체 페이지로 처리
   // → 한 마디로, 데이터를 삭제하여 페이지가 줄었을 경우...
   if (currentPage > totalPage)
      currentPage = totalPage;
   
   // 데이터베이스에서 가져올 목록의 시작과 끝 위치
   int start = (currentPage-1) * numPerPage + 1;
   int end = currentPage * numPerPage;
   
   // 실제 리스트 가져오기
   //List<BoardDTO> lists = dao.getList(start, end);
   List<BoardDTO> lists = dao.getList(start, end, searchKey, searchValue);	// check~!!!
   
   // check~!!!
   // 검색 기능 구현 과정에서 추가
   String param = "";
   
   // 검색값이 존재한다면...
   if (!searchValue.equals(""))
   {
	   param += "?searchKey=" + searchKey;
	   param += "&searchValue=" + searchValue;
			   
   }
   
   //String listUrl = "List.jsp";
   String listUrl = "List.jsp" + param;										// check~!!!
   
   String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
   
   // 글 내용 보기 주소 구성
   String articleUrl = cp + "/Article.jsp";
   
   if (param.equals(""))
   {
		articleUrl = articleUrl + "?pageNum=" + currentPage;
   }
   else
   {
	   articleUrl = articleUrl + param + "&pageNum=" + currentPage;
   }
   DBConn.close();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/list.css">
<script type="text/javascript">

	function sendIt()
	{
		// 확인 
		//alert("함수 호출 확인~!!!");
		
		var f = document.searchForm;
		
		// 검색 키워드에 대한 유효성 검사 코드 삽입 및 활용 가능
		f.action = "<%=cp %>/List.jsp?pageNum=1";
		
		f.submit();
	}
</script>

</head>
<body>
<div id="bbsList">
   <div id="bbsList_title">
      게 시 판 (JDBC 연동 버전)
   </div>
   
   <div id="bbsList_header">
      
      <div id="leftHeader">
         <!--검색 폼 구성-->
         <form action="" name="searchForm" method="post">
            <select name="searchKey" class="selectFiled">
               <%
               if (searchKey.equals("name"))			//-- 수신한 searchKey 가 name 라면... 
               {
               %>
               		<option value="subject">제목</option>
					<option value="name" selected="selected">작성자</option>
					<option value="content">내용</option>
               <%
               }
               else if (searchKey.equals("content"))	//-- 수신한 searchKey 가 content 라면...
               {
               %>
               		<option value="subject">제목</option>
					<option value="name" selected="selected">작성자</option>
					<option value="content">내용</option>
               <%
               }
               else										//-- 수신한 searchKey 가 subject 이거나... 없으면
               {
               %>
            	   	<option value="subject">제목</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
               <%
               }
               %>
            </select>
            <input type="text" name="searchValue" class="textFiled" value=<%=searchValue %>>
            <input type="button" value="검색" class="btn2" onclick="sendIt()">
         </form>
      </div><!--#leftHeader-->
      
      <div id="rightHeader">
         <input type="button" value="글올리기" class="btn2"
         onclick="javascript:location.href='<%=cp%>/Created.jsp'">
      </div><!--rightHeader-->
      
   </div><!--#bbsList_header-->
   
   <div id="bbsList_list">
      <div id="title">
         <dl>
            <dt class="num">번호</dt>
            <dt class="subject">제목</dt>
            <dt class="name">작성자</dt>
            <dt class="created">작성일</dt>
            <dt class="hitCount">조회수</dt>
         </dl>
      </div><!-- #title -->
      
      <div id="lists">
         <!-- 
         <dl>
            <dd class="num">1</dd>
            <dd class="subject">안녕하세요</dd>
            <dd class="name">이은솔</dd>
            <dd class="created">2024-04-25</dd>
            <dd class="hitCount">0</dd>
         </dl>       
         -->
         
         <%
         for (BoardDTO dto : lists)
         {
         %>
         <dl>
            <dd class="num"><%=dto.getNum() %></dd>
               <a href="<%=articleUrl%>&num=<%=dto.getNum()%>">
            	<dd class="subject"><%=dto.getSubject() %></dd>
               </a>
            <dd class="name"><%=dto.getName() %></dd>
            <dd class="created"><%=dto.getCreated() %></dd>
            <dd class="hitCount"><%=dto.getHitCount() %></dd>
         </dl>
         <%
         }
         %>
         
      </div><!-- #lists -->
      
      <div id="footer">
         <!-- <p> Prev 21 22 23 24 25 26 27 28 29 30 Next 42</p> -->
         <!-- <p>등록한 게시물이 존재하지 않습니다.</p> -->
         <p>
         <%
         if (dataCount != 0)
         {
         %>
            <%=pageIndexList %>
         <%
         }
         else {
         %>
            등록된 게시물이 존재하지 않습니다.
         <%
         }
         %>
         </p>
      </div><!-- #footer -->
      
   </div><!-- #bbsList_list -->
</div><!-- bbsList -->
</body>
</html>