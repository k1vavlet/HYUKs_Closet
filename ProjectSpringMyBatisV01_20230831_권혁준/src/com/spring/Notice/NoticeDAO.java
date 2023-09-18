package com.spring.Notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.spring.DBSet.DbClose;
import com.spring.DBSet.DbSet;

public class NoticeDAO {
	String sql;
	public PreparedStatement pstmt;
	public Connection conn;
	public ResultSet rs;

	NoticeDTO noDto = new NoticeDTO();
	
	public ArrayList<NoticeDTO> NoticeSel() {
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		sql = "select * from PJT_Notice";
		
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			
			while (rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				
				dto.setNt_title(rs.getString("Nt_TITLE"));
				dto.setNt_date(rs.getString("Nt_DATE"));
				dto.setNt_content(rs.getString("Nt_CONTENT"));
				dto.setNt_writer(rs.getString("Nt_WRITER"));
				dto.setNt_no(rs.getInt("Nt_NO"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	public ArrayList<NoticeDTO> notice_Single_View(String no) {
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		sql = "select * from PJT_Notice where NT_NO = ?";
		
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				
				dto.setNt_title(rs.getString("Nt_TITLE"));
				dto.setNt_date(rs.getString("Nt_DATE"));
				dto.setNt_content(rs.getString("Nt_CONTENT"));
				dto.setNt_writer(rs.getString("Nt_WRITER"));
				dto.setNt_no(rs.getInt("Nt_NO"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn, pstmt, rs);
		}
		
		return list;
	}

	public int NoticeIns(NoticeDTO dto) {
		int su = 0;
		
		try {
			conn = DbSet.getConnection();
			sql = "INSERT INTO PJT_Notice values(?, sysdate, ?, ?, NOTICE_SEQ.NEXTVAL)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNt_title());
			pstmt.setString(2, dto.getNt_content());
			pstmt.setString(3, dto.getNt_writer());

			su = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			DbClose.close(conn, pstmt);
		}
		
		return su;
	}
	
	public int NoticeUpd(NoticeDTO dto) {
		int su = 0;
		sql = "update PJT_NOTICE set nt_title = ?, nt_content = ? where nt_writer = ? and nt_no = ?";
		
		try {
			conn = DbSet.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNt_title());
			pstmt.setString(2, dto.getNt_content());
			pstmt.setString(3, dto.getNt_writer());
			pstmt.setInt(4, dto.getNt_no());

			su = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn, pstmt);
		}
		
		return su;
	}
	
	public int noticeDel(NoticeDTO dto) {
		int su = 0;
		
		sql = "delete from PJT_NOTICE where NT_WRITER = ? and NT_NO = ?";
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNt_writer());
			pstmt.setInt(2, dto.getNt_no());
			
			System.out.println(dto.getNt_writer());
			System.out.println(dto.getNt_no());

			su = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn, pstmt);
		}
		
		return su;
	}
}
