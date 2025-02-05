<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Created.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/created.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">

<script type="text/javascript" src="<%=cp%>/js/util.js"></script>
<script type="text/javascript">

	function sendIt()
	{
		// 확인
		//alert("함수 호출 확인~!!!");
		
		var f = document.myForm;
		
		// 제목 입력 확인 ----------------------------------------------------
		// 필수 입력 항목 기재 여부 확인 및 공백 처리
		var str = f.subject.value;
		str = str.trim();
		
		// ※ javascript 의 trim()
		//    IE 8.0 이후부터 사용 가능 (인터넷익스플로어 이전 버전 쓰면 trim 함수 쓸 수 없음)
		
		// 확인
		//alert("|" + str + "|");
		
		if (!str)
		{
			alert("\n제목을 입력하세요~!!!");
			f.subject.focus();
			return;
		}
		// ---------------------------------------------------- 제목 입력 확인
		
		// 이름 입력 확인 ----------------------------------------------------
		str = f.name.value;
		str = str.trim();
		
		if (!str)
		{
			alert("\n작성자 이름을 입력하세요~!!!");
			f.name.focus();
			return;
		}
		// ---------------------------------------------------- 이름 입력 확인
		
		// 이메일 검사 -------------------------------------------------------
		// 이메일은 필수 입력 항목이 아니므로 선택적인 입력이 가능하지만
		// 입력을 한 상황이라면, 이메일 형식에 맞도록 입력했는지
		// 확인이 필요한 데이터이므로 이에 대한 처리
		
		if (f.email.value)		//-- 이메일 항목을 입력한 상황이라면...
		{
			if (!isValidEmail(f.email.value))
			{
				alert("\n정상적인 이메일 형식을 입력하세요~!!!");
				f.email.focus();
				return;
			}
		}
		// ------------------------------------------------------- 이메일 검사
		
		// 내용 입력 확인 ----------------------------------------------------
		// 필수 입력 항목 기재 여부 확인 및 공백 처리
		str = f.content.value;
		str = str.trim();
		
		if (!str)
		{
			alert("\n내용을 입력하세요~!!!");
			f.content.focus();
			return;
		}
		// ---------------------------------------------------- 내용 입력 확인

		// 패스워드 입력 확인 ----------------------------------------------------
		// 필수 입력 항목 기재 여부 확인 및 공백 처리
		str = f.pwd.value;
		str = str.trim();
		
		if (!str)
		{
			alert("\n패스워드를 입력하세요~!!!");
			f.pwd.focus();
			return;
		}
		// ---------------------------------------------------- 패스워드 입력 확인
	
		f.action = "<%=cp%>/Created_ok.jsp";
		
		f.submit();
		
		
	}

</script>
</head>
<body>

<div id="bbs">

   <div id="bbs_title">
      게 시 판 (JDBC 연동 버전)
   </div><!-- #bbs_title -->
   
   <form action="" method="post" name="myForm">
   
      <div id="bbsCreated">
      <!-- <div class="bbsCreated"> -->
         <div id="bbsCreated_bottomLine">
         <!--  <div class="bbsCreated_bottomLine">-->
            <dl>
               <dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
               <dd>
                  <input type="text" name="subject" maxlength="100" 
                  style="width:414px;" class="boxTF"/>
               </dd>
            </dl>
         </div><!-- #bbsCreated_bottomLine -->
         
         <div class="bbsCreate_bottomLine">
            <dl>
               <dt>작성자</dt>
               <dd>
                  <input type="text" name="name" class="boxTF" maxlength="20"
                  style="width:414px;">
               </dd>
            </dl>
         </div><!-- #bbsCreate_bottomLine -->
         
         <div class="bbsCreate_bottomLine">
            <dl>
               <dt>이 메 일</dt>
               <dd>
                  <input type="email" name="email" class="boxTF" maxlength="50"
                  style="width:414px;"/>
               </dd>
            </dl>
         </div><!-- #bbsCreate_bottomLine -->
         
         <div id="bbsCreated_content">
         
            <dl>
               <dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
               <dd>
                  <textarea name="content" cols="63" rows="12" class="boxTA"></textarea>
               </dd>
            </dl>
         </div><!-- #bbsCreated_bottomLine -->
         
         
         <div id="bbsCreated_noLine">
         
            <dl>
               <dt>패스워드</dt>
               <dd>
                  <input type="password" name="pwd" class="boxTF" maxlength="10"/>
                  &nbsp;<span style="font-size: 6pt">(게시물 수정 삭제 시 필요)</span>
               </dd>
            </dl>
         </div><!-- #bbsCreated_noLine -->
         
         <div id="bbsCreated_footer">
            <input type="button" value="등록하기" class="btn2" onclick="sendIt()"/>
            <input type="reset" value="다시입력" class="btn2"/>
            <input type="button" value="작성취소" class="btn2"
            onclick="javascript:location.href='<%=cp%>/List.jsp'"/>         
         
         </div>
         
      </div><!-- bbsCreated -->
   
   </form>
</div><!-- #bbs -->
</body>
</html>