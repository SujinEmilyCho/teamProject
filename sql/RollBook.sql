drop table RollBook;
drop sequence Roll_seq;

create table RollBook(
	num number primary key,
	Roll_accountNum number references account(accountNum),
	Roll_courseCode varchar2(10) references course(courseCode),
	attendancedate date,
	attendance varchar2(10)
);

create sequence Roll_seq;

--dummy
insert into RollBook values (Roll_seq.nextval, 4, '1906JAVA', '19-07-16','����');
insert into RollBook values (Roll_seq.nextval, 4, '1906JAVA', '19-07-16','�Ἦ');
insert into RollBook values (Roll_seq.nextval, 4, '1906JAVA', '19-07-16', '�⼮');
insert into RollBook values (Roll_seq.nextval, 4, '1906JAVA', '19-07-16', '�Ἦ');
insert into RollBook values (Roll_seq.nextval, 5, '1905WEB', '19-07-16','����');
insert into RollBook values (Roll_seq.nextval, 5, '1905WEB', '19-07-16','�⼮');
insert into RollBook values (Roll_seq.nextval, 5, '1905WEB', '19-07-16', '�Ἦ');

commit;

select * from RollBook;
