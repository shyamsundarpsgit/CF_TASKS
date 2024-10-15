use coldfusion;
create table users(
	id int primary key auto_increment,
	username varchar(50),
    email varchar(50),
    password varchar(100),
    role varchar(10)
);
select * from users;

CREATE TABLE page (
    pageid INT PRIMARY KEY AUTO_INCREMENT,
    pagename VARCHAR(255),
    pagedesc varchar(100)
);
select * from page;

insert into page(pagename,pagedesc)
values(
"amithab","violence at peak"
);