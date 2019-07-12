drop table ClassBbs;
drop sequence ClassBbs_seq;

create table ClassBbs(
	num number primary key,
	courseCode varchar2(10) references course(courseCode),
	postNum number not null,
	replyNum number default 0 not null,	
	accountNum number references account(accountNum),	
	sub varchar2(60) default '�������' not null ,
	content varchar2(4000),
	postDate date default sysdate not null,
	notice number(1) default 0
);

create sequence ClassBbs_seq;

--dummy
insert into ClassBbs values (ClassBbs_seq.nextval, '1906JAVA', 1, 0, 8, '��������', 'ù���� ���������Դϴ�', sysdate, 1);
insert into ClassBbs values (ClassBbs_seq.nextval, '1906JAVA', 2, 0, 1, '�������۵� ������!', '������ ���Դϴ�', sysdate, 1);
insert into ClassBbs values (ClassBbs_seq.nextval, '1906JAVA', 3, 0, 4, '�л���1', 'user01�� ��', sysdate, 0);
insert into ClassBbs values (ClassBbs_seq.nextval, '1906JAVA', 4, 0, 4, '�л���2', 'user01�� ��', sysdate, 0);
insert into ClassBbs values (ClassBbs_seq.nextval, '1906JAVA', 5, 0, 4, '�л��� 3', 'user01�� ��', sysdate, 0);
insert into ClassBbs values (ClassBbs_seq.nextval, '1906JAVA', 4, 1, 4, '�л��� 3�� ���', 'user01�� �ۿ� ���', sysdate, 0);
insert into ClassBbs values (ClassBbs_seq.nextval, '1906JAVA', 4, 2, 4, '�л��� 3�� ���2', 'user01�� �ۿ� ���', sysdate, 0);
insert into ClassBbs values (ClassBbs_seq.nextval, '1906JAVA', 4, 3, 4, '���', 'user01�� �ۿ� ���', sysdate, 0);

commit