CREATE TABLE `Weather` (
`w_id` int(11) NOT NULL AUTO_INCREMENT,
`detail` varchar(255) NOT NULL,
`temp` int(255) NOT NULL,
`wind` int(255) NOT NULL,
`sun` int(255) NOT NULL,
`pressure` int(255) NOT NULL,
`clouds` int(255) NOT NULL,
`location` int(255) NOT NULL,
`w_time` datetime NOT NULL,
`visibility` int(255) NOT NULL,
`air_quality` int(255) NOT NULL,
PRIMARY KEY (`w_id`) 
);
CREATE TABLE `Temp` (
`t_id` int(11) NOT NULL,
`min` int(255) NOT NULL,
`max` int(255) NOT NULL,
PRIMARY KEY (`t_id`) 
);
CREATE TABLE `Wind` (
`w_id` int(11) NOT NULL AUTO_INCREMENT,
`speed` int NULL,
`direction` int(255) NULL,
PRIMARY KEY (`w_id`) 
);
CREATE TABLE `Sun` (
`s_id` int(11) NOT NULL AUTO_INCREMENT,
`sunrise` datetime(255) NULL,
`sunset` datetime(255) NULL,
PRIMARY KEY (`s_id`) 
);
CREATE TABLE `Location` (
`l_id` int(11) NOT NULL AUTO_INCREMENT,
`latitude` varchar(255) NULL,
`longtitude` varchar(255) NULL,
PRIMARY KEY (`l_id`) 
);
CREATE TABLE `AirQuality` (
`aq_id` int(11) NOT NULL AUTO_INCREMENT,
`aqi` int(255) NOT NULL,
`publish_platform` varchar(255) NOT NULL,
`dominent_pol` varchar(255) NOT NULL,
`iaqi` int(255) NOT NULL,
PRIMARY KEY (`aq_id`) 
);
CREATE TABLE `IAQI` (
`iaqi_id` int(11) NOT NULL,
`co` double(255,0) NULL,
`no2` double(255,0) NULL,
`o3` double(255,0) NULL,
`p` double(255,0) NULL,
`pm10` double(255,0) NULL,
`pm25` double(255,0) NULL,
`so2` double(255,0) NULL,
`t` double(255,0) NULL,
`w` double(255,0) NULL,
PRIMARY KEY (`iaqi_id`) 
);

ALTER TABLE `Weather` ADD CONSTRAINT `fk_Weather_Temp_1` FOREIGN KEY (`temp`) REFERENCES `Temp` (`t_id`);
ALTER TABLE `Weather` ADD CONSTRAINT `fk_Weather_Wind_1` FOREIGN KEY (`wind`) REFERENCES `Wind` (`w_id`);
ALTER TABLE `Weather` ADD CONSTRAINT `fk_Weather_Sun_1` FOREIGN KEY (`sun`) REFERENCES `Sun` (`s_id`);
ALTER TABLE `Weather` ADD CONSTRAINT `fk_Weather_Location_1` FOREIGN KEY (`location`) REFERENCES `Location` (`l_id`);
ALTER TABLE `Weather` ADD CONSTRAINT `fk_Weather_AirQuality_1` FOREIGN KEY (`air_quality`) REFERENCES `AirQuality` (`aq_id`);
ALTER TABLE `AirQuality` ADD CONSTRAINT `fk_AirQuality_IAQI_1` FOREIGN KEY (`aq_id`) REFERENCES `IAQI` (`iaqi_id`);

