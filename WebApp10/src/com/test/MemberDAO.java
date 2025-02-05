/*===============================================
	MemberDAO.java
	- 데이터베이스 액션 처리 전용 객체 활용
===============================================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
	// 주요 속성 구성
	// 1. 커넥션 객체(DB 연결 위한)
	private Connection conn;

	// getConn()을 구성할 수도 있겠지만.. 어차피 데이터 입력을 하든 수정을 하든 다 연결이 필요하므로
	// 생성자에서부터 getConnection()을 할 수 있게 구성하자.
	/*
	public Connection getConn()
	{
		return conn;
	}
	*/
	
	// 생성자 → 사용자 정의 생성자 → 데이터베이스 연결
	public MemberDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// preparedStatement 사용해서 메소드 각각 정의해보기
	
	// 데이터 입력 메소드 정의
	public int add(MemberDTO dto) throws SQLException
	{
		// 결과값 변수 선언
		int result = 0;
		
		// 쿼리 준비
		String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, ?, ?)";
		
		// 작업객체 생성
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		// 매개변수 전달
		psmt.setString(1, dto.getName());
		psmt.setString(2, dto.getTel());
		
		// 결과 반환
		result = psmt.executeUpdate();
		
		psmt.close();
		return result;
		
	}
	
	// 리스트 출력 메소드 정의
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		// 결과값 변수 선언
		ArrayList<MemberDTO> array = new ArrayList<MemberDTO>();
		
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		
		// 작업객체 생성 및 쿼리 실행
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			
			// 까먹지 말고 만들어둔 ArrayList에 값 넣기~~!~!~!~!
			array.add(dto);

		}
		
		pstmt.close();
		rs.close();
		return array;
		
	}
	
	// 인원수 확인을 위한 메소드 정의
	public int count() throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		ResultSet rs = psmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt(1);
		}
		
		psmt.close();
		rs.close();
		
		return result;
	}
	
	// 데이터베이스 연결 종료 담당 메소드 정의
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	
	
	
}
