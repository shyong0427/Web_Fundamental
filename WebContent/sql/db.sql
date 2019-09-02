create table notice(
n_num int primary key auto_increment,
n_writer varchar(100) not null,
n_title varchar(200) not null,
n_content varchar(16383) not null,
n_status char(1) not null, #1이면 일반글, 2이면 삭제글
n_flag char(2) not null, #1이면 회사공지사항, 2이면 회원공지사항
n_ip varchar(60) not null, 
n_regdate datetime not null
);

CREATE TABLE member(
m_seq INT PRIMARY KEY AUTO_INCREMENT,
m_id VARCHAR(20) NOT null,
m_email VARCHAR(100) NOT null,
m_name VARCHAR(20) NOT null,
m_pwd CHAR(41) NOT null,
m_phone VARCHAR(15) NOT null,
m_regdate DATETIME NOT null
);