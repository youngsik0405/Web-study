package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	// 주요 속성 구성
	private static Connection conn;
	
	// 사용자 정의 생성자
	public ScoreDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 메소드 정의
	// 학생 DB에 추가하는 메소드
	public int add(ScoreDTO dto) throws SQLException
	{
		int result = 0;
		
		// sql 쿼리 준비
		String sql = "INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, ?, ?, ?, ?)";
		
		// 작업객체 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 매개변수 전달
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getKor());
		pstmt.setString(3, dto.getEng());
		pstmt.setString(4, dto.getMat());
		
		// 쿼리 실행
		result = pstmt.executeUpdate();
		
		// 리소스 닫기
		pstmt.close();
		
		// 결과값 반환
		return result;
	}
	
	
	// 전체 데이터 조회하는 메소드
	public ArrayList<ScoreDTO> lists() throws SQLException
	{
		// 결과값 ArrayList 변수 생성
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		// sql 쿼리문 준비
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
				+ ", (KOR+ENG+MAT) AS TOT"
				+ ", ROUND((KOR+ENG+MAT)/3, 1) AS AVG"
				+ " FROM TBL_SCORE"
				+ " ORDER BY SID";
		
		// 작업객체 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 쿼리문 실행
		ResultSet rs = pstmt.executeQuery();
		
		// 조회한 결과를 ArrayList에 담기
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getString("KOR"));
			dto.setEng(rs.getString("ENG"));
			dto.setMat(rs.getString("MAT"));
			dto.setTot(rs.getString("TOT"));
			dto.setAvg(rs.getString("AVG"));
			
			result.add(dto);
		}
		
		pstmt.close();
		rs.close();
		
		// 결과값 반환
		return result;
	}
	
	
	// 인원 수 조회하는 메소드
	public int count() throws SQLException
	{
		// 결과값 변수 선언
		int result = 0;
		
		// 쿼리문 준비
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		
		// 작업객체 생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 쿼리 실행
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		pstmt.close();
		rs.close();
		// 결과값 반환
		return result;

	}
	
	
	// 연결 종료하는 메소드
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	//성적 삭제 메소드 정의
	public int delete(String sid) throws SQLException
	{
		// 결과값 변수 선언
		int result = 0;
		
		// 쿼리 준비
		String sql = "DELETE FROM TBL_SCORE WHERE SID=?";
		
		// 작업객체 생성
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		// 매개변수 전달
		psmt.setString(1, sid);
		
		// 결과 반환
		result = psmt.executeUpdate();
		
		psmt.close();
		return result;
	}

}
