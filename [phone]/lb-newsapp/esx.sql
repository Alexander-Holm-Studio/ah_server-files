-- DELETE FROM jobs WHERE `name` = "reporter";
-- DELETE FROM job_grades WHERE job_name = "reporter";

INSERT INTO `jobs` (`name`, `label`) VALUES ('reporter', 'News Reporter');

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	('reporter', 0, 'reporter', 'Reporter', 25, '{}', '{}'),
	('reporter', 1, 'editor', 'Editor', 50, '{}', '{}'),
	('reporter', 2, 'chief', 'Editor-in-Chief', 100, '{}', '{}'),
	('reporter', 3, 'boss', 'CEO', 150, '{}', '{}')
;