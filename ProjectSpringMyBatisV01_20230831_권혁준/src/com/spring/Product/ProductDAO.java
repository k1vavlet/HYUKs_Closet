package com.spring.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.spring.DBSet.DbClose;
import com.spring.DBSet.DbSet;

public class ProductDAO {
	String sql;
	public PreparedStatement pstmt;
	public Connection conn;
	public ResultSet rs;
	ProductDTO dto = new ProductDTO();
	
	ReviewDTO rdto = new ReviewDTO();
	
	public int reviewIns(ReviewDTO rdto) {
		int su = 0;
		
		try {
			conn = DbSet.getConnection();
			sql = "INSERT INTO PJT_REVIEW values(REVIEW_SEQ.NEXTVAL, ?, ?, ?, sysdate, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rdto.getRv_pd_name());
			pstmt.setString(2, rdto.getRv_pd_img());
			pstmt.setString(3, rdto.getRv_title());
			pstmt.setString(4, rdto.getRv_content());
			pstmt.setString(5, rdto.getRv_writer());

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
	
	public ArrayList<ReviewDTO> reviewSel() {
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
		sql = "select * from PJT_REVIEW";
		
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			
			while (rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				
				dto.setRv_pd_name(rs.getString("RV_PD_NAME"));
				dto.setRv_pd_img(rs.getString("RV_PD_IMG"));
				dto.setRv_title(rs.getString("RV_TITLE"));
				dto.setRv_date(rs.getString("RV_DATE"));
				dto.setRv_content(rs.getString("RV_CONTENT"));
				dto.setRv_writer(rs.getString("RV_WRITER"));
				dto.setRv_no(rs.getInt("RV_NO"));
				
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
	
	public ArrayList<ReviewDTO> reviewSel_View(String no) {
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
		sql = "select * from PJT_REVIEW where RV_NO = ?";
		
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				
				dto.setRv_pd_name(rs.getString("RV_PD_NAME"));
				dto.setRv_pd_img(rs.getString("RV_PD_IMG"));
				dto.setRv_title(rs.getString("RV_TITLE"));
				dto.setRv_date(rs.getString("RV_DATE"));
				dto.setRv_content(rs.getString("RV_CONTENT"));
				dto.setRv_writer(rs.getString("RV_WRITER"));
				dto.setRv_no(rs.getInt("RV_NO"));
				
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
	
	public int reviewUpd(ReviewDTO dto) {
		int su = 0;
		sql = "update PJT_REVIEW set rv_title = ?, rv_content = ? where rv_writer = ? and rv_no = ?";
		
		try {
			conn = DbSet.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getRv_title());
			pstmt.setString(2, dto.getRv_content());
			pstmt.setString(3, dto.getRv_writer());
			pstmt.setInt(4, dto.getRv_no());

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
	
	public int reviewDel(ReviewDTO dto) {
		int su = 0;
		
		sql = "delete from PJT_REVIEW where RV_WRITER = ? and RV_NO = ?";
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getRv_writer());
			pstmt.setInt(2, dto.getRv_no());

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
	
	public int totalCount() {
		int result = 0;
		
		try {
			conn = DbSet.getConnection();
			
			String sql = "select count(*) as TOTALCOUNT from PJT_PRODUCT";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				result = rs.getInt("TOTALCOUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbClose.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	public ArrayList<ProductDTO> Product_View(String category) {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		sql = "select * from PJT_PRODUCT where PD_CATEGORY = ?";
		
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				
				dto.setSnum(rs.getString("pd_snum"));
				dto.setName(rs.getString("pd_name"));
				dto.setPrice(rs.getString("pd_price"));
				dto.setMany(Integer.parseInt(rs.getString("pd_many")));
				dto.setImg(rs.getString("pd_img"));
				dto.setInfo_img(rs.getString("pd_info_img"));
				dto.setCategory(rs.getString("pd_category"));
				
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
	public ArrayList<ProductDTO> Filter_View(String SQL) {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		
		try {
			conn = DbSet.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				dto = new ProductDTO();
				
				dto.setSnum(rs.getString("pd_snum"));
				dto.setName(rs.getString("pd_name"));
				dto.setPrice(rs.getString("pd_price"));
				dto.setMany(Integer.parseInt(rs.getString("pd_many")));
				dto.setImg(rs.getString("pd_img"));
				dto.setInfo_img(rs.getString("pd_info_img"));
				dto.setCategory(rs.getString("pd_category"));
				
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
	
	public ArrayList<ProductDTO> Search_Viewer(String topic) {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		list.clear();
		
		sql = "select * from PJT_PRODUCT where PD_NAME Like '%' || ? || '%'";
		
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, topic.toUpperCase());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				
				dto.setSnum(rs.getString("pd_snum"));
				dto.setName(rs.getString("pd_name"));
				dto.setPrice(rs.getString("pd_price"));
				dto.setMany(Integer.parseInt(rs.getString("pd_many")));
				dto.setImg(rs.getString("pd_img"));
				dto.setInfo_img(rs.getString("pd_info_img"));
				dto.setCategory(rs.getString("pd_category"));
				
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
	
	public ArrayList<ProductDTO> New_View() {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		sql = "select * from PJT_PRODUCT";
		
		try {
			conn = DbSet.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				dto = new ProductDTO();
				
				dto.setSnum(rs.getString("pd_snum"));
				dto.setName(rs.getString("pd_name"));
				dto.setPrice(rs.getString("pd_price"));
				dto.setMany(Integer.parseInt(rs.getString("pd_many")));
				dto.setImg(rs.getString("pd_img"));
				dto.setInfo_img(rs.getString("pd_info_img"));
				dto.setCategory(rs.getString("pd_category"));
				
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
	
	public ArrayList<ProductDTO> More_Single_View(String snum) {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		sql = "select * from PJT_PRODUCT where PD_SNUM = ?";
		
		try {
			conn = DbSet.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, snum);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				
				dto.setSnum(rs.getString("pd_snum"));
				dto.setName(rs.getString("pd_name"));
				dto.setPrice(rs.getString("pd_price"));
				dto.setMany(Integer.parseInt(rs.getString("pd_many")));
				dto.setImg(rs.getString("pd_img"));
				dto.setInfo_img(rs.getString("pd_info_img"));
				dto.setCategory(rs.getString("pd_category"));
				
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
}
