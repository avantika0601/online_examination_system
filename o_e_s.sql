1)view
display the names of the candidates who has taken the test Python


CREATE VIEW test_name as SELECT test_name,user_id from takes_test natural join test;
select First_name,test_name,college_organisation_name from test_name natural join candidate where test_name='Python';


2)inner JOIN
display names of the tests prepared by admins of PES university
SELECT admin.admin_id,First_name,college_organisation_name,test_name from admin INNER JOIN test where admin.admin_id=test.admin_id and college_organisation_name='PES University';

3)OUTER JOIN
names of the candidates including the ones who has taken software enginnering exam
select First_name,Last_name,college_organisation_name,test_name from candidate LEFT OUTER JOIN takes_test on candidate.user_id=takes_test.user_id INNER JOIN test on takes_test.test_id=test.test_id and test_name="Software Engineering";


Select c.USER_NAME from CANDIDATE as c where EXISTS( select * from takes_test as t where c.user_id=t.user_id and c.user_id=11342);


DELIMITER //
CREATE TRIGGER CHECKS_TESTS
BEFORE INSERT ON TAKES_TEST FOR EACH ROW
BEGIN
DECLARE ERROR_MSG VARCHAR(255);
DECLARE count int;
SET ERROR_MSG=('CANDIDATE CANNOT WRITE MORE THAN 3 TESTS');
IF(select count(*) from takes_test where takes_test.user_id=new.user_id)>3 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT=ERROR_MSG;
END IF;
END;
DELIMITER
//


DELIMITER $$
CREATE FUNCTION isEligible_for(
    score INTEGER)
    RETURNS VARCHAR(20)
    DETERMINISTIC BEGIN
    IF score > 95 THEN
    RETURN ("Eligible for Scholarship Facility");
    ELSE 
    RETURN ("Not eligible");
    END IF;
    END$$
    DELIMITER


select iseligible_for(99) as Eligibility;




set operations;


all users information
select * from candidate union all select * from admin;
 create view all_users as select *from candidate union all select *from admin;

Total number of users who have access to this database;
 select count(*)as no_of_users from all_users;


Return the college names where both candidates as well as admins are admitted;
 SELECT College_Organisation_name FROM candidate intersect SELECT College_Organisation_name  FROM admin;

Information of the candidates who are not taking any tests
select user_name,user_id,college_organisation_name,email_id from candidate where user_id not in(select user_id from takes_test);
4)Retrieve the information of the candidates who have scored above 90 and below 60

select candidate.user_name as Distinction_candidate,t.score,t.grade from candidate  natural join takes_test as t where score>90 union select candidate.user_name as Just_pass_candidate,t.score,t.grade from candidate natural join takes_test as t where score<60;



retireve information of the cadidates who have scored above 90 and below 
create view above_below as select t.user_id from takes_test as t where score>90 intersect select t.user_id from takes_test as t where score<70;
select candidate.user_name,takes_test.user_id,score from above_below natural join takes_test natural join candidate;

Procedure to normalise scores by dividing the score by 100
delimiter $$
CREATE PROCEDURE norm()
BEGIN
UPDATE TAKES_TEST SET score = score/100;
END $$
delimiter ;
SELECT MAX(AVG(t.score))
FROM takes_test as t
WHERE  t.user_id
IN(
select c.user_id from candidate);


select c.user_name,c.college_organisation_name from candidate as c where c.user_id in(select t.user_id from takes_test as t)order by college_organisation_name ;