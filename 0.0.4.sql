CREATE TABLE `AirQuality` (
`aq_id` int(11) NOT NULL AUTO_INCREMENT,
`aqi` int(255) NOT NULL,
`publish_platform` varchar(255) NOT NULL,
`dominent_pol` varchar(255) NOT NULL,
`iaqi` int(255) NOT NULL,
PRIMARY KEY (`aq_id`) 
)

CREATE TABLE `IAQI` (
`iaqi_id` int(11) NOT NULL AUTO_INCREMENT,
`co` double(255,0) NULL DEFAULT NULL,
`no2` double(255,0) NULL DEFAULT NULL,
`o3` double(255,0) NULL DEFAULT NULL,
`p` double(255,0) NULL DEFAULT NULL,
`pm10` double(255,0) NULL DEFAULT NULL,
`pm25` double(255,0) NULL DEFAULT NULL,
`so2` double(255,0) NULL DEFAULT NULL,
`t` double(255,0) NULL DEFAULT NULL,
`w` double(255,0) NULL DEFAULT NULL,
PRIMARY KEY (`iaqi_id`) 
)

CREATE TABLE `Location` (
`l_id` int(11) NOT NULL AUTO_INCREMENT,
`latitude` varchar(255) NULL DEFAULT NULL,
`longitude` varchar(255) NULL DEFAULT NULL,
PRIMARY KEY (`l_id`) 
)

CREATE TABLE `Temp` (
`t_id` int(11) NOT NULL AUTO_INCREMENT,
`min` int(255) NOT NULL,
`max` int(255) NOT NULL,
`t_time` datetime NOT NULL,
PRIMARY KEY (`t_id`) 
)

CREATE TABLE `Weather` (
`w_id` int(11) NOT NULL AUTO_INCREMENT,
`detail` varchar(255) NOT NULL,
`temp` int(255) NOT NULL,
`wind` int(255) NOT NULL,
`sun` int(255) NOT NULL,
`pressure` int(255) NOT NULL,
`air_quality` int(255) NOT NULL,
`location` int(255) NOT NULL,
`w_time` datetime NOT NULL,
PRIMARY KEY (`w_id`) ,
INDEX `fk_Weather_Temp_1` (`temp` ASC) USING BTREE,
INDEX `fk_Weather_Wind_1` (`wind` ASC) USING BTREE,
INDEX `fk_Weather_Location_1` (`location` ASC) USING BTREE,
INDEX `fk_Weather_AirQuality` (`air_quality` ASC) USING BTREE
)

CREATE TABLE `Wind` (
`w_id` int(11) NOT NULL AUTO_INCREMENT,
`speed` int(11) NULL DEFAULT NULL,
`direction` int(255) NULL DEFAULT NULL,
PRIMARY KEY (`w_id`) 
)

ALTER TABLE `AirQuality` ADD CONSTRAINT `fk_AirQuality_IAQI_1` FOREIGN KEY (`aq_id`) REFERENCES `IAQI` (`iaqi_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `Weather` ADD CONSTRAINT `fk_Weather_Location_1` FOREIGN KEY (`location`) REFERENCES `Location` (`l_id`) ON DELETE SET NULL ON UPDATE SET NULL;
ALTER TABLE `Weather` ADD CONSTRAINT `fk_Weather_Temp_1` FOREIGN KEY (`temp`) REFERENCES `Temp` (`t_id`) ON DELETE SET NULL ON UPDATE SET NULL;
ALTER TABLE `Weather` ADD CONSTRAINT `fk_Weather_Wind_1` FOREIGN KEY (`wind`) REFERENCES `Wind` (`w_id`) ON DELETE SET NULL ON UPDATE SET NULL;
ALTER TABLE `Weather` ADD CONSTRAINT `fk_Weather_AirQuality_1` FOREIGN KEY (`air_quality`) REFERENCES `AirQuality` (`aq_id`) ON DELETE SET NULL ON UPDATE SET NULL;

