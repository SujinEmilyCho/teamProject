package com.bit.classbbs.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bit.util.MyOracle;

public class ClassBbs_Dao {

	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public ArrayList<ClassBbs_Dto> getList(String courseCode, String keyword) {
		ArrayList<ClassBbs_Dto> list=new ArrayList<ClassBbs_Dto>();
		ClassBbs_Dto bean=null;
		String previousSql="select num, sub, postDate, replyNum, (select name from account where account.accountNum=classBbs.accountNum) as name "
				+ "from ClassBbs where courseCode =? and (sub like ? or content like ?) order by postNum desc, replynum asc";
		String sql1="select count(*) from classbbs where courseCode=? and (sub like ? or content like?)";
		String sql2="select * from (select rownum as rn, num, sub, postDate, replyNum, name "
				+ "from (select (select name from account where account.accountNum=classBbs.accountNum) as name, ClassBbs.* "
				+ "from ClassBbs where courseCode =? and (sub like ? or content like ?) order by postNum desc, replynum asc)) where 0<rn and rn<=300";
		Connection conn=MyOracle.getConnection();
		try {
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(sql1);
			pstmt.setString(1, courseCode);
			pstmt.setString(2, keyword);
			pstmt.setString(3, keyword);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bean=new ClassBbs_Dto();
				bean.setNum(rs.getInt(1));
				list.add(bean);
			}
			pstmt=conn.prepareStatement(sql2);
			pstmt.setString(1, courseCode);
			pstmt.setString(2, keyword);
			pstmt.setString(3, keyword);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				bean=new ClassBbs_Dto();
				bean.setNum(rs.getInt("num"));
				bean.setReplyNum(rs.getInt("replyNum"));
				bean.setSub(rs.getString("sub"));
				bean.setName(rs.getString("name"));
				bean.setPostDate(rs.getDate("postDate"));
				list.add(bean);
			}
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				conn.setAutoCommit(true);
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public ArrayList<String> getCourseCodes() {
		ArrayList<String> list=new ArrayList<String>();
		String sql="select courseCode from course where status='ÁøÇàÁß' order by courseCode desc";
		Connection conn=MyOracle.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("courseCode"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;		
	}
	
	public ClassBbs_Dto readPost(int num) {
		String sql="select (select name from account where account.accountNum = classBbs.accountNum)as name, classBbs.* from classBbs where num=?";
		Connection conn=MyOracle.getConnection();
		ClassBbs_Dto bean=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bean = new ClassBbs_Dto();
				bean.setNum(rs.getInt("num"));
				bean.setCourseCode(rs.getString("courseCode"));
				bean.setPostNum(rs.getInt("postNum"));
				bean.setReplyNum(rs.getInt("replyNum"));
				bean.setAccountNum(rs.getInt("accountNum"));
				bean.setSub(rs.getString("sub"));
				bean.setContent(rs.getString("content"));
				bean.setPostDate(rs.getDate("postDate"));
				bean.setNotice(rs.getInt("notice"));
				bean.setName(rs.getString("name"));
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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
	
	public int addPost(String courseCode, int accountNum, String sub, String content, int notice) {
		String sql="insert into classBbs values (ClassBbs_seq.nextval, ?, nvl((select max(postNum)+1 from classBbs where courseCode=?),1), 0, ?, ?, ?, sysdate, ?)";
		Connection conn = MyOracle.getConnection();
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, courseCode);
			pstmt.setString(2, courseCode);
			pstmt.setInt(3, accountNum);
			pstmt.setString(4, sub);
			pstmt.setString(5, content);
			pstmt.setInt(6, notice);
			result=pstmt.executeUpdate();		
		} catch (SQLException e) {
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int addReply(String courseCode, int postNum, int replyNum, int accountNum, String sub, String content, int notice) {
		String sql1="update classBbs set replyNum=(replyNum+1) where courseCode=? and postNum=? and replyNum>=?";
		String sql2="insert into classBBs values (ClassBbs_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate, ?)";	
		int result2=0;
		Connection conn = MyOracle.getConnection();
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, courseCode);
			pstmt.setInt(2, postNum);
			pstmt.setInt(3, replyNum);
			int result1=pstmt.executeUpdate();
			System.out.println("first query: "+result1);
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, courseCode);
			pstmt.setInt(2, postNum);
			pstmt.setInt(3, replyNum);
			pstmt.setInt(4, accountNum);
			pstmt.setString(5, sub);
			pstmt.setString(6, content);
			pstmt.setInt(7, notice);
			result2=pstmt.executeUpdate();
			System.out.println("second query: "+result2);
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				conn.setAutoCommit(true);
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result2;
	}
	
	public int editPost(int num, String sub, String content, int notice) {
		String sql="update classBbs set sub=?, content=?, notice=? where num=?";
		int result=0;
		Connection conn = MyOracle.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, sub);
			pstmt.setString(2, content);
			pstmt.setInt(3, notice);
			pstmt.setInt(4, num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public void deletePost(int num) {
		String sql="delete classBbs where num=?";
		Connection conn = MyOracle.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			int result=pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
