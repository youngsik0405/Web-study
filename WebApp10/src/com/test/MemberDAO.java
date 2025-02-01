/*===========================================
    MemberDAO.java
    - 데이터베이스 액션 처리 전용 객체 활용
=============================================*/

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
   private Connection conn;
     
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
   
   // 데이터 입력 메소드 정의
   public int add(MemberDTO dto) throws SQLException
   {
		int result = 0;
		
		String sql = "INSERT INTO TBL_MEMBER(SID,NAME,TEL)"
					+ " VALUES(MEMBERSEQ.NEXTVAL, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// ? 에 대한 값 setting
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTel());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
   }
   
   // 리스트 출력 메소드 정의
   public ArrayList<MemberDTO> lists() throws SQLException
   {
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 넘겨줄 변수가 없으면 setting 생략
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			// MemberDTO 인스턴스 생성
			MemberDTO dto = new MemberDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		
		return result;
   }
   
   // 인원수 확인을 위한 메소드 정의
   public int count() throws SQLException
   {
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		
		if (rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		pstmt.close();			
		
		return result;
   }
   
   
   // 데이터베이스 연결 종료 담당 메소드 정의
   public void close() throws SQLException
   {
      DBConn.close();
   }
}
