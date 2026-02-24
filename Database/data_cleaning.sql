use campus_placement;
select * from campus;

#RENAME COLUMNS
alter table campus rename column `student_id` to `Student_Id`;
alter table campus rename column `gender` to `Gender`;
alter table campus rename column `age` to `Age`;
alter table campus rename column `city_tier` to `City_Tier`;
alter table campus rename column `ssc_percentage` to `SSC_Percentage`;
alter table campus rename column `ssc_board` to `SSC_Board`;
alter table campus rename column `hsc_percentage` to `HSC_Percentage`;
alter table campus rename column `hsc_percentage` to `HSC_Percentage`;
alter table campus rename column `hsc_board` to `HSC_Board`;
alter table campus rename column `hsc_stream` to `HSC_Stream`;
alter table campus rename column `degree_percentage` to `Degree_Percentage`;
alter table campus rename column `degree_field` to `Degree_Field`;
alter table campus rename column `mba_percentage` to `MBA_Percentage`;
alter table campus rename column `specialization` to `Specialization`;
alter table campus rename column `internships_count` to `Internships`;
alter table campus rename column `projects_count` to `Projects`;
alter table campus rename column `certifications_count` to `Certificates`;
alter table campus rename column `technical_skills_score` to `Technical_Skills_Score`;
alter table campus rename column `soft_skills_score` to `Soft_Skills_Score`;
alter table campus rename column `aptitude_score` to `Aptitude_Skills_Score`;
alter table campus rename column `work_experience_months` to `Work_Experience_Months`;
alter table campus rename column `leadership_roles` to `Leadership_Roles`;
alter table campus rename column `extracurricular_activities` to `Extracurricular_Activities`;
alter table campus rename column `backlogs` to `Backlogs`;
alter table campus rename column `placed` to `Placed`;
alter table campus rename column `salary_lpa` to `Salary_LPA`;

#CHANGE DATATYPES
alter table campus modify column Gender varchar(30);
alter table campus modify column City_Tier varchar(50);
alter table campus modify column SSC_Board varchar(50);
alter table campus modify column HSC_Board varchar(50);
alter table campus modify column HSC_Stream varchar(60);
alter table campus modify column Degree_Field varchar(60);
alter table campus modify column Specialization varchar(100);

#FINDING NULL VALUES
select count(*) as gender_null from campus where Gender is null;
select count(*) as Age_null from campus where Age is null;
select count(*) as City_Tier_null from campus where City_Tier is null;
select count(*) as SSC_Percentage_null from campus where SSC_Percentage is null;
select count(*) as SSC_Board_null from campus where SSC_Board is null;
select count(*) as HSC_Percentage_null from campus where HSC_Percentage is null;
select count(*) as HSC_Board_null from campus where HSC_Board is null;
select count(*) as HSC_Stream_null from campus where HSC_Stream is null;
select count(*) as Degree_Percentage_null from campus where Degree_Percentage is null;
select count(*) as Degree_Field_null from campus where Degree_Field is null;
select count(*) as MBA_Percentage_null from campus where MBA_Percentage is null;
select count(*) as Specialization_null from campus where Specialization is null;
select count(*) as Internships_null from campus where Internships is null;
select count(*) as Projects_null from campus where Projects is null;
select count(*) as Certificates_null from campus where Certificates is null;
select count(*) as Technical_Skills_Score_null from campus where Technical_Skills_Score is null;
select count(*) as Soft_Skills_Score_null from campus where Soft_Skills_Score is null;
select count(*) as Aptitude_Skills_Score_null from campus where Aptitude_Skills_Score is null;
select count(*) as communication_score_null from campus where communication_score is null;
select count(*) as Work_Experience_Months_null from campus where Work_Experience_Months is null;
select count(*) as Leadership_Roles_null from campus where Leadership_Roles is null;
select count(*) as Extracurricular_Activities_null from campus where Extracurricular_Activities is null;
select count(*) as Backlogs_null from campus where Backlogs is null;
select count(*) as Placed_null from campus where Placed is null;
select count(*) as Salary_LPA_null from campus where Salary_LPA is null;

#MAKE PRIMARY KEY
select count(*) from campus where Student_Id is null;
select Student_Id, count(*) from campus group by Student_Id having count(*) > 1;
alter table campus add constraint Id primary key first (Student_Id);

#HANDLE NULL VALUES IN SPECIALIZATION COLUMN
update campus set Specialization = 'Not Applicable' where Specialization = 'None';

#CREATING MBA FLAG COLUMN
alter table campus add column Has_MBA int;
alter table campus drop column has_mba;

update campus set Has_MBA = case 
when MBA_Percentage = 0 then 0
else 1 end;

