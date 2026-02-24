use campus_placement;
select * from campus;

#Overall Placement Rate
select count(*) as total_students, sum(Placed) as placed_students, round(sum(Placed) * 100.0 / 
count(*), 2) as placement_rate from campus;

#Average Salary of Placed Students
select round(avg(Salary_LPA), 2) as avg_salary from campus where Placed = 1;

#Total Students Placed
select count(*) from campus where Placed = 1;

#Highest & Lowest Salary Offered
select min(Salary_LPA) as minimum_salary, max(Salary_LPA) as maximum_salary from campus where 
Placed = 1;

#Placement Rate by Gender
select Gender,count(*) as total,sum(Placed) as placed,round(sum(Placed) * 100.0 / count(*), 2) 
as placement_rate from campus group by Gender;

#Average Salary by Gender
select Gender, round(avg(Salary_LPA), 2) avg_salary from campus where Placed = 1 group by Gender;

#Placement Rate by City Tier
select City_Tier, round(sum(Placed) * 100.0 / count(*), 2) as placement_rate from campus group by
City_Tier;

#Salary Comparison by City Tier
select City_Tier, round(avg(Salary_LPA), 2) as avg_salary from campus where Placed = 1
group by City_Tier;

#Placement Rate by SSC Performance Band
select case when SSC_Percentage >= 85 then 'Excellent'
when SSC_Percentage >= 70 then 'Good'
else 'Average' end as SSC_Category, round(sum(Placed) * 100 / count(*), 2) as placement_rate from 
campus group by SSC_Category order by placement_rate desc;

#Degree Percentage vs Salary
select round(avg(Degree_Percentage), 2) as avg_degree_percent, round(avg(Salary_LPA), 2) as avg_salary
from campus where Placed = 1;

#Do Backlogs Affect Placement?
select Backlogs, round(sum(Placed) * 100.0 / count(*), 2) as placement_rate from campus group by
Backlogs order by Backlogs;

#Placement Rate: MBA vs Non-MBA
select Has_MBA, round(sum(Placed) * 100.0 / count(*), 2) as placement_rate from campus group by 
Has_MBA;

#Average Salary for MBA Students
select round(avg(Salary_LPA), 2) as avg_salary from campus where Placed = 1 and Has_MBA = 1;

#Does MBA Percentage Affect Salary?
select round(avg(MBA_Percentage), 2) as mba_percent, round(avg(Salary_LPA), 2) as avg_salary from 
campus where Placed = 1 and Has_MBA= 1;

#Placement Rate by Work Experience
select case 
when Work_Experience_Months = 0 then 'No Experience'
when Work_Experience_Months <= 12 then '0-1 Year'
else '1+ Year' end as Experience_group, round(sum(Placed) * 100.0 / count(*), 2) as placement_rate 
from campus group by Experience_group;

#Work Experience vs Salary
select round(avg(Work_Experience_Months), 2) as avg_work_experience, round(avg(Salary_LPA), 2) as 
avg_salary from campus where Placed = 1;

#Technical Skills vs Placement
select Technical_Skills_Score, round(sum(Placed) * 100.0 / count(*), 2) as placement_rate from campus
group by Technical_Skills_Score order by Technical_Skills_Score;

#Communication Score vs Salary
select communication_score, round(avg(Salary_LPA), 2) as avg_salary from campus where Placed = 1 
group by communication_score order by communication_score;

#Aptitude Score vs Placement
select case
when Aptitude_Skills_Score >= 80 then 'High'
when Aptitude_Skills_Score >= 60 then 'Medium'
else 'Low' end as Aptitude_Score_Band, round(sum(Placed) * 100.0 / count(*), 2) as placement_rate 
from campus group by Aptitude_Score_Band;

#Placement Rate by HSC Stream
select HSC_Stream, round(sum(Placed) * 100.0 / count(*), 2) as placement_rate from campus group by
HSC_Stream order by placement_rate desc;

#Placement Rate by Degree Field
select Degree_Field, round(sum(Placed) * 100.0 / count(*), 2) as placement_rate from campus group by
Degree_Field order by placement_rate desc;

#Highest Paying Specializations
select Specialization, round(avg(Salary_LPA), 2) as avg_salary from campus where Placed = 1 group by
Specialization order by avg_salary desc;

#Internships vs Placement
select Internships, round(sum(Placed) * 100.0 / count(*), 2) as placement_rate from campus group by
Internships order by Internships;

#Internships vs Salary
select Internships, round(avg(Salary_LPA), 2) as avg_salary from campus where Placed = 1
group by Internships order by Internships;

#Placement Rate by Age
select Age, round(sum(Placed) * 100.0 / count(*), 2) as placement_rate from campus group by Age 
order by Age;

#Profile of Highest Salary Students
select * from campus where Salary_LPA = (select max(Salary_LPA) from campus);

#Placement Rate by Gender and City Tier
select Gender, City_Tier, round(sum(Placed) * 100.0 / count(*), 2) as Placement_rate from campus 
group by Gender, City_Tier order by Gender, City_Tier;

#Salary by Gender and MBA
select Gender, Has_MBA, round(avg(Salary_LPA), 2) avg_salary from campus where Placed = 1 group by 
Gender, Has_MBA;

#Skill Segmentation by Placement Rate 
select case 
when Technical_Skills_Score >= 8 and communication_score >= 8 then "High Tech & High Comm"
when Technical_Skills_Score >= 8 and communication_score < 8 then "High Tech & Low Comm"
when Technical_Skills_Score < 8 and communication_score >= 8 then "Low Tech & High Comm"
else "Low Tech & Low Comm" end as Skill_Segmentation, count(*) as total_students, sum(Placed) as 
placed_students, round(sum(Placed) * 100.0 / count(*), 2) as placement_rate, round(avg(Salary_LPA), 2)
as avg_salary from campus group by Skill_Segmentation order by placement_rate desc;

