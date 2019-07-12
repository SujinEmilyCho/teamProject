drop table score;
drop sequence score_seq;

create table score(
	num number primary key,
	accountNum number not null,
	courseCode references course(courseCode) not null,
	test1 number(3) constraint score_test1_ck check(test1>=0 and test1<=100),
	test2 number(3) constraint score_test2_ck check(test2>=0 and test2<=100),
	test3 number(3) constraint score_test3_ck check(test3>=0 and test3<=100)
);

create sequence score_seq;

--dummy
insert into score values(score_seq.nextval, 4, '1906JAVA', null, null, null);
insert into score values(score_seq.nextval, 9, '1906JAVA', null, null, null);
insert into score values(score_seq.nextval, 10, '1906JAVA', null, null, null);
insert into score values(score_seq.nextval, 11, '1906JAVA', null, null, null);
insert into score values(score_seq.nextval, 12, '1906JAVA', null, null, null);

commit