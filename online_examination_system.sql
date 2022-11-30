"creating the table admin"

CREATE TABLE ADMIN(admin_id INT NOT NULL,user_name varchar(50) NOT NULL,First_Name varchar(50)NOT NULL,Last_Name varchar(50),Email varchar(20),College_Organisation_name varchar(50)NOT NULL,phone_no varchar(50),PRIMARY KEY(admin_id));

CREATE TABLE CANDIDATE(user_id INT NOT NULL,user_name varchar(50)NOT NULL,First_Name varchar(50)NOT NULL,Last_name varchar(50),college_organisation_name varchar(50)NOT NULL,email_id varchar(20),phone_no varchar(50),PRIMARY KEY(user_id));

CREATE TABLE TEST(test_id INT NOT NULL,Test_Name varchar(20)NOT NULL,admin_id INT NOT NULL,start_date_time DATETIME,end_date_time DATETIME,PRIMARY KEY(test_id),FOREIGN KEY(admin_id)REFERENCES ADMIN(admin_id) ON UPDATE CASCADE ON DELETE CASCADE);




CREATE TABLE TAKES_TEST (user_id INT NOT NULL,test_id INT NOT NULL,score INT,grade char(1),PRIMARY KEY(user_id,test_id),FOREIGN KEY(user_id)REFERENCES CANDIDATE(user_id) ON DELETE CASCADE ON UPDATE CASCADE,FOREIGN KEY(test_id)REFERENCES TEST(test_id)ON DELETE CASCADE ON UPDATE CASCADE);



"adding values into database"

insert into admin values(102,"kavita_kumar","Kavita","Kumar","kavitakumar@gmail.com","PES University","7795702175"),(111,"Divya_Prasad","Divya","Prasad","divyaprasad@gmail.com","PES University","9019877263"),(123,"Dilip_Ghosh","Dilip","Ghosh","dilipghosh@gmail.com","PES University","9916762903"),(243,"Manav_Manglani","Manav","Manglani","manavmanglani123@gmail.com","RV college","2728534518"),(456,"Joey_Josh","Joey","Josh","joeyjosh34@gmail.com","RV College","2356784512"),(478,"Naleen_Deepth","Naleen","Deepth","deepthnaleen@gmail.com","RV college","1234567898"),(567,"Priya_DN","Priya","DN","priyadn_12@gmail.com","Reva University","6362856784"),(789,"Preetam_Agarwal","Preetam","Agarwal","agarwalpreetam@gmail.com","Reva University","4567124897"),(890,"Bhavya_Gouda","Bhavya","Gouda","bhavyagouda_12@gmail.com","Reva University","9916762987");


insert into candidate values
(35467,"Bhaskar_Mehta","Bhaskar","Mehta","PES University","bhaskarmehta@gmail.com","7795702175"),
(46577,"Arun��_Kumar","Arun","Kumar","PES University","arunkumar_654@gmail.com","9019766485"),
(37685,"Deepti_Chowdary","Deepti","Chowdary","PES University","deeptichowdary12@gmail.com","9916762945"),
(67895,"Mouni_Roy","Mouni","Roy","PES University","mouni_roy@gmail.com","7795702134"),
(67453,"Avani_Gupta","Avani","Gupta","PES University","avanigupta21@gmail.com","6758483921"),
(21345,"Nayana_Navalli","Nayana","Navalli","RV College","nayana�_navalli@gmail.com","7988564732"),
(89675,"Divya_Spandana","Divya","Spandana","RV college","divyaspandana@gmail.com","9019877263"),
(99671,"Mahima_Bhat","Mahima","Bhat","RV College","mahimabhat@gmail.com","7795702189"),
(11342,"Kajal�_Preet","Kajal","Preet","RV College","kajalpreet@gmail.com","9916762890"),
(90908,"Nayan_Mehta","Nayan","Mehta","RV College","nayanmehta@gmail.com","7734251617"),
(34213,"Neha_Revankar","Neha","Revankar","Reva University","neharevankar@gmail.com","8867465823"),
(78541,"Anil_Bhaskar","Anil","Bhaskar","Reva University","anilbhaskar@gmail.com","9987564731"),
(78564,"Pratijna_Bhat","Pratijna","Bhat","Reva University","pratijnabhat@gmail.com","9967484726"),
(89001,"Dhanya_KN","Dhanya","KN","Reva University","dhanya_kn@gmail.com","998778566543"),
(78563,"Rohan��_Mylar","Rohan","Mylar","Reva University","rohanmylar@gmail.com","9945233214");






