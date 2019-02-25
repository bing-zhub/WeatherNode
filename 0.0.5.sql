/*
 Navicat Premium Data Transfer

 Source Server         : 39.106.10.108
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 39.106.10.108:3306
 Source Schema         : Project

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 25/02/2019 22:10:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for AirQuality
-- ----------------------------
DROP TABLE IF EXISTS `AirQuality`;
CREATE TABLE `AirQuality` (
  `aq_id` int(11) NOT NULL AUTO_INCREMENT,
  `aqi` int(255) NOT NULL,
  `publish_platform` varchar(255) NOT NULL,
  `dominent_pol` varchar(255) NOT NULL,
  `iaqi` int(255) NOT NULL,
  PRIMARY KEY (`aq_id`),
  KEY `airquality_iaqi` (`iaqi`),
  CONSTRAINT `airquality_iaqi` FOREIGN KEY (`iaqi`) REFERENCES `IAQI` (`iaqi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for IAQI
-- ----------------------------
DROP TABLE IF EXISTS `IAQI`;
CREATE TABLE `IAQI` (
  `iaqi_id` int(11) NOT NULL AUTO_INCREMENT,
  `co` double(255,0) DEFAULT NULL,
  `no2` double(255,0) DEFAULT NULL,
  `o3` double(255,0) DEFAULT NULL,
  `p` double(255,0) DEFAULT NULL,
  `pm10` double(255,0) DEFAULT NULL,
  `pm25` double(255,0) DEFAULT NULL,
  `so2` double(255,0) DEFAULT NULL,
  PRIMARY KEY (`iaqi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Location
-- ----------------------------
DROP TABLE IF EXISTS `Location`;
CREATE TABLE `Location` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Temp
-- ----------------------------
DROP TABLE IF EXISTS `Temp`;
CREATE TABLE `Temp` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `min` int(255) NOT NULL,
  `max` int(255) NOT NULL,
  `t_time` datetime NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Weather
-- ----------------------------
DROP TABLE IF EXISTS `Weather`;
CREATE TABLE `Weather` (
  `w_id` int(11) NOT NULL AUTO_INCREMENT,
  `detail` varchar(255) NOT NULL,
  `temp` int(255) NOT NULL,
  `wind` int(255) NOT NULL,
  `pressure` int(255) NOT NULL,
  `air_quality` int(255) NOT NULL,
  `location` int(255) NOT NULL,
  `w_time` datetime NOT NULL,
  PRIMARY KEY (`w_id`),
  KEY `fk_Weather_Temp_1` (`temp`) USING BTREE,
  KEY `fk_Weather_Wind_1` (`wind`) USING BTREE,
  KEY `fk_Weather_Location_1` (`location`) USING BTREE,
  KEY `fk_Weather_AirQuality` (`air_quality`) USING BTREE,
  CONSTRAINT `weather_air` FOREIGN KEY (`air_quality`) REFERENCES `AirQuality` (`aq_id`),
  CONSTRAINT `weather_location` FOREIGN KEY (`location`) REFERENCES `Location` (`l_id`),
  CONSTRAINT `weather_temp` FOREIGN KEY (`temp`) REFERENCES `Temp` (`t_id`),
  CONSTRAINT `weather_wind` FOREIGN KEY (`wind`) REFERENCES `Wind` (`w_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Wind
-- ----------------------------
DROP TABLE IF EXISTS `Wind`;
CREATE TABLE `Wind` (
  `w_id` int(11) NOT NULL AUTO_INCREMENT,
  `speed` int(11) DEFAULT NULL,
  `direction` int(255) DEFAULT NULL,
  PRIMARY KEY (`w_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
