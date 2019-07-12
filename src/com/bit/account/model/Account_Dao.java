package com.bit.account.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;

import com.bit.util.MyOracle;

public class Account_Dao {
	private PreparedStatement pstmt = null;
	private ResultSet rs =null;
	private Connection conn= MyOracle.getConnection();
	
	public Account_Dto login(String id, String pw){
		String sql = "select * from account where id=? and pw=?";
		Account_Dto bean=null;
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean = new Account_Dto();
				bean.setAccountNum(rs.getInt("accountNum"));
				bean.setAccountType(rs.getInt("accountType"));
				bean.setCourseCode(rs.getString("courseCode"));
				bean.setName(rs.getString("name"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return bean;
	}
	
	public int joinUser(String name, String id, String pw, String email, int phone, String bday){
		String sql ="insert into account (accountNum, id, pw, name, email, phone, bday) values (account_seq.nextval, ?,?,?,?,?,to_date(?)) ";
		int result=0;
		try{
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setInt(5, phone);
			pstmt.setString(6, bday);
			result=pstmt.executeUpdate();
			conn.commit();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				conn.setAutoCommit(true);
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public String findID(String name, String email, String bday, int phone){
		String sql = "select id from account where name=? and email=? and phone=? and to_date(bday)=?";
		System.out.println("select id from account where name='"+name+"' and email='"+email+"' and phone="+phone+" and to_date(bday)='"+bday+"'");
		String fiid=null;
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setInt(3, phone);
			pstmt.setString(4, bday);
			rs=pstmt.executeQuery();
			if(rs.next()){
				fiid = rs.getString("id");
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return fiid;
		
	}
}
