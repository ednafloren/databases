 //1 
 create database library_db
 //3
 CREATE TABLE shift(
	name varchar(200),shift_id int NOT NULL PRIMARY KEY,
 start_time TIME,end_time TIME);
 CREATE TABLE librarian(
	name varchar(200),shift_id int,librarian_id int NOT NULL PRIMARY KEY,email varchar(200) unique,
 telephone int unique,foreign key(shift_id) references shift(shift_id));

CREATE TABLE author
(
    name varchar(200),
    author_id int NOT NULL PRIMARY KEY,
    email varchar(200) UNIQUE ,
    telephone int UNIQUE,
    bio varchar(500) ,
    company_id int,
    
     FOREIGN KEY (company_id)
        REFERENCES pub_company (company_id)
);

CREATE TABLE student
(
    name varchar(200),
    stud_id int NOT NULL PRIMARY KEY,
    contact int UNIQUE,
	adress varchar(200),
    
);
CREATE TABLE pub_company
(
    name varchar(200),
    company_id int NOT NULL PRIMARY KEY,
);
CREATE TABLE book
(
    
    book_id int NOT NULL PRIMARY KEY,
	title varchar(200) UNIQUE,
    price INT NOT NULL ,
    description varchar(500),
    publish_date date NOT NULL,
    publish_year int NOT NULL,
    isbn INT NOT NULL,
	image BYTEA NOT NULL,
	author_id INT,stud_id INT,
     FOREIGN KEY (stud_id)
        REFERENCES student(stud_id)
		 FOREIGN KEY (author_id)
        REFERENCES author(author_id)
);
CREATE TABLE borrowing_details
(
    
    borrow_id int NOT NULL PRIMARY KEY,
	
    borrow_date date NOT NULL,
    return_date int NOT NULL,
	stud_id INT,book_id INT,
     FOREIGN KEY (stud_id)
        REFERENCES student(stud_id)
		 FOREIGN KEY (book_id)
        REFERENCES book(book_id));


 //5
 INSERT INTO public.author(
	name, author_id, email, telephone, bio, company_id)
	VALUES ('SHAKESPARE','01','www.shakespare@gmail.com','0796543232','Born in  America in 1998,went to Havard university ,has a masters in poetry','0001'),
	('MICHEAL JORDAN','02','www.micheal@gmail.com','0786453423','Born in america also an athelete ,has a degree in engeering','0002');

INSERT INTO public.librarian(
	name, shift_id, librarian_id, email, telephone)
	VALUES ('KASULE JOHN','1','00001','kasule@gmail.com','0705642345'),('NAMATA JOYCE','2','00002','joy@gmail.com','0708463456'),
    ('NDAGIRE MARIAM','2','00003','mariam@gmail.com','0789564532'),('MIREMBE MARTHA','1','00004','martha@gmail.com','0768978786');
INSERT INTO public.pub_company(
	name, company_id)
	VALUES ('KS publishers','0001'),('jk publishers','0002');
INSERT INTO public.shift(
	name, shift_id, start_time, end_time)
	VALUES ('morning','1', '9:00', '1:00'),('evening','2','2:00','6:00');
INSERT INTO public.book(
	book_id, title, price, description, publish_date, publish_year, isbn, author_id, stud_id)
	VALUES ('350','The crosscountry','200','This is about sports','7/10/1998','1998','13','01','002'),
	('230','The holiday','320','This is it','7/10/1998','1998','1','01','001'),
	('210','The monstor','2000','This is it','7/10/1998','1998','2','01','001'),
	('250','Animall farm','1000','This is it','7/10/1998','1998','1','01','002'),
	('260','javascript','1500','This is it','7/10/2000','2000','6','01','003'),
	('270','unforgetable','1000','This is it','7/10/1998','1998','8','01','001'),
	('280','Old valley','500','This is it','7/10/2007','2007','1','02','002'),
	('290','Learn python','3500','Python basics','2/07/2010','2010','10','01','003'),
	('300','new begining','4000','New beginings happen','7/10/1998','1998','11','02','003');
    
 //6
 select * from author;
 //7
 select * from librarian where shift_id='01';
 //8
 select student.name,borrowing_details.stud_id,borrowing_details.borrow_id  from student 
 inner join borrowing_details on student.stud_id=borrowing_details.stud_id where status='not returned';
 //10
 SELECT COUNT(book_id)
FROM book where author_id='001'and publish_year='1998';
SELECT COUNT(book_id)
FROM book where author_id='001'and publish_year='2010';
SELECT COUNT(book_id)
FROM book where author_id='001'and publish_year='2000';
SELECT COUNT(book_id)
FROM book where author_id='002'and publish_year='2007';

// 11
SELECT COUNT(borrow_id)
FROM borrowing_details where stud_id='001'and book_id='230';
