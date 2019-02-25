ALTER TABLE `Weather` DROP FOREIGN KEY `fk_Weather_Temp_1`;

DROP TABLE `Weather`;
DROP TABLE `Temp`;

CREATE TABLE `Weather` (
`w_id` int(11) NOT NULL AUTO_INCREMENT,
`detail` varchar(255) NOT NULL,
`temp` int(255) NOT NULL,
`wind` int(255) NOT NULL,
`sun` int(255) NOT NULL,
`pressure` int(255) NOT NULL,
`location` int(255) NOT NULL,
`w_time` datetime NOT NULL,
PRIMARY KEY (`w_id`) 
);
CREATE TABLE `Temp` (
`t_id` int(11) NOT NULL,
`min` int(255) NOT NULL,
`mac` int(255) NOT NULL,
`t_time` datetime NOT NULL,
PRIMARY KEY (`t_id`) 
);

ALTER TABLE `Weather` ADD CONSTRAINT `fk_Weather_Temp_1` FOREIGN KEY (`temp`) REFERENCES `Temp` (`t_id`);

