package com.bit.score.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bit.util.MyOracle;

public class ScoreDao {
	PreparedStatement pstmt=null;
	ResultSet rs=null;

	public void setRecord(String courseCode) {
		String sql1="select accountNum from account where courseCode=? and accountType=4 order by accountNum asc";
		//여기 쿼리 추가해서 진행중이면 레코드 생성하도록 해도 될 듯! 그래야 더이상 추가되는 사람 없이 수강 인원 확정 났을 때 레코드 생성 가능
		String sql2="insert into score values(score_seq.nextval, ?, ?, null, null, null)";
		Connection conn=MyOracle.getConnection();
		ArrayList<Integer> accountNum=new ArrayList<Integer>();
		
		try {
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(sql1);
			pstmt.setString(1, courseCode);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				accountNum.add(rs.getInt("accountNum"));
			}
			for(int i=0; i<accountNum.size();i++) {
				pstmt=conn.prepareStatement(sql2);
				pstmt.setInt(1, accountNum.get(i));
				pstmt.setString(2, courseCode);
				int result=pstmt.executeUpdate();
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
	}
	
	public ArrayList<ScoreDto> getScore(String courseCode) {
		String sql="select accountNum, (select name from account where account.accountNum=score.accountNum) as name, test1, test2, test3 from score where courseCode=? order by name asc";
		Connection conn=MyOracle.getConnection();		
		ArrayList<ScoreDto> list=new ArrayList<ScoreDto>();
		ScoreDto bean=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, courseCode);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				do {
					bean = new ScoreDto();
					bean.setAccountNum(rs.getInt("accountNum"));
					bean.setName(rs.getString("name"));
					bean.setTest1(rs.getInt("test1"));
					bean.setTest2(rs.getInt("test2"));
					bean.setTest3(rs.getInt("test3"));
					list.add(bean);
				}
				while(rs.next());
			}else {
				setRecord(courseCode);
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, courseCode);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					bean = new ScoreDto();
					bean.setAccountNum(rs.getInt("accountNum"));
					bean.setName(rs.getString("name"));
					bean.setTest1(rs.getInt("test1"));
					bean.setTest2(rs.getInt("test2"));
					bean.setTest3(rs.getInt("test3"));
					list.add(bean);
				}
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
	
	public ArrayList<ScoreDto> getMyScore(int accountNum, String courseCode) {
		String sql="select (select name from account where account.accountNum=score.accountNum) as name, test1, test2, test3 from score where accountNum=? and courseCode=?";
		Connection conn=MyOracle.getConnection();		
		ArrayList<ScoreDto> list=new ArrayList<ScoreDto>();
		ScoreDto bean=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, accountNum);
			pstmt.setString(2, courseCode);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				bean = new ScoreDto();
				bean.setAccountNum(accountNum);
				bean.setName(rs.getString("name"));
				bean.setTest1(rs.getInt("test1"));
				bean.setTest2(rs.getInt("test2"));
				bean.setTest3(rs.getInt("test3"));
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
	
	public void updateScore(int[] accountNum, int[] scores) {
		String sql="update score set test1=?, test2=?, test3=? where accountNum=?";
		Connection conn=MyOracle.getConnection();
		try {
			conn.setAutoCommit(false);
			for(int i=0; i<accountNum.length; i++) {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(4, accountNum[i]);
				pstmt.setInt(1, scores[i*3]);
				pstmt.setInt(2, scores[i*3+1]);
				pstmt.setInt(3, scores[i*3+2]);
				pstmt.executeUpdate();
			}
			conn.commit();
		} catch (SQLException e1) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			e1.printStackTrace();
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
	}
	
	public ArrayList<String> getCourseCodes() {
		String sql="select courseCode from course where status='진행중' order by courseCode desc";
		Connection conn=MyOracle.getConnection();
		ArrayList<String> codes=new ArrayList<String>();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				codes.add(rs.getString("courseCode"));
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
		return codes;
	}
	
}
