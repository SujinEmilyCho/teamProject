drop table postComment;
drop sequence postComment_seq;

create table postComment(
	num number primary key,
	classBbsNum references classBbs(num) not null,
	accountNum references account(accountNum) not null,	
	content varchar2(600) not null,
	postdate date default sysdate not null
);

create sequence postComment_seq;

--dummy
insert into postComment values (postComment_seq.nextval, 3, 4, '내 글에 댓글 써보기', sysdate);
insert into postComment values (postComment_seq.nextval, 3, 9, 'Hi', sysdate);
insert into postComment values (postComment_seq.nextval, 3, 10, 'Hey', sysdate);
insert into postComment values (postComment_seq.nextval, 3, 8, '강사입니당', sysdate);

commit