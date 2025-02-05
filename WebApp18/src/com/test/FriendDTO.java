/*======================
	FriendDTO.java
======================*/

package com.test;

public class FriendDTO
{
	/*
	 * private String userName; private int userAge; private String userGender;
	 * private String[] userLover;
	 * 
	 * // getter / setter 구성 public String getUserName() { return userName; } public
	 * void setUserName(String userName) { this.userName = userName; } public int
	 * getUserAge() { return userAge; } public void setUserAge(int userAge) {
	 * this.userAge = userAge; } public String getUserGender() { return userGender;
	 * } public void setUserGender(String userGender) { this.userGender =
	 * userGender; } public String[] getUserLover() { return userLover; } public
	 * void setUserLover(String[] userLover) { this.userLover = userLover; }
	 * 
	 * public String checkBoxCheck() { String str = "";
	 * 
	 * if (userLover != null) { for(String love : userLover) { str += "[" + love +
	 * "] "; } } else str = "이상형이 없습니다.";
	 * 
	 * return str; }
	 */
	
	// 주요 속성 구성
	private String name;			//-- 이름
	private String age;				//-- 나이 (나이를 산술적으로 다루지 않으므로 편의상 String)
	private String gender;			//-- 성별 (하나의 값만 넘어오는 라디오버튼, value에 남자/여자 적어놨으므로 그냥 String)
	//private String idealType;		//-- 이상형 -- check~!!!
	private String[] idealType;		//-- 이상형 -- check~!!!
	//-- 이상형은 여러 개의 데이터가 동시에 전달될 수 있는 구조이므로
	//   (즉, 다중 선택이 가능하도록 구성하였기 때문에)
	//   배열로 처리할 수 있다.
	
	// getter / setter 구성
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getAge()
	{
		return age;
	}
	public void setAge(String age)
	{
		this.age = age;
	}
	public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	
	/*
	public String getIdealType()
	{
		return idealType;
	}
	public void setIdealType(String idealType)
	{
		this.idealType = idealType;
	}
	*/
	
	public String[] getIdealType()					//-- check~!!!
	{
		return idealType;
	}
	public void setIdealType(String[] idealType)	//-- check~!!!
	{
		this.idealType = idealType;
	}
	
}
