USE `essentialmode`;

INSERT INTO `shops` (`store`, `item`, `price`) VALUES
	('LTDgasoline', 'croquettes', 1500),
	('TwentyFourSeven', 'croquettes', 1500)
;

INSERT INTO `items` (`name`, `label`, `limit`) VALUES
	('croquettes', 'Pet Food', 20)
;

ALTER TABLE `users` ADD COLUMN `pet` VARCHAR(50) NOT NULL;