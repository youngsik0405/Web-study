/*=======================
	BoardDAO.java
========================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class BoardDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	// DAO는 빈 형태로 구성할 필요 없음!
	// 생성자 정의
	public BoardDAO(Connection conn)
	{
		this.conn = conn;
	}
	
	// 게시물 번호의 최대값 얻어내기
	public int getMaxNum() throws SQLException
	{
		int result = 0;
		
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try
		{
			sql = "SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next())
				result = rs.getInt("MAXNUM");
			
			rs.close();
			stmt.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 게시물 작성 → 데이터 입력
	public int insertData(BoardDTO dto)
	{
		int result = 0;
		
		// 절대로 Statement 쓰면 안 됨!!
		PreparedStatement pstmt = null;
		String sql = "";
		
		try
		{
			// hitCount 는 기본값 『0』 또는 『default』 또는 『입력항목 생략』 가능
			// created 는 기본값 『sysdate』 또는 『default』 또는 『입력항목 생략』 가능
			sql = "INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT"
					+ ", CONTENT, IPADDR, HITCOUNT, CREATED)"
					+ " VALUES(?, ?, ?, ?, ?, ?, ?, 0, SYSDATE)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getSubject());
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7, dto.getIpAddr());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	}
	
	
	//  (페이징 처리하기 위해~!~!)
	// DB 레코드의 갯수를 가져오는 메소드 정의 (지금은 전체)
	// → 검색 기능(검색 대상)을 추가하게 되면... 수정이 필요한 메소드
	//    (검색 결과 갯수에 따라 또 페이징처리를 해줘야하니까)
	/*
	public int getDataCount()
	{
		int result = 0;
		
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		try
		{
			stmt = conn.createStatement();
			sql = "SELECT COUNT(*) AS COUNT FROM TBL_BOARD";
			rs = stmt.executeQuery(sql);
			if (rs.next())
				result = rs.getInt("COUNT");
			
			rs.close();
			stmt.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	*/
	
	// ↓
	
	// check~!!!
	// 검색 기능을 추가하며 메소드 수정~!!!
	//public int getDataCount()
	//						제목,작성자,내용  입력값    
	public int getDataCount(String searchKey, String searchValue)
	{
		int result = 0;
		
		//Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			// check~!!! : 해당 searchValue가 포함되어있는 걸 찾기 위해 %를 붙인다.
			searchValue = "%" + searchValue + "%";
					
			sql = "SELECT COUNT(*) AS COUNT"
					+ " FROM TBL_BOARD"
					+ " WHERE " + searchKey + " LIKE ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchValue);
			
			rs = pstmt.executeQuery();
			if (rs.next())
				result = rs.getInt("COUNT");
			
			rs.close();
			pstmt.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}//end getDataCount(String searchKey, String searchValue)
	
	
	// 특정 영역의(시작번호~끝번호) 게시물의 목록을 읽어오는 메소드 정의
	// → 검색 기능(검색 대상)을 추가하게 되면... 수정이 필요한 메소드
	/*
	public List<BoardDTO> getLists(int start, int end)
	{	
		List<BoardDTO> result = new ArrayList<BoardDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED"
					+ " FROM ("
					+ " SELECT ROWNUM RNUM, DATA.*"
					+ " FROM"
					+ " ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED"
					+ " FROM TBL_BOARD"
					+ " ORDER BY NUM DESC"
					+ " ) DATA"
					+ " )"
					+ " WHERE RNUM>=? AND RNUM<=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getInt("NUM"));
				dto.setName(rs.getString("NAME"));
				dto.setSubject(rs.getString("SUBJECT"));
				dto.setHitCount(rs.getInt("HITCOUNT"));
				dto.setCreated(rs.getString("CREATED"));
				
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	*/

	// ↓
	
	// check~!!!
	// 검색 기능을 추가하며 메소드 수정~!!!
	public List<BoardDTO> getLists(int start, int end, String searchKey, String searchValue)
	{	
		List<BoardDTO> result = new ArrayList<BoardDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			// check~!!!
			searchValue = "%" + searchValue + "%";
			
			sql = "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED"
					+ " FROM ("
					+ " SELECT ROWNUM RNUM, DATA.*"
					+ " FROM"
					+ " ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED"
					+ " FROM TBL_BOARD"
					+ " WHERE " + searchKey + " LIKE ?"			//-- check~!!! 추가 구문
					+ " ORDER BY NUM DESC"
					+ " ) DATA"
					+ " )"
					+ " WHERE RNUM>=? AND RNUM<=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchValue);					//-- check~!!! 추가 구문
			pstmt.setInt(2, start);								// 인덱스 변경
			pstmt.setInt(3, end);								// 인덱스 변경
			
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getInt("NUM"));
				dto.setName(rs.getString("NAME"));
				dto.setSubject(rs.getString("SUBJECT"));
				dto.setHitCount(rs.getInt("HITCOUNT"));
				dto.setCreated(rs.getString("CREATED"));
				
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 특정 게시물 조회에 따른 조회 횟수 증가 메소드 정의 (매개변수는 어떤 게시물인지, 반환값은 조회수)
	public int updateHitCount(int num)
	{
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = "";
		
		try
		{
			sql = "UPDATE TBL_BOARD"
					+ " SET HITCOUNT = HITCOUNT + 1"
					+ " WHERE NUM=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 특정 게시물의 내용을 읽어오는 메소드 정의
	// (번호가 PK 제약조건이 있으니 번호로 조회하는 결과물은 단일값이다)
	public BoardDTO getReadData(int num)
	{
		BoardDTO result = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT NUM, NAME, PWD, EMAIL, SUBJECT"
					+ ", CONTENT, IPADDR, HITCOUNT"
					+ ", TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED"
					+ " FROM TBL_BOARD"
					+ " WHERE NUM=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if (rs.next())
			{
				result = new BoardDTO();
				
				result.setNum(rs.getInt("NUM"));
				result.setName(rs.getString("NAME"));
				result.setPwd(rs.getString("PWD"));
				result.setEmail(rs.getString("EMAIL"));
				result.setSubject(rs.getString("SUBJECT"));
				result.setContent(rs.getString("CONTENT"));
				result.setIpAddr(rs.getString("IPADDR"));
				result.setHitCount(rs.getInt("HITCOUNT"));
				result.setCreated(rs.getString("CREATED"));
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	// 특정 게시물을 삭제하는 기능의 메소드
	public int deleteData(int num)
	{
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = "";
		
		try
		{
			sql = "DELETE FROM TBL_BOARD WHERE NUM=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	// (수정할 게시물을 찾는 게 아니라 내용 수정을 하는 것이므로 매개변수가 BoardDTO
	// 특정 게시물의 내용을 수정하는 기능의 메소드
	public int updateData(BoardDTO dto)
	{
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = "";
		
		try
		{
			sql = "UPDATE TBL_BOARD"
					+ " SET NAME=?, PWD=?, EMAIL=?, SUBJECT=?, CONTENT=?"
					+ " WHERE NUM=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(6, dto.getNum());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	// 특정 게시물 이전 게시물 번호 얻어내는 메소드 정의
	// → 이전 게시물이 존재하지 않을 경우 『-1』 반환
	public int getBeforeNum(int num)
	{
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT NVL(MAX(NUM), -1) BEFORENUM"
					+ " FROM TBL_BOARD"
					+ " WHERE NUM<?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				result = rs.getInt("BEFORENUM");
			
			rs.close();
			pstmt.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 특정 게시물 다음 게시물 번호 얻어내는 메소드 정의
	// → 다음 게시물이 존재하지 않을 경우 『-1』 반환
	public int getNextNum(int num)
	{
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT NVL(MIN(NUM), -1) NEXTNUM"
					+ " FROM TBL_BOARD"
					+ " WHERE NUM>?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				result = rs.getInt("NEXTNUM");
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	
}
