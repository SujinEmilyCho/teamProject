drop table course;

create table course(
	courseCode varchar2(10) primary key,
	title varchar2(20),
	teacher varchar2(20),
	maxstu number,
	classroom number(3),
	period varchar2(20),
	status varchar2(9)
);

--dummy
insert into course values ('1903JAVA', 'JAVA����', '�迵��', 30, 303, '19/04/01-19/06/30', '����');
insert into course values ('1904DB', 'DB����', '���¿�', 30, 301, '19/05/01-19/07/31', '������');
insert into course values ('1905WEB', 'Web����', '���ֿ�', 30, 302, '19/06/01-19/08/31', '������');
insert into course values ('1906JAVA', 'Java����', '�ְ���', 30, 203, '19/07/01-19/09/30', '������');
insert into course values ('1907DB', 'DB����', '������', 30, 202, '19/08/01-19/10/31', '����');

commit