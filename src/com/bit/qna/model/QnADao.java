package com.bit.qna.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.bit.util.MyOracle;


public class QnADao {

	PreparedStatement pstmt=null;
	ResultSet rs =null;
	
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbd:oracle:thin:@localhost:1521:xe";
	String user="hr";
	String password="hr";
	Connection conn;
	
	
	public ArrayList<QnADto> getlist(){
		String query="select num,sub,name,phone,postdate,status,category from QnAbbs order by num";
		System.out.println(query);
		PreparedStatement pstmt = null;
		ArrayList<QnADto> list= new ArrayList<QnADto>();
		QnADto bean=null;
		
		try{
			Connection conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(query);
			rs=pstmt.executeQuery();
			while(rs.next()){
				bean=new QnADto();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setPhone(rs.getInt("phone"));
				bean.setPostdate(rs.getDate("postdate"));
				bean.setSub(rs.getString("sub"));
				bean.setCategory(rs.getString("category"));
				bean.setStatus(rs.getString("status"));
				list.add(bean);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	public void insert(String name, int phone, String category, String sub, String content ) {
		
		PreparedStatement preparedStatement = null;
		Connection conn =null;
		try {
			String query = "insert into QnAbbs values(QnAbbs_seq.nextval,?,?,sysdate,?,?,?,'¹Ì¿Ï·á')";

			conn=MyOracle.getConnection();
			preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, name);
			preparedStatement.setInt(2, phone);
			preparedStatement.setString(3, sub);
			preparedStatement.setString(4, content);
			preparedStatement.setString(5, category);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	
	public QnADto detail(int num){
		QnADto bean=new QnADto();
		String sql="select num,name,category,phone,postdate,sub,status,content from QnAbbs where num=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setCategory(rs.getString("category"));
				bean.setPhone(rs.getInt("phone"));
				bean.setPostdate(rs.getDate("postdate"));
				bean.setSub(rs.getString("sub"));
				bean.setStatus(rs.getString("status"));
				bean.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return bean;
	}
	
	
	public void edit(int num ,String status){
		QnADto bean=new QnADto();
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			String sql="update QnAbbs set status=? where num=?";
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, status);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
