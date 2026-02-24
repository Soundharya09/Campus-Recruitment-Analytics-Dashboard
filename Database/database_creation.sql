create database campus_placement;
use campus_placement;
select * from campus;
select count(*) from campus;

ALTER DATABASE campus_placement
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

SELECT CONCAT(
  'ALTER TABLE `', table_name, '` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;'
)
FROM information_schema.tables
WHERE table_schema = 'campus_placement';