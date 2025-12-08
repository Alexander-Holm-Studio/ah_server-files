-- Lawyer job setup (idempotent, no hard-coded IDs)

-- Clean old rows if they exist (safe to re-run)
DELETE FROM `job_grades` WHERE `job_name` = 'avocat';
DELETE FROM `jobs` WHERE `name` = 'avocat';
DELETE FROM `addon_account` WHERE `name` = 'society_avocat';
DELETE FROM `datastore` WHERE `name` = 'society_avocat';
DELETE FROM `addon_inventory` WHERE `name` = 'society_avocat';

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('avocat', 'Advokat', 1);

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('avocat', 0, 'associate', 'Advokat Assistent', 200, '{}', '{}'),
('avocat', 1, 'senior',    'Advokat',           350, '{}', '{}'),
('avocat', 2, 'boss',      'Advokat Chef',      500, '{}', '{}');

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('society_avocat', 'Advokat', 1);

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('society_avocat', 'Advokat', 1);

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_avocat', 'Advokat', 1);
