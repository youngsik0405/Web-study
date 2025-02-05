/*====================
	GuestDTO.java
======================*/

package com.test;

public class GuestDTO
{
	/*
	 * // 주요 속성 구성 private String uName, uTitle, uText;
	 * 
	 * // getter / setter 구성 public String getuName() { return uName; }
	 * 
	 * public void setuName(String uName) { this.uName = uName; }
	 * 
	 * public String getuTitle() { return uTitle; }
	 * 
	 * public void setuTitle(String uTitle) { this.uTitle = uTitle; }
	 * 
	 * public String getuText() { return uText; }
	 * 
	 * public void setuText(String uText) { this.uText = uText; }
	 */
	
	// 주요 속성 구성
	// 변수명 이렇게 설정할 수도 있지만, Guest.jsp의 name과 일치시키면 자바 빈 운용하는데 편함
	//String name;			//-- 작성자
	//String title;			//-- 게시물 제목
	//String str;			//-- 게시물 내용
	
	private String userName;		//-- 작성자
	private String subject;			//-- 게시물 제목
	private String content;			//-- 게시물 내용
	
	// check~!!!
	// ※ 여기에서 사용하는(선언하는) 변수명(속성명)의
	//    앞 두 글자는 가급적 소문자로 작성할 것~!!!
	//
	//    numScore  → getNumScore() / setNumScore()
	//    nScore    → getNScore() / setNScore()
	//    nScore    → getnScore() / setnScore()
	//
	//    와 같이 setter 가 속성명을 불러오는 과정에서
	//    인식이 어긋나는 경우가 발생할 수 있기 때문...
	
	// ※ 여기에서 사용하는(선언하는) 변수명(속성명)은
	//    HTML(JSP) 의 form 태그에서 name 속성으로 지정하여 사용할 것~!!!
	//    그래야 속성 데이터 수신 및 속성 매핑을
	//    액션 태그를 활용하여 자동으로 처리해 줄 수 있기 때문...
	
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getSubject()
	{
		return subject;
	}
	public void setSubject(String subject)
	{
		this.subject = subject;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	
	
}
