create database hr_data ;

select * from hrdata ;

create table hrdata (
emp_no int not null primary key,
gender varchar(15) not null,
marital_status varchar(50) ,
age_band varchar(50) ,
age int ,
department varchar(50) , education varchar(50) ,
education_field varchar(50), job_role varchar(50),
business_travel varchar(50) , employee_count int ,
attrition varchar(50) , attrition_label varchar(50) ,
job_satisfaction int, active_employee int ) ;

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/hrdata.csv"
into table hrdata
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows ;

select * from hrdata ;



select sum(employee_count) from hrdata ;

select count(attrition) from hrdata where attrition = 'yes' ;

select round((select count(attrition) from hrdata where attrition = 'yes')/
(select sum(employee_count) from hrdata)*100 , 2)as attrition_rate ;

select count(active_employee) from hrdata where active_employee = 1 ;

select avg(age) avg_age from hrdata ;


select department, count(attrition) as attrition
from hrdata where attrition = 'yes'  
group by 1 ;


SELECT 
    a.dept,
    a.attrition,
    CONCAT(ROUND((a.attrition / b.total) * 100, 2),
            '%') AS attrition_percentage
FROM
    (SELECT 
        department AS dept, COUNT(attrition) attrition
    FROM
        hrdata
    WHERE
        attrition = 'yes'
    GROUP BY 1) a
        CROSS JOIN
    (SELECT 
        COUNT(attrition) total
    FROM
        hrdata
    WHERE
        attrition = 'yes') b;
        
        select * from hrdata ;
        
      SELECT 
    gender, COUNT(attrition) AS attrition
FROM
    hrdata
WHERE
    attrition = 'yes'
GROUP BY 1;

select age_band ,count(emp_no) as total_employee from hrdata
group by 1
 ;

select age_band ,gender, count(attrition) from hrdata 
where attrition = 'yes'
group by 1 ,2
order by 1;

select education_field ,count(attrition) from hrdata
where attrition = 'yes'
group by 1 ;

select * from hrdata ;

select job_role , job_satisfaction, count(emp_no)
from hrdata 
group by 1,2
order by 1,2 ;