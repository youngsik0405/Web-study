/*=====================
	FriendDTO.java
=====================*/


package com.test;

public class FriendDTO
{
	// 주요 속성 구성
	private String name;			//-- 이름
	private String age;				//-- 나이  -- int
	private String gender;			//-- 성별
	private String[] type;			//-- 이상형
	//-- 이상형은 여러 개의 데이터가 동시에 전달될 수 있는 구조이므로
	//   (즉, 다중 선택이 가능하도록 구성하였기 때문에)
	//   배열로 처리할 수 있다.
	
	
	
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
	public String[] getType()
	{
		return type;
	}
	public void setType(String[] type)
	{
		this.type = type;
	}
}
