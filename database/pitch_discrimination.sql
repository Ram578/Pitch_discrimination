-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2017 at 03:19 PM
-- Server version: 5.6.15-log
-- PHP Version: 5.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pitch_discrimination`
--
CREATE DATABASE IF NOT EXISTS `pitch_discrimination` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pitch_discrimination`;

-- --------------------------------------------------------

--
-- Table structure for table `aims_answers`
--

DROP TABLE IF EXISTS `aims_answers`;
CREATE TABLE IF NOT EXISTS `aims_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionid` int(11) NOT NULL,
  `optionid` int(11) NOT NULL,
  `addeddate` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionid` (`questionid`),
  KEY `optionid` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aims_certile`
--

DROP TABLE IF EXISTS `aims_certile`;
CREATE TABLE IF NOT EXISTS `aims_certile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(5) NOT NULL,
  `certile` int(5) NOT NULL,
  `createddate` datetime NOT NULL,
  `updatedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

-- --------------------------------------------------------

--
-- Table structure for table `aims_employees`
--

DROP TABLE IF EXISTS `aims_employees`;
CREATE TABLE IF NOT EXISTS `aims_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `passwd` varchar(50) NOT NULL,
  `avathar` varchar(100) DEFAULT NULL,
  `addeddate` datetime DEFAULT NULL,
  `role` varchar(5) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `aims_questions`
--

DROP TABLE IF EXISTS `aims_questions`;
CREATE TABLE IF NOT EXISTS `aims_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questioncode` varchar(15) NOT NULL,
  `questionname` varchar(100) DEFAULT NULL,
  `questiondesc` varchar(255) DEFAULT NULL,
  `questiontype` varchar(8) NOT NULL,
  `audiopath` varchar(255) NOT NULL,
  `audiofilename` varchar(100) NOT NULL,
  `answer` int(2) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `addeddate` datetime DEFAULT NULL,
  `includeinscoring` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `questioncode` (`questioncode`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=145 ;

-- --------------------------------------------------------

--
-- Table structure for table `aims_question_options`
--

DROP TABLE IF EXISTS `aims_question_options`;
CREATE TABLE IF NOT EXISTS `aims_question_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionid` int(11) NOT NULL,
  `option` varchar(255) NOT NULL,
  `option_path` varchar(255) NOT NULL,
  `addeddate` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionid` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aims_users`
--

DROP TABLE IF EXISTS `aims_users`;
CREATE TABLE IF NOT EXISTS `aims_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `age` varchar(6) DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `filenumber` varchar(30) NOT NULL,
  `addeddate` datetime NOT NULL,
  `completeddate` datetime NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `filenumber` (`filenumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

-- --------------------------------------------------------

--
-- Table structure for table `aims_user_answers`
--

DROP TABLE IF EXISTS `aims_user_answers`;
CREATE TABLE IF NOT EXISTS `aims_user_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `questionid` int(11) NOT NULL,
  `optionid` int(11) NOT NULL,
  `addeddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `questionid` (`questionid`),
  KEY `optionid` (`optionid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1779 ;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pitch_certile_scores`
--

DROP TABLE IF EXISTS `pitch_certile_scores`;
CREATE TABLE IF NOT EXISTS `pitch_certile_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `age` varchar(8) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `score` varchar(8) NOT NULL,
  `certile` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aims_answers`
--
ALTER TABLE `aims_answers`
  ADD CONSTRAINT `aims_answers_ibfk_1` FOREIGN KEY (`questionid`) REFERENCES `aims_questions` (`id`),
  ADD CONSTRAINT `aims_answers_ibfk_2` FOREIGN KEY (`optionid`) REFERENCES `aims_question_options` (`id`);

--
-- Constraints for table `aims_question_options`
--
ALTER TABLE `aims_question_options`
  ADD CONSTRAINT `aims_question_options_ibfk_1` FOREIGN KEY (`questionid`) REFERENCES `aims_questions` (`id`);

--
-- Constraints for table `aims_user_answers`
--
ALTER TABLE `aims_user_answers`
  ADD CONSTRAINT `aims_user_answers_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `aims_users` (`id`),
  ADD CONSTRAINT `aims_user_answers_ibfk_2` FOREIGN KEY (`questionid`) REFERENCES `aims_questions` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
