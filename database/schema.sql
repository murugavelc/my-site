-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 09, 2016 at 04:08 PM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.6.20-1+deb.sury.org~trusty+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ecco_nc_tta`
--

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

CREATE TABLE IF NOT EXISTS `agency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_updated` varchar(100) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `apt` varchar(50) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(7) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `fax` varchar(11) DEFAULT NULL,
  `manager_name` varchar(255) DEFAULT NULL,
  `alt_num` varchar(13) DEFAULT NULL,
  `region` varchar(225) NOT NULL,
  `SPG_SIG_priority` varchar(100) DEFAULT NULL,
  `SPG_SIG_priority_notes` varchar(255) DEFAULT NULL,
  `SPG_SIG_outcome` varchar(100) DEFAULT NULL,
  `SPG_SIG_outcome_notes` varchar(255) DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Agency Info' AUTO_INCREMENT=163 ;

-- --------------------------------------------------------

--
-- Table structure for table `agency_map`
--

CREATE TABLE IF NOT EXISTS `agency_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `special_admin` varchar(5) NOT NULL DEFAULT 'N',
  `agency_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=195 ;

-- --------------------------------------------------------

--
-- Table structure for table `briefcase_uploads`
--

CREATE TABLE IF NOT EXISTS `briefcase_uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_name` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by_user_id` int(11) DEFAULT NULL,
  `status` varchar(5) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE IF NOT EXISTS `chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `comments` text,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `sender_user_id` int(11) NOT NULL DEFAULT '0',
  `receiver_user_id` int(11) NOT NULL DEFAULT '0',
  `upload_file_path` text,
  `upload_file` text,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `deleted_at` date DEFAULT NULL,
  `created_time` time NOT NULL,
  `updated_time` time NOT NULL,
  `deleted_time` time DEFAULT NULL,
  `view_status` varchar(5) NOT NULL DEFAULT 'N',
  `online` varchar(5) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=475 ;

-- --------------------------------------------------------

--
-- Table structure for table `chat_active`
--

CREATE TABLE IF NOT EXISTS `chat_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `status` varchar(5) NOT NULL DEFAULT 'Y',
  `group_id` int(11) NOT NULL,
  `active_at` date NOT NULL,
  `active_time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=738 ;

-- --------------------------------------------------------

--
-- Table structure for table `community_comments`
--

CREATE TABLE IF NOT EXISTS `community_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discussion_id` int(11) NOT NULL DEFAULT '0',
  `comments` text NOT NULL,
  `view_status` enum('Y','N') NOT NULL DEFAULT 'N',
  `userid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT ' ',
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- Table structure for table `community_discussion`
--

CREATE TABLE IF NOT EXISTS `community_discussion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT ' ',
  `video` varchar(255) NOT NULL DEFAULT ' ',
  `file` varchar(255) NOT NULL DEFAULT ' ',
  `view_count` smallint(5) NOT NULL DEFAULT '0',
  `likes_count` smallint(5) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL,
  `createduser` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_name` text NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=255 ;

-- --------------------------------------------------------

--
-- Table structure for table `documents_old`
--

CREATE TABLE IF NOT EXISTS `documents_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_name` text NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=255 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_chats`
--

CREATE TABLE IF NOT EXISTS `group_chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `profile_picture` text NOT NULL,
  `member_user_id` int(11) NOT NULL DEFAULT '0',
  `created_user_id` int(11) NOT NULL DEFAULT '0',
  `status` varchar(5) NOT NULL DEFAULT 'Y',
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `deleted_at` date NOT NULL,
  `created_time` time NOT NULL,
  `updated_time` time NOT NULL,
  `deleted_time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_chat_views`
--

CREATE TABLE IF NOT EXISTS `group_chat_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_id` int(11) DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `sender_id` int(11) NOT NULL DEFAULT '0',
  `receiver_id` int(11) NOT NULL DEFAULT '0',
  `view_status` varchar(5) NOT NULL DEFAULT 'N',
  `created_at` date NOT NULL,
  `created_time` time NOT NULL,
  `updated_at` date NOT NULL,
  `updated_time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=189 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE IF NOT EXISTS `group_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `member_user_id` int(11) NOT NULL,
  `status` varchar(5) NOT NULL DEFAULT 'Y',
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `deleted_at` date NOT NULL,
  `created_time` time NOT NULL,
  `updated_time` time NOT NULL,
  `deleted_time` time NOT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

-- --------------------------------------------------------

--
-- Table structure for table `help`
--

