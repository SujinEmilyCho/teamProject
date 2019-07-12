drop table account;
drop sequence account_seq;

create table account(
	accountNum number primary key,
	id varchar2(20) not null unique,
	pw varchar2(20) not null,
	name varchar2(20) not null,
	email varchar2(50) not null,
	phone number(11) not null,
	bday date not null,
	accountType number constraint account_accountType_ck check(accountType in (1, 2, 3, 4)),
	courseCode varchar2(10) default null
);

create sequence account_seq;

alter table account add constraint accout_courseCode_fk foreign key (courseCode) references course(courseCode);

--dummy
insert into account values (account_seq.nextval, 'manager', '1234', '행정팀', 'manager@naver.com', 01012345678, '91/04/26', 1, null);
insert into account values (account_seq.nextval, 'sales', '1234', '영업팀', 'sales@naver.com', 01012345678, '94/03/09', 2, null);
insert into account values (account_seq.nextval, 'teacher', '1234', '강사', 'teacher@naver.com', 01012345678, '86/07/28', 3, null);
insert into account values (account_seq.nextval, 'user01', '1234', '학생1', 'user01@naver.com', 01012345678, '95/01/30', 4, '1906JAVA');
insert into account values (account_seq.nextval, 'user02', '1234', '학생2', 'user02@naver.com', 01012345678, '93/12/09', 4, '1905WEB');
insert into account values (account_seq.nextval, 'user03', '1234', '학생3', 'user03@naver.com', 01012345678, '98/08/18', null, null);
insert into account values (account_seq.nextval, 'user04', '1234', '학생4', 'user04@naver.com', 01012345678, '92/09/09', null, null);

insert into account values (account_seq.nextval, 'teacher2', '1234', '강사2', 'teacher2@naver.com', 01012345678, '86/07/28', 3, '1906JAVA');
insert into account values (account_seq.nextval, 'user05', '1234', '학생5', 'user05@naver.com', 01012345678, '93/06/30', 4, '1906JAVA');
insert into account values (account_seq.nextval, 'user06', '1234', '학생6', 'user06@naver.com', 01012345678, '91/11/20', 4, '1906JAVA');
insert into account values (account_seq.nextval, 'user07', '1234', '학생7', 'user07@naver.com', 01012345678, '97/05/10', 4, '1906JAVA');
insert into account values (account_seq.nextval, 'user08', '1234', '학생8', 'user08@naver.com', 01012345678, '94/08/06', 4, '1906JAVA');

insert into account values (account_seq.nextval, 'user09', '1234', '학생9', 'user09@naver.com', 01012345678, '94/08/06', 4, '1905WEB');
insert into account values (account_seq.nextval, 'user10', '1234', '학생10', 'user10@naver.com', 01012345678, '94/08/06', 4, '1905WEB');
insert into account values (account_seq.nextval, 'user11', '1234', '학생11', 'user11@naver.com', 01012345678, '94/08/06', 4, '1905WEB');
insert into account values (account_seq.nextval, 'user12', '1234', '학생12', 'user12@naver.com', 01012345678, '94/08/06', 4, '1904DB');

commit

