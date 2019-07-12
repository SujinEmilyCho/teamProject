package com.bit.classbbs.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bit.util.MyOracle;

public class PostComment_Dao {

	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public ArrayList<PostComment_Dto> readComment(int classBbsNum) {
		String sql="select (select name from account where account.accountNum=postComment.accountNum) as name, postComment.* from postComment where classbbsNum=? order by num desc";
		ArrayList<PostComment_Dto> list=new ArrayList<PostComment_Dto>();
		PostComment_Dto bean=null;
		conn= MyOracle.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, classBbsNum);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				bean=new PostComment_Dto();
				bean.setNum(rs.getInt("num"));
				bean.setClassBbsNum(rs.getInt("classBbsNum"));
				bean.setAccountNum(rs.getInt("accountNum"));
				bean.setContent(rs.getString("content"));
				bean.setName(rs.getString("name"));
				bean.setPostDate(rs.getDate("postDate"));
				list.add(bean);
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
	
	public int addComment(int classBbsNum, int accountNum, String content) {
		String sql="insert into postcomment values (postComment_seq.nextval, ?, ?, ?, sysdate)";
		int result=0;
		conn=MyOracle.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, classBbsNum);
			pstmt.setInt(2, accountNum);
			pstmt.setString(3, content);
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
	
	public int deleteComment(int num) {
		String sql="delete postComment where num=?";
		int result=0;
		conn=MyOracle.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result=pstmt.executeUpdate();
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
	
}
