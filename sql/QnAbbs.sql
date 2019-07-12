drop table Qnabbs;
create table Qnabbs(
	num number primary key,
	name varchar2(20),
	phone number(15),
	postdate date default sysdate,
	sub varchar2(60),
	content varchar2(2000),
	category varchar2(20),
	status varchar2(15)
);
commit;
create sequence QnAbbs_seq;
insert into QNAbbs values(QnAbbs_seq.nextval,'김지수',01098989845,sysdate,'제목','내용 내용 내용','JAVA','미완료');
