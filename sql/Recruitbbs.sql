drop table Recruitbbs;
drop sequence Recruitbbs_seq;

create table Recruitbbs(
	num number primary key,
	accountNum number,
	name varchar2(20),
	period varchar2(20),
	sub varchar2(60),
	content varchar2(4000),
	category varchar2(10),
	postdate date	
);
create sequence Recruitbbs_seq;

--dummy
insert into Recruitbbs values (Recruitbbs_seq.nextval,1,'choijieun','18/7/5-18/10/31','Hello Recruit','Happy Friday','JAVA',sysdate);
commit;