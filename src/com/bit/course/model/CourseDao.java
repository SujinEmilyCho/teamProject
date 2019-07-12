package com.bit.course.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bit.util.MyOracle;

public class CourseDao {
	PreparedStatement pstmt=null;
	ResultSet rs =null;
	
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbd:oracle:thin:@localhost:1521:xe";
	String user="hr";
	String password="hr";
	Connection conn;
	
	
	public ArrayList<CourseDto> getAccount(String coursecode1, String title1, String status1 ,String search){
		String query="select coursecode,title,teacher,maxstu,classroom,period,status from course";
		System.out.println("coursecode1 : "+coursecode1);
		System.out.println("title1 : "+title1);
		System.out.println("status1 : "+status1);
		System.out.println("search1 : "+search);
			
			
			if(!coursecode1.equals("null")&&!title1.equals("null")&&!status1.equals("null")&&!search.equals("null")) {
				query="select coursecode,title,teacher,maxstu,classroom,period,status from course";
				}else if(!search.equals("null")) {
					query="select * from course where coursecode like '%"+search+"%' or title like '%"+search+"%' or teacher like '%"+search+"%' or maxstu like '%"+search+"%' or classroom like '%"+search+"%' or  period like '%"+search+"%' or status like '%"+search+"%'";
				}else if(!coursecode1.equals("null")) {
				 query = "select coursecode, title,teacher,maxstu,classroom,period,status from course where coursecode = ?";
				}else if (!title1.equals("null")) {
				 query = "select coursecode,title,teacher,maxstu,classroom,period,status from course where title = ?";
				}else if (!status1.equals("null")) {
				 query = "select coursecode,title,teacher,maxstu,classroom,period,status from course where status = ?";
				}else { 
				 query="select coursecode,title,teacher,maxstu,classroom,period,status from course";
				}
		
		System.out.println(query);
		PreparedStatement pstmt = null;
		ArrayList<CourseDto> list= new ArrayList<CourseDto>();
		CourseDto bean=null;
		
		try{
			Connection conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(query);
			if(!coursecode1.equals("null")&&!title1.equals("null")&&!status1.equals("null")&&!search.equals("null")) {
				
			}else if(!search.equals("null")) {
			}else if(!coursecode1.equals("null")) {
			 pstmt.setString(1, coursecode1);
			}else if (!title1.equals("null")) {
			 pstmt.setString(1, title1);
			}else if (!status1.equals("null")){
			 pstmt.setString(1, status1);
			}
			 
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				bean=new CourseDto();
				bean.setCoursecode(rs.getString("coursecode"));
				bean.setTitle(rs.getString("title"));
				bean.setTeacher(rs.getString("teacher"));
				bean.setMaxstu(rs.getInt("maxstu"));
				bean.setClassroom(rs.getInt("classroom"));
				bean.setPeriod(rs.getString("period"));
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
	
	
	
	public void insert(String coursecode, String title, String teacher, int maxstu, int classroom, String period,
			String status ) {
		
		PreparedStatement preparedStatement = null;
		Connection conn =null;
		try {
			String query = "insert into course values(?,?,?,?,?,?,?)";
			
			conn=MyOracle.getConnection();
			preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, coursecode);
			preparedStatement.setString(2, title);
			preparedStatement.setString(3, teacher);
			preparedStatement.setInt(4, maxstu);
			preparedStatement.setInt(5, classroom);
			preparedStatement.setString(6, period);
			preparedStatement.setString(7, status);
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
	public CourseDto detail(String coursecode){
		CourseDto bean=new CourseDto();
		String sql="select coursecode,title,teacher,maxstu,classroom,period,status from course where coursecode=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,coursecode);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setCoursecode(rs.getString("Coursecode"));
				bean.setTitle(rs.getString("title"));
				bean.setTeacher(rs.getString("teacher"));
				bean.setMaxstu(rs.getInt("maxstu"));
				bean.setClassroom(rs.getInt("classroom"));
				bean.setPeriod(rs.getString("period"));
				bean.setStatus(rs.getString("status"));
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
	public void edit(String coursecode,String title, String teacher, int maxstu, int classroom, String period, String status){
		CourseDto bean=new CourseDto();
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			String sql="update course set title=?,teacher=?,maxstu=?,classroom=?,period=?,status=? where coursecode=?";
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, teacher);
			pstmt.setInt(3, maxstu);
			pstmt.setInt(4, classroom);
			pstmt.setString(5, period);
			pstmt.setString(6, status);
			pstmt.setString(7, coursecode);
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
	
	public void delete(String coursecode) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		try {
			conn=MyOracle.getConnection();
			String query = "delete from course where coursecode = ?";
			preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, coursecode);
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}
	
	/*public ArrayList<CourseDto> search(String coursecode, String title, String status) {
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		String query=null;
		
		ArrayList<CourseDto> list= new ArrayList<CourseDto>();
		CourseDto bean=null;
		
		try {
			conn=MyOracle.getConnection();
			
			if(coursecode != null) {
			 query = "select coursecode, title,teacher,maxstu,classroom,period,status from course where coursecode = ?";
			 preparedStatement = conn.prepareStatement(query);
			 preparedStatement.setString(1, coursecode);
			 preparedStatement.executeUpdate();
			}else if (title!=null) {
			 query = "select coursecode,title,teacher,maxstu,classroom,period,status from course where title = ?";
			 preparedStatement = conn.prepareStatement(query);
			 preparedStatement.setString(1, title);
			 preparedStatement.executeUpdate();	
			}else if (status!=null) {
			 query = "select coursecode,title,teacher,maxstu,classroom,period,status from course where status = ?";
			 preparedStatement = conn.prepareStatement(query);
			 preparedStatement.setString(1, status);
			 preparedStatement.executeUpdate();
			}
			
			while(rs.next()){
				bean=new CourseDto();
				bean.setCoursecode(rs.getString("coursecode"));
				bean.setTitle(rs.getString("title"));
				bean.setTeacher(rs.getString("teacher"));
				bean.setMaxstu(rs.getInt("maxstu"));
				bean.setClassroom(rs.getInt("classroom"));
				bean.setPeriod(rs.getString("period"));
				bean.setStatus(rs.getString("status"));
				list.add(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
		return list;
	}
	*/
	
	
	
}
