-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2019 at 06:32 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.1.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `userauth`;
USE `userauth`;

-- Table structure for table `app`
CREATE TABLE IF NOT EXISTS `app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `date` text NOT NULL,
  `time` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `regtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert sample appointment data
INSERT INTO `app` (`name`, `email`, `date`, `time`, `description`, `regtime`)
VALUES
('Soumyadip Chowdhury', 'testUser@gmail.com', '6/20/2019', '10:00pm', 'Fever', NOW());

-- Table structure for table `user`
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL UNIQUE,
  `enabled` bit(1) DEFAULT b'1',
  `first_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `authority` varchar(255) DEFAULT 'ROLE_USER',
  `lastseen` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert Admin User with Hashed Password (Password: Admin@123)
INSERT INTO `user` (`confirmation_token`, `username`, `enabled`, `first_name`, `gender`, `last_name`, `password`, `authority`, `lastseen`)
VALUES
('ByAdmin-Panel', 'admin@emedical.com', b'1', 'Admin', 'MALE', 'User', '$2a$10$Vb8Z/P3wNwzJqxZoTYzC9OR4YKZglP1J77Cp7eb.b4N5piZZNfVoO', 'ROLE_ADMIN', NOW())
ON DUPLICATE KEY UPDATE password=password;

COMMIT;