CREATE TABLE IF NOT EXISTS `help` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `date_time` date DEFAULT NULL,
  `enq_time` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `agency` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `emailid` varchar(255) DEFAULT NULL,
  `cnt_no` varchar(255) DEFAULT NULL,
  `queries` text,
  `regarding` varchar(255) DEFAULT NULL,
  `active_key` varchar(255) DEFAULT NULL,
  `status` enum('Inactive','Active') NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contract_num` varchar(255) DEFAULT NULL,
  `uploadfoldername` text,
  `uploadfilename` text,
  `filepath` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1767 ;

-- --------------------------------------------------------

--
-- Table structure for table `login_confirm`
--

CREATE TABLE IF NOT EXISTS `login_confirm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Table structure for table `login_integration`
--

CREATE TABLE IF NOT EXISTS `login_integration` (
  `user_id` int(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `google` varchar(255) NOT NULL,
  `yahoo` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_levels`
--

CREATE TABLE IF NOT EXISTS `login_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(255) NOT NULL,
  `level_level` int(1) NOT NULL,
  `level_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `redirect` varchar(255) DEFAULT NULL,
  `welcome_email` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `level_level` (`level_level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `login_profiles`
--

CREATE TABLE IF NOT EXISTS `login_profiles` (
  `p_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pfield_id` int(255) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `profile_value` longtext,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2286 ;

-- --------------------------------------------------------

--
-- Table structure for table `login_profile_fields`
--

CREATE TABLE IF NOT EXISTS `login_profile_fields` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `section` varchar(255) NOT NULL,
  `type` varchar(25) NOT NULL,
  `label` varchar(255) NOT NULL,
  `public` tinyint(4) NOT NULL,
  `signup` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Table structure for table `login_settings`
--

CREATE TABLE IF NOT EXISTS `login_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(255) NOT NULL,
  `option_value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

-- --------------------------------------------------------

--
-- Table structure for table `login_timestamps`
--

CREATE TABLE IF NOT EXISTS `login_timestamps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=764 ;

-- --------------------------------------------------------

--
-- Table structure for table `login_users`
--

CREATE TABLE IF NOT EXISTS `login_users` (
  `user_id` int(8) NOT NULL AUTO_INCREMENT,
  `user_level` longtext NOT NULL,
  `restricted` int(1) NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AgencyName` varchar(500) NOT NULL,
  `StaffAssigned` varchar(250) DEFAULT NULL,
  `user_image` varchar(255) DEFAULT NULL,
  `email_notifications` enum('0','1') NOT NULL DEFAULT '1',
  `approved` enum('YES','NO') NOT NULL DEFAULT 'YES',
  `administrator_notes` text,
  `phone` varchar(255) DEFAULT NULL,
  `region` varchar(10) DEFAULT NULL,
  `online` varchar(5) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=145 ;

-- --------------------------------------------------------

--
-- Table structure for table `TTA_Forms`
--

CREATE TABLE IF NOT EXISTS `TTA_Forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) NOT NULL DEFAULT '0',
  `assignedUser` varchar(50) DEFAULT NULL,
  `contract_num` varchar(100) DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_date` varchar(255) NOT NULL,
  `user_updated` varchar(100) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `TTA_inquiry_type` varchar(255) DEFAULT NULL,
  `TTA_inquiry_notes` text,
  `SPF_steps_assessment` int(1) NOT NULL DEFAULT '0',
  `SPF_align_capacity` int(1) NOT NULL DEFAULT '0',
  `SPF_align_planning` int(1) NOT NULL DEFAULT '0',
  `SPF_align_implment` int(1) NOT NULL DEFAULT '0',
  `SPF_align_evaluation` int(1) NOT NULL DEFAULT '0',
  `SPF_align_competency` int(1) NOT NULL DEFAULT '0',
  `SPF_align_sustainability` int(1) NOT NULL DEFAULT '0',
  `SPF_align_notes` longtext,
  `SPF_steps_capacity` int(1) NOT NULL DEFAULT '0',
  `SPF_steps_planning` int(1) NOT NULL DEFAULT '0',
  `SPF_steps_implment` int(1) NOT NULL DEFAULT '0',
  `SPF_steps_evaluation` int(1) NOT NULL DEFAULT '0',
  `SPF_steps_notes` text,
  `SPF_align_assessment` int(1) NOT NULL DEFAULT '0',
  `TTA_problem_addressed` text,
  `TTA_problem_addressed_notes` text,
  `TTA_desc` text,
  `TTA_desc_notes` text,
  `TTA_outcome` text,
  `TTA_outcome_notes` text,
  `TTA_Referral` varchar(100) DEFAULT NULL,
  `TTA_Contact_Phone` varchar(20) DEFAULT NULL,
  `TTA_Email` varchar(255) DEFAULT NULL,
  `timeframe` varchar(100) DEFAULT NULL,
  `timeframe_w` varchar(255) DEFAULT NULL,
  `timeframe_notes` text,
  `assigned_staff` text,
  `prelim_result` text,
  `TTA_service_scheduled` datetime DEFAULT NULL,
  `supporting_docs` text,
  `TTA_service_provider` text,
  `results` text,
  `AgencyName` varchar(255) DEFAULT NULL,
  `ManagerName` varchar(255) DEFAULT NULL,
  `AgencyContactNumber` varchar(11) DEFAULT NULL,
  `AgencyAddress` varchar(500) DEFAULT NULL,
  `requestedUser` varchar(250) DEFAULT NULL,
  `resources` varchar(255) DEFAULT NULL,
  `regarding` varchar(255) DEFAULT NULL,
  `regarding_notes` text,
  `user_name` varchar(255) DEFAULT NULL,
  `delete_flag` enum('N','Y') NOT NULL DEFAULT 'N',
  `modality` varchar(255) DEFAULT NULL,
  `modality_other` varchar(100) DEFAULT NULL,
  `service_frame_start` date NOT NULL DEFAULT '0000-00-00',
  `service_frame_end` date NOT NULL DEFAULT '0000-00-00',
  `estimate_q1` tinyint(2) NOT NULL DEFAULT '0',
  `estimate_q2` tinyint(2) NOT NULL DEFAULT '0',
  `estimate_q3` tinyint(2) NOT NULL DEFAULT '0',
  `estimate_q4` tinyint(2) NOT NULL DEFAULT '0',
  `estimate_total` int(11) NOT NULL DEFAULT '0',
  `training_date` date NOT NULL DEFAULT '0000-00-00',
  `push_notification` varchar(100) DEFAULT NULL,
  `push_notify_email` varchar(100) DEFAULT NULL,
  `push_notify_comments` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contract_num` (`contract_num`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=976 ;

-- --------------------------------------------------------

--
-- Table structure for table `tta_progress_notes`
--

CREATE TABLE IF NOT EXISTS `tta_progress_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `contract_num` varchar(100) NOT NULL,
  `comments` text NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `tta_regarding_notes`
--

CREATE TABLE IF NOT EXISTS `tta_regarding_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `contract_num` varchar(100) NOT NULL,
  `comments` text NOT NULL,
  `view_status` enum('Y','N') NOT NULL DEFAULT 'N',
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=168 ;

-- --------------------------------------------------------

--
-- Table structure for table `tta_regarding_status`
--

CREATE TABLE IF NOT EXISTS `tta_regarding_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_count` int(11) NOT NULL,
  `contract_num` varchar(100) NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=187 ;

-- --------------------------------------------------------

--
-- Table structure for table `tta_reports_comments_status`
--

CREATE TABLE IF NOT EXISTS `tta_reports_comments_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_count` int(11) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

-- --------------------------------------------------------

--
-- Table structure for table `TTA_Reports_imports`
--

CREATE TABLE IF NOT EXISTS `TTA_Reports_imports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) NOT NULL,
  `location` varchar(500) DEFAULT NULL,
  `responsible` varchar(500) DEFAULT NULL,
  `projected_start_date` date NOT NULL DEFAULT '0000-00-00',
  `projected_end_date` date NOT NULL DEFAULT '0000-00-00',
  `actual_start_date` date NOT NULL DEFAULT '0000-00-00',
  `actual_end_date` date NOT NULL DEFAULT '0000-00-00',
  `comment` longtext,
  `status_code` varchar(250) DEFAULT NULL,
  `control_flag` enum('1','0','N') NOT NULL DEFAULT 'N',
  `sheet_name` varchar(255) DEFAULT NULL,
  `report_id` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uploaduser` varchar(255) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32493 ;

-- --------------------------------------------------------

--
-- Table structure for table `TTA_Reports_imports_strategy`
--

CREATE TABLE IF NOT EXISTS `TTA_Reports_imports_strategy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `strategy_name` longtext NOT NULL,
  `variables_factors` longtext NOT NULL,
  `strategy_intent` longtext NOT NULL,
  `target_audience` longtext NOT NULL,
  `iom_category` varchar(255) NOT NULL,
  `estimated_reach` longtext NOT NULL,
  `strategy_dosage` longtext NOT NULL,
  `strategy_frequent` longtext NOT NULL,
  `resources` longtext NOT NULL,
  `sheet_name` varchar(255) NOT NULL,
  `report_id` int(11) NOT NULL,
  `uploaduser` varchar(255) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=637 ;

-- --------------------------------------------------------

--
-- Table structure for table `TTA_Reports_uploads`
--

CREATE TABLE IF NOT EXISTS `TTA_Reports_uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency` int(11) DEFAULT '0',
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `emailid` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `report_note` text,
  `uploadfoldername` text,
  `uploadfilename` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uploaduser` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=458 ;

-- --------------------------------------------------------

--
-- Table structure for table `TTA_Report_comment`
--

CREATE TABLE IF NOT EXISTS `TTA_Report_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `status` enum('N','Y') NOT NULL DEFAULT 'N',
  `normal_status` enum('N','Y') NOT NULL DEFAULT 'N',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=315 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
