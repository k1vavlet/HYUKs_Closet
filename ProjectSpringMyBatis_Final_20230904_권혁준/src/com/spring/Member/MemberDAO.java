package com.spring.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.spring.DBSet.DbClose;
import com.spring.DBSet.DbSet;

public class MemberDAO {
	String sql;
	public PreparedStatement pstmt;
	public Connection conn;

	MemberDTO dto = new MemberDTO();
	
	public boolean memIdChk(String id) {
		boolean flag = false;
		sql = "select MEM_ID from PJT_MEMBER where MEM_ID = ?";

		try {
			conn = DbSet.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			flag = pstmt.executeQuery().next();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn, pstmt);
		}
		
		return flag;
	}
	
	public int memIns(MemberDTO dto) {
		int su = 0;
		
		try {
			conn = DbSet.getConnection();
			sql = "insert into PJT_MEMBER values(?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getDate());
			pstmt.setString(5, dto.getHp());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, dto.getAddr01());
			pstmt.setString(8, dto.getAddr02());

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
	
	public int memLog(String id, String pwd) {
		int su = 0;
		sql = "select * from PJT_MEMBER where MEM_ID = ? and MEM_PW = ?";

		try {
			conn = DbSet.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);

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
	
	public ArrayList<MemberDTO> memFindID(MemberDTO dto) {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		int su = 0;
		sql = "select * from PJT_MEMBER where MEM_NAME = ? and MEM_EMAIL = ?";

		try {
			conn = DbSet.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEmail());

			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				dto.setName(rs.getString("mem_name"));
				dto.setId(rs.getString("mem_id"));
				dto.setHp(rs.getString("mem_hp"));
				dto.setEmail(rs.getString("mem_email"));
				
				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn, pstmt);
		}
		
		return list;
	}
	
	public ArrayList<MemberDTO> memFindPWD (MemberDTO dto) {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		
		sql = "select * from PJT_MEMBER where MEM_NAME = ? and MEM_EMAIL = ? and MEM_ID = ?";

		try {
			conn = DbSet.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getId());

			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				dto.setName(rs.getString("mem_name"));
				dto.setId(rs.getString("mem_id"));
				dto.setEmail(rs.getString("mem_email"));
				
				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn, pstmt);
		}
		
		return list;
	}
	
	public int memChange_PWD(MemberDTO dto) {
		int su = 0;
		
		sql = "update PJT_MEMBER set MEM_PW = ? where MEM_ID = ?";
		
		try {
			conn = DbSet.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getId());

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
	
	public ArrayList<MemberDTO> memSel(String id) {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		sql = "select * from PJT_MEMBER where MEM_ID = ?";
		
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setName(rs.getString("mem_name"));
				dto.setPwd(rs.getString("mem_pw"));
				dto.setId(rs.getString("mem_id"));
				dto.setHp(rs.getString("mem_hp"));
				dto.setDate(rs.getString("mem_brith"));
				dto.setEmail(rs.getString("mem_email"));
				dto.setAddr01(rs.getString("mem_addr1"));
				dto.setAddr02(rs.getString("mem_addr2"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn, pstmt);
		}
		
		return list;
	}
	
	public int memUpd(MemberDTO dto) {
		int su = 0;
		sql = "update PJT_MEMBER set MEM_PW = ?, MEM_EMAIL = ?, MEM_HP = ?, MEM_BRITH = TO_DATE(?, 'YYYY-MM-DD'), MEM_ADDR1 = ?, MEM_ADDR2 = ? where MEM_ID = ? and MEM_NAME = ?";
		
		try {
			conn = DbSet.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getHp());
			pstmt.setString(4, dto.getDate());
			pstmt.setString(5, dto.getAddr01());
			pstmt.setString(6, dto.getAddr02());
			pstmt.setString(7, dto.getId());
			pstmt.setString(8, dto.getName());

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
	
	public int memDel(MemberDTO dto) {
		int su = 0;
		
		sql = "delete from PJT_MEMBER where MEM_ID = ? and MEM_PW = ?";
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());

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
