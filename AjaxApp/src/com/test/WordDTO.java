/*====================
	WordDTO.java
======================*/
//인기검색어인 경우, 검색횟수 등의 속성이 추가될 수 있다..
package com.test;

public class WordDTO
{
	// 주요 속성 구성
	private String word;
	
	// 기본 생성자 추가 쉉
	public WordDTO()
	{
		this("");
	}
	
	// 사용자 정의 생성자 구성
	public WordDTO(String word)
	{
		this.word = word;
	}
	
	// getter / setter 구성
	public String getWord()
	{
		return word;
	}

	public void setWord(String word)
	{
		this.word = word;
	}
	
	
	
}
