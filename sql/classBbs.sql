drop table ClassBbs;
drop sequence ClassBbs_seq;

create table ClassBbs(
	num number primary key,
	courseCode varchar2(10) references course(courseCode),
	postNum number not null,
	replyNum number default 0 not null,	
	accountNum number references account(accountNum),	
	sub varchar2(60) default '제목없음' not null ,
	content varchar2(4000),
	postDate date default sysdate not null,
	notice number(1) default 0
);

create sequence ClassBbs_seq;

--dummy
insert into ClassBbs values (ClassBbs_seq.nextval, '1906JAVA', 1, 0, 8, '공지사항', '첫글은 공지사항입니다', sysdate, 1);
insert into ClassBbs values (ClassBbs_seq.nextval, '1906JAVA', 2, 0, 1, '행정팀글도 공지로!', '행정팀 글입니다', sysdate, 1);
insert into ClassBbs values (ClassBbs_seq.nextval, '1906JAVA', 3, 0, 4, '학생글1', 'user01의 글', sysdate, 0);
insert into ClassBbs values (ClassBbs_seq.nextval, '1906JAVA', 4, 0, 4, '학생글2', 'user01의 글', sysdate, 0);
insert into ClassBbs values (ClassBbs_seq.nextval, '1906JAVA', 5, 0, 4, '학생글 3', 'user01의 글', sysdate, 0);
insert into ClassBbs values (ClassBbs_seq.nextval, '1906JAVA', 4, 1, 4, '학생글 3의 답글', 'user01의 글에 답글', sysdate, 0);
insert into ClassBbs values (ClassBbs_seq.nextval, '1906JAVA', 4, 2, 4, '학생글 3의 답글2', 'user01의 글에 답글', sysdate, 0);
insert into ClassBbs values (ClassBbs_seq.nextval, '1906JAVA', 4, 3, 4, '답글', 'user01의 글에 답글', sysdate, 0);

commit