"adding values into the table Test"


insert into test values
(1,"DBMS",102,"2022-12-10 10:00:00 AM","2022-12-10 12:00:00 PM"),
(4,"Python",123,"2022-12-13 12:00:00 PM","2022-12-13 2:00:00 PM"),
(7,"Software Engineering",111,"2022-12-14 12:00:00 PM","2022-12-14 2:00:00 PM"),
(13,"DBMS",243,"2022-12-18 1:00:00 PM","2022-12-18 3:00:00 PM"),
(5,"Python",456,"2022-12-16 12:00:00 PM","2022-12-16 2:00:00 PM"),
(10,"Software Engineering",478,"2022-12-08 12:00:00 PM","2022-12-08 2:00:00 PM"),
(19,"DBMS",789,"2022-12-20 1:00:00 PM","2022-12-20 3:00:00 PM"),
(6,"Python",567,"2022-12-21 1:00:00 PM","2022-12-21 3:00:00 PM"),
(31,"Software Engineering",890,"2022-12-17 12:00:00 PM","2022-12-17 2:00:00 PM")

;



"adding values into takes_test"


insert into takes_test values
(37685,7,91,'A'),
(37685,1,89,'A'),
(37685,4,95,'S'),
(67895,1,81,'B'),
(67895,7,71,'C'),
(67895,4,91,'A'),
(67453,1,98,'S'),
(67453,7,78,'B'),
(67453,4,98,'S'),
(35467,1,67,'D'),
(35467,7,89,'A'),
(35467,4,73,'B'),
(46577,1,75,'B'),
(46577,7,96,'S'),
(46577,4,98,'S'),
(34213,6,90,'A'),
(34213,31,89,'A'),
(34213,19,82,'A'),
(89001,6,78,'B'),
(89001,31,80,'B'),
(89001,19,70,'C'),
(78541,6,76,'B'),
(78541,31,90,'A'),
(78541,19,78,'B'),
(78563,6,56,'F'),
(78563,31,90,'A'),
(78563,19,89,'A'),
(78564,6,76,'B'),
(78564,31,75,'B'),
(78564,19,90,'A'),
(90908,13,90,'A'),
(90908,10,94,'S'),
(90908,5,84,'A'),
(89675,13,99,'S'),
(89675,10,77,'B'),
(89675,5,88,'A'),
(11342,13,89,'A'),
(11342,10,98,'S'),
(11342,5,90,'A'),
(99671,13,66,'D'),
(99671,10,55,'F'),
(99671,5,99,'S'),
(21345,13,89,'A'),
(21345,10,56,'F'),
(21345,5,90,'A');



"join operations"
1)information of the tests that are perpared by admins of particular colleges"
select a.admin_id,a.first_name,a.last_name,a.College_Organisation_name,t.test_name from admin as a inner join test as t where a.admin_id=t.admin_id order by college_organisation_name;


2)"tests attended by candidates belognging to pes university and test name is Python"
select c.first_name,c.last_name,t.test_name,c.college_organisation_name from candidate as c natural join takes_test natural join test as t where college_organisation_name="PES University" and test_name="Python";





aggregate queries
1)select the candidate with lowest marks asscording to the college_organisation_name
select First_name,college_organisation_name,min(score) from takes_test natural join candidate group by college_organisation_name;

2)average marks of each college
select college_organisation_name,avg(score) from takes_test natural join candidate group by college_organisation_name;

count of candidates who have scored max
select count(score) as count_of_max_score,First_name,college_organisation_name from takes_test natural join candidate where score=max(score);



