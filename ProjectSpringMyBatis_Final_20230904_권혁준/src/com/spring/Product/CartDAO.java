package com.spring.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.spring.DBSet.DbClose;
import com.spring.DBSet.DbSet;

public class CartDAO {
	Connection conn;
	ResultSet rs;
	PreparedStatement pstmt;
	
	public int cartIns(CartDTO dto) {
		int su = 0;
		String sql = "insert into PJT_Cart values(?, ?, ?)";
		
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCr_name());
			pstmt.setString(2, dto.getCr_img());
			pstmt.setString(3, dto.getCr_price());
			
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
	
	public int cartAllDel() {
		int su = 0;
		String sql = "delete from PJT_CART";
		
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			
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
	
	public int cartDel(String[] ct_name) {
		int su[] = null;
		int res = 0;
		String sql = "delete from PJT_Cart where cr_name = ?";
		
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			
			for (int i = 0; i < ct_name.length; i++) {
				pstmt.setString(1, ct_name[i]);
				
				pstmt.addBatch();
			}
			
			su = pstmt.executeBatch();
			
			for (int i = 0; i < su.length; i++) {
				if(su[i] == -2) {
					res++;
				}
			}
			
			if (ct_name.length == res) {
				conn.commit();
			}
			else {
				conn.rollback();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn, pstmt);
		}
		
		return res;
	}
	
	public ArrayList<CartDTO> cartSel() {
		ArrayList<CartDTO> list = new ArrayList<CartDTO>();
		String sql = "select * from PJT_CART";
		
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CartDTO dto = new CartDTO();
				
				dto.setCr_name(rs.getString("cr_name"));
				dto.setCr_img(rs.getString("cr_img"));
				dto.setCr_price(rs.getString("cr_price"));
				
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
}
