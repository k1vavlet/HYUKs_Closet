package com.spring.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.spring.DBSet.DbClose;
import com.spring.DBSet.DbSet;

public class QnADAO {
	String sql;
	public PreparedStatement pstmt;
	public Connection conn;
	public ResultSet rs;
	
	QnADTO dto = new QnADTO();
	
	public int qnaIns(QnADTO dto) {
		int su = 0;
		
		try {
			conn = DbSet.getConnection();
			sql = "INSERT INTO PJT_QNA values(QNA_SEQ.NEXTVAL, ?, ?, ?, ?, ?, sysdate)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getQna_title());
			pstmt.setString(2, dto.getQna_content());
			pstmt.setString(3, dto.getQna_writer());
			pstmt.setString(4, dto.getQna_pd_name());
			pstmt.setString(5, dto.getQna_pd_img());

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
	
	public ArrayList<QnADTO> qnaSel() {
		ArrayList<QnADTO> list = new ArrayList<QnADTO>();
		sql = "select * from PJT_QNA";
		
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			
			while (rs.next()) {
				QnADTO dto = new QnADTO();
				
				dto.setQna_no(rs.getInt("Qna_NO"));
				dto.setQna_pd_name(rs.getString("Qna_pd_name"));
				dto.setQna_pd_img(rs.getString("Qna_PD_IMG"));
				dto.setQna_title(rs.getString("Qna_TITLE"));
				dto.setQna_date(rs.getString("Qna_DATE"));
				dto.setQna_content(rs.getString("Qna_CONTENT"));
				dto.setQna_writer(rs.getString("Qna_WRITER"));
				
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
	
	public ArrayList<QnADTO> qnaSel_View(String no) {
		ArrayList<QnADTO> list = new ArrayList<QnADTO>();
		sql = "select * from PJT_QNA where QNA_NO = ?";
		
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(no));
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				QnADTO dto = new QnADTO();
				
				dto.setQna_no(rs.getInt("QNA_NO"));
				dto.setQna_pd_name(rs.getString("Qna_pd_name"));
				dto.setQna_pd_img(rs.getString("Qna_PD_IMG"));
				dto.setQna_title(rs.getString("Qna_TITLE"));
				dto.setQna_date(rs.getString("Qna_DATE"));
				dto.setQna_content(rs.getString("Qna_CONTENT"));
				dto.setQna_writer(rs.getString("Qna_WRITER"));
				
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
	
	public int qnaUpd(QnADTO dto) {
		int su = 0;
		sql = "update PJT_QNA set qna_title = ?, qna_content = ? where qna_writer = ? and qna_no = ?";
		
		try {
			conn = DbSet.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getQna_title());
			pstmt.setString(2, dto.getQna_content());
			pstmt.setString(3, dto.getQna_writer());
			pstmt.setInt(4, dto.getQna_no());

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
	
	public int qnaDel(QnADTO dto) {
		int su = 0;
		
		sql = "delete from PJT_QNA where QNA_WRITER = ? and QNA_NO = ?";
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getQna_writer());
			pstmt.setInt(2, dto.getQna_no());

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
