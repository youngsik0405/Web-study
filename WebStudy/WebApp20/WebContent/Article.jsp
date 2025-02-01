<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%

   // 이전 페이지(→ 최초요청 or List.jsp or Article.jsp)로부터 넘어온 데이터 수신
   // → pageNum(페이지번호), num(게시물번호)
   String pageNum = request.getParameter("pageNum");         //-- 페이지 번호
   String strNum = request.getParameter("num");               //-- 게시물 번호
   int num = Integer.parseInt(strNum);
   
  Connection conn = DBConn.getConnection();
  BoardDAO dao = new BoardDAO(conn);
  
  // 해당 게시물의 조회수 증가
  dao.updateHitCount(num);
  
  // 해당 게시물을 기준으로 이전 / 다음 게시물 번호 확인
  int beforeNum = dao.getBeforeNum(num);            //-- ??? 150
  int nextNum = dao.getNextNum(num);               //--    150 ???
        
  BoardDTO dtoBefore = null;
  BoardDTO dtoNext = null;
  
  if (beforeNum != -1)                           //-- 이전 게시물이 존재할 경우...
     dtoBefore = dao.getReadData(beforeNum);
  if (nextNum != -1)
     dtoNext = dao.getReadData(nextNum);            //-- 다음 게시물이 존재할 경우...
     
  // 해당 게시물의 상세 내용 가져오기
  BoardDTO dto = dao.getReadData(num);               //-- 현재 게시물
  
  // 게시물 본문 라인 수 확인
  int lineSu = dto.getContent().split("\n").length;
  
  // 게시물 내용 다듬기
  dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
  //-- 안녕하세요\n반갑습니다\n즐거운오후입니다\n안녕히가세요
  //  → 안녕하세요<br>반갑습니다<br>즐거운오후입니다<br>안녕히가세요

   DBConn.close();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/article.css">
</head>
<body>

<div id="bbs">

   <div id="bbs_title">
      게 시 판 (JDBC 연동 버전)
   </div><!-- #bbs_title -->
   
   <div id="bbsArticle">
      <div id="bbsArticle_header">
         <!-- 게시물의 제목입니다. -->
         <%=dto.getSubject() %>
      </div><!-- #bbsArticle_header -->
   
      <div id="bbsArticle_bottomLine">
         <dl>
            <dt>작성자</dt>
            <dd><%=dto.getName() %></dd>
            
            <dt>라인수</dt>
            <dd><%=lineSu %></dd>
         </dl>
      </div><!-- #bbsArticle_bottomLine -->
      
      <div id="bbsArticle_bottomLine">
         <dl>
            <dt>등록일</dt>
            <!-- <dd>2025-01-17</dd> -->
            <dd><%=dto.getCreated() %></dd>
            
            <dt>조회수</dt>
            <!-- <dd>13</dd> -->
            <dd><%=dto.getHitCount() %></dd>
         </dl>
      </div><!-- #bbsArticle_bottomLine -->
      
      <div id="bbsArticle_content">
         <table style="width: 600;">
         <tr>
            <!-- <td style="padding: 10px 40px 10px 40px; vertical-align: top; height: 150;"> -->
            <td style="vertical-align: top;">
               <!-- 어쩌구 저쩌구 이러쿵 저러쿵 하는 내용입니다. -->
               <%=dto.getContent() %>
            </td>
         </tr>
         </table>
      
      </div><!-- #bbsArticle_content -->
      
      <div class="bbsArticle_bottomLine">
         <!-- 이전글 : (104) 취미에 대해 작성한 게시물 -->
         <%
         if (beforeNum != -1)
         {
         %>
            <a href="<%=cp%>/Article.jsp?pageNum=<%=pageNum%>&num=<%=beforeNum%>">
            이전글 : (<%=beforeNum %>) <%=dtoBefore.getSubject() %>
            </a>
         <%
         }
         else
         {
         %>
            이전글 : 없음
         <%
         }
         %>
      </div><!-- .bbsArticle_bottomLine -->
      
      <div class="bbsArticle_noLine">
         <!-- 다음글 : (106) 날씨에 대해 작성한 게시물 -->
         <%
         if (nextNum != -1)
         {
         %>
            <a href="<%=cp%>/Article.jsp?pageNum=<%=pageNum%>&num=<%=nextNum%>">
            다음글 : (<%=nextNum %>) <%=dtoNext.getSubject() %>
            </a>
         <%
         }
         else
         {
         %>
            이전글 : 없음
         <%
         }
         %>
      </div><!-- .bbsArticle_noLine -->
      
   </div><!-- #bbsArticle -->
   
   <div class="bbsArticle_noLine">
      <!-- From : 211.238.142.168 -->
      <%=dto.getIpAddr() %>
   </div><!-- .bbsArticle_noLine -->
   
   <div id="bbsArticle_footer">
      <div id="leftFooter">
         <input type="button" value="수정" class="btn2"
         onclick="javascript:location.href='<%=cp%>/Updated.jsp?pageNum=<%=pageNum%>&num=<%=dto.getNum()%>&status=1'">
         <input type="button" value="삭제" class="btn2" 
         onclick="javascript:location.href='<%=cp%>/Updated.jsp?pageNum=<%=pageNum%>&num=<%=dto.getNum()%>&status=2'">
      </div><!-- #leftFooter -->
      
      <div id="rightFooter">
         <input type="button" value="리스트" class="btn2"
         onclick="javascript:location.href='<%=cp%>/List.jsp?pageNum=<%=pageNum%>'">
      </div><!-- #rightFooter -->
      
   </div><!-- #bbsArticle_footer -->
   
</div><!-- bbs -->

</body>
</html>