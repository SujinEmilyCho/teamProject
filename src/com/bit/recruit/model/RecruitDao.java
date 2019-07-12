package com.bit.recruit.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RecruitDao {
	private String driver="oracle.jdbc.driver.OracleDriver";
	private String url="jdbc:oracle:thin:@localhost:1521:xe";
	private String user="hr";
	private String password="hr";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public RecruitDao() {
		try{
			Class.forName(driver);
			conn=DriverManager.getConnection(url, user, password);
			
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public Connection getConnection(){	//커넥션 잘 됐는지 확인하기 위해서 , 프론트 없어도 확인 가능
		return this.conn;
	}
	
	public ArrayList<RecruitDto> getList(){	//list 보여주기 
		//System.out.println("hihi");
		
		ArrayList<RecruitDto> list=null;
		list=new ArrayList<RecruitDto>();
		String sql="select num,sub,period from Recruitbbs order by num";
		
		//System.out.println("hihihih222");
		
		try{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			//System.out.println("3333");
			
			while(rs.next()){
				//System.out.println("4444");
				RecruitDto bean =new RecruitDto();
				bean.setNum(rs.getInt("num"));
				bean.setSub(rs.getString("sub"));
				bean.setPeriod(rs.getString("period"));
				
				
				list.add(bean);
				
				
			}
			//System.out.println("5555");
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
	
	public RecruitDto getListOne(int num){	//list detail 보여주기
		RecruitDto bean =new RecruitDto();
		String sql= "select num,category,postdate,sub,period from Recruitbbs where num=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setNum(rs.getInt("num"));
				bean.setCategory(rs.getString("category"));
				bean.setPostdate(rs.getDate("postdate"));
				bean.setSub(rs.getString("sub"));
				bean.setPeriod(rs.getString("period"));
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
	
	public void addList(String category,String sub,String period, String content){
		String sql ="insert into Recruitbbs (num,category,postdate,sub,period,content) values (Recruitbbs_seq.nextval,?,sysdate,?,?,?)"; //파라미터를 받아서 출력할 거는 ?로
		System.out.println(sql);
		try{
			pstmt=getConnection().prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, sub);
			pstmt.setString(3, period);
			pstmt.setString(4, content);
			
			int result =pstmt.executeUpdate();			
		}catch (SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
