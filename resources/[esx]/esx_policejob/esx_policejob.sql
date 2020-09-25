USE `es_extended`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_police', 'Police', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_police', 'Police', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_police', 'Police', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('police', 'LSPD')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('police',0,'recruit','Recrue',20,'{}','{}'),
	('police',1,'officer','Officier',40,'{}','{}'),
	('police',2,'sergeant','Sergent',60,'{}','{}'),
	('police',3,'lieutenant','Lieutenant',85,'{}','{}'),
	('police',4,'boss','Commandant',100,'{}','{}')
;

CREATE TABLE `fine_types` (
	`id` int NOT NULL AUTO_INCREMENT,
	`label` varchar(255) DEFAULT NULL,
	`amount` int DEFAULT NULL,
	`category` int DEFAULT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `fine_types` (label, amount, category) VALUES
	('Misuse of the horn',30,0),
	('Cross a solid line',40,0),
	('Circulation à contresens',250,0),
	('Reverse traffic',250,0),
	('Off-road traffic',170,0),
	('Failure to respect safety distances',30,0),
	('Dangerous / forbidden stop',150,0),
	('Stationnement gênant / interdit',70,0),
	('Inconvenient / prohibited parking',70,0),
	('Non-compliance with a priority vehicle',90,0),
	('Failure to comply with a stop',105,0),
	('Failure to comply with a red light',130,0),
	('Dangerous overtaking',100,0),
	('Vehicle not in condition',100,0),
	('Driving without a license',1500,0),
	('Hit and run',800,0),
	('Speeding <5 km / h',90,0),
	('Speeding <5 km / h',120,0),
	('Speeding 15-30 km / h',180,0),
	('Speeding> 30 km / h',300,0),
	('Traffic obstruction',110,1),
	('Degradation of public roads',90,1),
	('Public disorder',90,1),
	('Obstruction of police operation',130,1),
	('Insult to / between civilians',75,1),
	('Contempt of police officer',110,1),
	('Verbal threat or intimidation of a civilian',90,1),
	('Verbal threat or intimidation of a police officer',150,1),
	('Illegal protest',250,1),
	('Corruption attempt',1500,1),
	('Bladed weapon out in town',120,2),
	('Bladed weapon out in village',300,2),
	('Unauthorized carrying of a weapon (lack of license)',600,2),
	('Illegal carrying of a weapon',700,2),
	('Caught in flag lockpick',300,2),
	('Theft Auto',1800,2),
	('Drug sale',1500,2),
	('Drug manufacturing',1500,2),
	('Drug possession',650,2),
	('Civilian hostage taking',1500,2),
	('State agent kidnapping',2000,2),
	('Special robbery',650,2),
	('Store robbery',650,2),
	('Bank robbery',1500,2),
	('Civilian shooting',2000,3),
	('State agent shooting',2500,3),
	('Attempted civilian murder',3000,3),
	('Attempted murder on state agent',5000,3),
	('Murder on civilian',10000,3),
	('Murder on state agent',30000,3),
	('Unintentional murder',1800,3),
	('Business scam',2000,2)
;
