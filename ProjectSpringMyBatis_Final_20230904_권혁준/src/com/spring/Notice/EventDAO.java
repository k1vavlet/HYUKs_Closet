package com.spring.Notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.spring.DBSet.DbClose;
import com.spring.DBSet.DbSet;

public class EventDAO {
	String sql;
	public PreparedStatement pstmt;
	public Connection conn;
	public ResultSet rs;
	
	EventDTO dto = new EventDTO();
	
	public int eventIns(EventDTO dto) {
		int su = 0;
		
		try {
			conn = DbSet.getConnection();
			sql = "INSERT INTO PJT_EVENT values(EVENT_SEQ.NEXTVAL, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEvt_title());
			pstmt.setString(2, dto.getEvt_content());
			pstmt.setString(3, dto.getEvt_dating());
			pstmt.setString(4, dto.getEvt_writer());

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
	
	public ArrayList<EventDTO> eventSel() {
		ArrayList<EventDTO> list = new ArrayList<EventDTO>();
		sql = "select * from PJT_EVENT";
		
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			
			while (rs.next()) {
				EventDTO dto = new EventDTO();
				
				dto.setEvt_no(rs.getInt("EVT_NO"));
				dto.setEvt_title(rs.getString("EVT_TITLE"));
				dto.setEvt_content(rs.getString("EVT_CONTENT"));
				dto.setEvt_dating(rs.getString("EVT_DATING"));
				dto.setEvt_writer(rs.getString("EVT_WRITER"));
				
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
	
	public ArrayList<EventDTO> eventSel_View(String no) {
		ArrayList<EventDTO> list = new ArrayList<EventDTO>();
		sql = "select * from PJT_EVENT where EVT_NO = ?";
		
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				EventDTO dto = new EventDTO();
				
				dto.setEvt_no(rs.getInt("EVT_NO"));
				dto.setEvt_title(rs.getString("EVT_TITLE"));
				dto.setEvt_content(rs.getString("EVT_CONTENT"));
				dto.setEvt_dating(rs.getString("EVT_DATING"));
				dto.setEvt_writer(rs.getString("EVT_WRITER"));
				
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
	
	public int eventUpd(EventDTO dto) {
		int su = 0;
		sql = "update PJT_EVENT set evt_title = ?, evt_content = ?, evt_dating = ? where evt_writer = ? and evt_no = ?";
		
		try {
			conn = DbSet.getConnection();

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getEvt_title());
			pstmt.setString(2, dto.getEvt_content());
			pstmt.setString(3, dto.getEvt_dating());
			pstmt.setString(4, dto.getEvt_writer());
			pstmt.setInt(5, dto.getEvt_no());

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
	
	public int eventDel(EventDTO dto) {
		int su = 0;
		
		sql = "delete from PJT_EVENT where EVT_WRITER = ? and EVT_NO = ?";
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEvt_writer());
			pstmt.setInt(2, dto.getEvt_no());

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