#Salary Expectation : MBA vs Non-MBA & Fresher vs Experienced
select case
when Has_MBA = 0 and Work_Experience_Months = 0 then "Non-MBA Fresher"
when Has_MBA = 0 and Work_Experience_Months > 0 then "Non-MBA Experienced"
when Has_MBA = 1 and Work_Experience_Months = 0 then "MBA Fresher"
when Has_MBA = 1 and Work_Experience_Months > 0 then "MBA Experienced" end as work_experience_segment,
count(*) as total_students, sum(Placed) as placed_students, round(sum(Placed) * 100.0 / count(*), 2)
as placement_rate, round(avg(Salary_LPA), 2) as avg_salary from campus group by work_experience_segment
order by avg_salary desc;

#Placement Rate Above 75% Degree Score
select case
when Degree_Percentage >= 75 then "Above 75%"
else "Below 75%" end as degree_band, round(sum(Placed) * 100.0 / count(*), 2) as placement_rate 
from campus group by degree_band order by placement_rate desc;

#Salary of Students with All Academics > 70%
select round(avg(Salary_LPA), 2) as avg_salary from campus where Placed = 1 and SSC_Percentage >= 70
and HSC_Percentage >= 70 and Degree_Percentage >= 70;

#Placement Rate by Experience Bands
select case 
when Work_Experience_Months = 0 then "Fresher"
when Work_Experience_Months <= 12 then "Upto 1 Year"
when Work_Experience_Months <= 24 then "1-2 Years"
else "2+ Years" end as experience_band, 
count(*) as total_students, round(sum(Placed) * 100.0 / count(*), 2) as placed_students, 
round(avg(Salary_LPA), 2) as avg_salary from campus group by experience_band order by experience_band;

#Do 3+ Internships Increase Salary?
select case 
when Internships >= 3 then "3+ Internships"
else "Less than 3 Internships" end as internship_band, round(avg(Salary_LPA), 2) as avg_salary from 
campus where Placed = 1 group by internship_band;

#High Aptitude but Low Communication – Placement Rate
select round(sum(Placed) * 100.0 / count(*), 2) as placement_rate from campus where 
Aptitude_Skills_Score >= 80 and communication_score < 6;

#Profile of Students Earning Above 15 LPA
select count(*) as high_salary_students, round(avg(Technical_Skills_Score), 2) as avg_tech, 
round(avg(Soft_Skills_Score), 2) as avg_soft_skill, round(avg(Aptitude_Skills_Score), 2) as avg_aptitude,
round(avg(communication_score), 2) as avg_comm, round(avg(Work_Experience_Months), 2) avg_exp, 
round(avg(Internships), 2) as avg_internship from campus where Placed = 1 and Salary_LPA > 15;

#Commerce vs Science Salary Comparison
select HSC_Stream, round(avg(Salary_LPA), 2) as avg_salary from campus where Placed = 1 group by 
HSC_Stream order by avg_salary desc;

#Placement Rate with Backlogs > 2
select Backlogs, round(sum(Placed) * 100.0 / count(*), 2) as placement_rate from campus where 
Backlogs > 2 group by Backlogs order by Backlogs;

#Students at High Risk of Not Getting Placed
select count(*) from campus where Placed = 0 and Technical_Skills_Score < 5 and communication_score < 5
and Internships = 0;

#Salary Distribution by Bands
select case 
when Salary_LPA < 8 then "Below 8 LPA"
when Salary_LPA between 8 and 12 then "8-12 LPA"
when Salary_LPA between 12 and 15 then "12-15 LPA"
else "15+ LPA" end as salary_distribution_band, 
count(*) as total_students, round(count(*) * 100.0 / sum(count(*)) over(), 2) as percent_distribution 
from campus where Placed = 1 group by salary_distribution_band order by salary_distribution_band;

#Leadership Roles vs Placement
select Leadership_Roles, round(sum(Placed) * 100.0 / count(*), 2) as placement_rate from campus 
group by Leadership_Roles order by Leadership_Roles;

#Extracurricular Activities vs Salary
select Extracurricular_Activities, round(avg(Salary_LPA), 2) as avg_salary from campus where Placed = 1
group by Extracurricular_Activities order by Extracurricular_Activities;

#City Tier Salary Premium %
select City_Tier, round(avg(Salary_LPA), 2) as avg_salary from campus where Placed = 1 group by City_Tier;

#Average Total Skill Score of Placed vs Not Placed
select Placed, round(avg(Technical_Skills_Score + Soft_Skills_Score + communication_score), 2) as 
avg_total_skill_score from campus group by Placed;

#Does Younger Age Improve Placement?
select case 
when Age <= 21 then "21 or Below"
else "Above 21" end as age_group, 
round(sum(Placed) * 100.0 / count(*), 2) as placement_rate from campus group by age_group;

#Average Profile of Placed Students
select round(avg(SSC_Percentage), 2) as avg_ssc, round(avg(Degree_Percentage), 2) as avg_degree, 
round(avg(Technical_Skills_Score)) as avg_tech, round(avg(Work_Experience_Months)) as avg_exp from 
campus where Placed = 1;

#Lowest Skill Score Student Who Got Placed
select * from campus where Placed = 1 order by Technical_Skills_Score asc limit 1;

#Highest Academic Student Who Didn’t Get Placed
select * from campus where Placed = 0 order by Degree_Percentage desc limit 1;

#Ideal Candidate Profile Count
select count(*) from campus where Technical_Skills_Score >= 8 and communication_score >= 8 and 
Internships >= 2 and Work_Experience_Months >= 6;