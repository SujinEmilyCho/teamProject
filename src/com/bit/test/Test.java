package com.bit.test;

import java.sql.Connection;
import java.util.ArrayList;

import com.bit.classbbs.model.ClassBbs_Dao;
import com.bit.classbbs.model.ClassBbs_Dto;
import com.bit.classbbs.model.PostComment_Dao;
import com.bit.classbbs.model.PostComment_Dto;
import com.bit.score.model.ScoreDao;
import com.bit.util.MyOracle;

public class Test {
	
	public static void main(String[] args) {
		Connection conn=MyOracle.getConnection();
		System.out.println(conn);
	
		ScoreDao dao=new ScoreDao();
//		dao.getScore("1905WEB");
		int[] accountNum = {100, 101, 102};
		int[] scores = {1, 2, 3, 1, 2, 3, 1, 2, 3};
		String courseCode = "1904DB";
		dao.updateScore(accountNum, scores);
		
		ClassBbs_Dao classBbsDao = new ClassBbs_Dao();
		//readPost
		ClassBbs_Dto bean = classBbsDao.readPost(1);
		System.out.println(bean.getSub() + " : " + bean.getContent());
		
		//addPost
//		classBbsDao.addPost("1906JAVA", 1, "it's test", "test", 1);
		
		//editPost
//		classBbsDao.editPost(10, "edited", "edited", 0);
		
		//deletePost
//		classBbsDao.deletePost(10);
		
//		classBbsDao.addReply("1906JAVA", 4, 3, 1, "reply test", "reply test", 0);
		
		PostComment_Dao postCommentDao = new PostComment_Dao();
		ArrayList<PostComment_Dto> list=postCommentDao.readComment(3);
		System.out.print(list.get(0).getContent());
		
//		postCommentDao.addComment(3, 1, "행정도 테스트");
		//postCommentDao.deleteComment(5);
		
	}
}
