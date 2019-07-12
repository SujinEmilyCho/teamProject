package com.bit.accountmng.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;


import com.bit.util.MyOracle;

public class AccountDao {
	//전역 객체변수로 사용하기 위해 static 객체변수로 생성
//	static AccountDao instance;
//	
//	//생성자를 private로 만들어 접근을 막는다.
//	private AccountDao(){}
	
	PreparedStatement pstmt=null;
	ResultSet rs =null;
	Connection conn=MyOracle.getConnection();
	
	//계정 목록 가져오기
	public ArrayList<AccountDto> getAccount(){
		
		
		ArrayList<AccountDto> list= new ArrayList<AccountDto>();
		
		
		AccountDto bean=null;
		String sql="select accountNum, id, name, bday, phone, email, accountType, courseCode from Account order by accountNum" ;
		
		try{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				bean=new AccountDto();
				bean.setAccountNum(rs.getInt("accountNum"));
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setBday(rs.getDate("bday"));
				bean.setPhone(rs.getInt("phone"));
				bean.setEmail(rs.getString("email"));
				bean.setAccountType(rs.getInt("accountType"));
				bean.setCourseCode(rs.getString("courseCode"));
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
	
	public int updateAccount(int accountType, String courseCode, int accountNum){	//파라미터 받을라면 이거 써줘야됨
		int result=0;
		String sql="update Account set accountType=?, courseCode=? where accountNum=?"; //?는 파라미터를 받아서 출력
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, accountType);
			pstmt.setString(2, courseCode);
			pstmt.setInt(3, accountNum);
			result=pstmt.executeUpdate();
			System.out.println(sql);
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	//private String search; //게시글 검색
	
	public int searchAccount(int accountType, String courseCode, String name){
		
		int result =0;
		//String sql="select * from Account where name like '%$name$%' ";
		String sql="select * from Account where accountType=? courseCode=? name=? ";
		
		try{
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, accountType);
			pstmt.setString(2, courseCode);
			pstmt.setString(3, name);
			result=pstmt.executeUpdate();
			System.out.println(sql);
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}

	private int getNext() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	//getInstance 메소드를 통해 한번만 생성된 객체를 가져온다.
//	public static AccountDao getInstance(){
//		if(instance == null){	//최초 한번만 new 연산자를 통하여 메모리에 할당한다.
//			instance = new AccountDao();
//			
//		}
//		return instance;
//	}
	
	
	
	
}

