-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: testrail
-- ------------------------------------------------------
-- Server version	5.7.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` int(11) DEFAULT NULL,
  `end_date` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `view` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `created_on` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `case_id` int(11) DEFAULT NULL,
  `test_change_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_attachments_case_id` (`case_id`),
  KEY `ix_attachments_test_change_id` (`test_change_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_id` bigint(20) NOT NULL,
  `entity_type` tinyint(4) NOT NULL,
  `action_type` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `mode` tinyint(4) DEFAULT NULL,
  `entity_name` varchar(256) DEFAULT NULL,
  `project_name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_log_entity_type_action_type_mode_index` (`entity_type`,`action_type`,`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log`
--

LOCK TABLES `audit_log` WRITE;
/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_log_exports`
--

DROP TABLE IF EXISTS `audit_log_exports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_log_exports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `filename` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `size` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log_exports`
--

LOCK TABLES `audit_log_exports` WRITE;
/*!40000 ALTER TABLE `audit_log_exports` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_log_exports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_assocs`
--

DROP TABLE IF EXISTS `case_assocs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_assocs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_case_assocs_case_id` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_assocs`
--

LOCK TABLES `case_assocs` WRITE;
/*!40000 ALTER TABLE `case_assocs` DISABLE KEYS */;
/*!40000 ALTER TABLE `case_assocs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_changes`
--

DROP TABLE IF EXISTS `case_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `created_on` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `changes` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `ix_case_changes_case_id` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_changes`
--

LOCK TABLES `case_changes` WRITE;
/*!40000 ALTER TABLE `case_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `case_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_types`
--

DROP TABLE IF EXISTS `case_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_types`
--

LOCK TABLES `case_types` WRITE;
/*!40000 ALTER TABLE `case_types` DISABLE KEYS */;
INSERT INTO `case_types` VALUES (1,'Acceptance',0,0),(2,'Accessibility',0,0),(3,'Automated',0,0),(4,'Compatibility',0,0),(5,'Destructive',0,0),(6,'Functional',0,0),(7,'Other',1,0),(8,'Performance',0,0),(9,'Regression',0,0),(10,'Security',0,0),(11,'Smoke & Sanity',0,0),(12,'Usability',0,0);
/*!40000 ALTER TABLE `case_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `display_order` int(11) NOT NULL,
  `priority_id` int(11) NOT NULL,
  `estimate` int(11) DEFAULT NULL,
  `milestone_id` int(11) DEFAULT NULL,
  `custom_preconds` longtext COLLATE utf8_unicode_ci,
  `custom_steps` longtext COLLATE utf8_unicode_ci,
  `custom_expected` longtext COLLATE utf8_unicode_ci,
  `custom_steps_separated` longtext COLLATE utf8_unicode_ci,
  `custom_mission` longtext COLLATE utf8_unicode_ci,
  `custom_goals` longtext COLLATE utf8_unicode_ci,
  `custom_automation_type` int(11) DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `is_copy` tinyint(1) NOT NULL,
  `copyof_id` int(11) DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `estimate_forecast` int(11) DEFAULT NULL,
  `refs` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suite_id` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_cases_section_id` (`section_id`),
  KEY `ix_cases_suite_id` (`suite_id`),
  KEY `ix_cases_copyof_id` (`copyof_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_groups`
--

DROP TABLE IF EXISTS `config_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_config_groups_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_groups`
--

LOCK TABLES `config_groups` WRITE;
/*!40000 ALTER TABLE `config_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_configs_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs`
--

LOCK TABLES `configs` WRITE;
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defects`
--

DROP TABLE IF EXISTS `defects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `defect_id` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `test_change_id` int(11) NOT NULL,
  `case_id` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_defects_defect_id` (`defect_id`),
  KEY `ix_defects_test_change_id` (`test_change_id`),
  KEY `ix_defects_case_id` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defects`
--

LOCK TABLES `defects` WRITE;
/*!40000 ALTER TABLE `defects` DISABLE KEYS */;
/*!40000 ALTER TABLE `defects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exports`
--

DROP TABLE IF EXISTS `exports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `size` bigint(20) NOT NULL,
  `created_on` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_exports_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exports`
--

LOCK TABLES `exports` WRITE;
/*!40000 ALTER TABLE `exports` DISABLE KEYS */;
/*!40000 ALTER TABLE `exports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_templates`
--

DROP TABLE IF EXISTS `field_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_templates` (
  `field_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  PRIMARY KEY (`field_id`,`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_templates`
--

LOCK TABLES `field_templates` WRITE;
/*!40000 ALTER TABLE `field_templates` DISABLE KEYS */;
INSERT INTO `field_templates` VALUES (1,1),(1,2),(2,1),(3,1),(10,2),(11,2),(12,3),(13,3);
/*!40000 ALTER TABLE `field_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `system_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` int(11) NOT NULL,
  `label` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `type_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  `configs` longtext COLLATE utf8_unicode_ci NOT NULL,
  `is_multi` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `status_id` int(11) NOT NULL,
  `is_system` tinyint(1) NOT NULL,
  `include_all` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_fields_name` (`entity_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,'preconds','custom_preconds',1,'Preconditions','The preconditions of this test case. Reference other test cases with [C#] (e.g. [C17]).',3,2,1,'[{\"context\":{\"is_global\":true,\"project_ids\":null},\"options\":{\"is_required\":false,\"default_value\":\"\",\"format\":\"markdown\",\"rows\":\"7\"},\"id\":\"4be1344d55d11\"}]',0,1,1,0,0),(2,'steps','custom_steps',1,'Steps','The required steps to execute the test case.',3,2,2,'[{\"context\":{\"is_global\":true,\"project_ids\":null},\"options\":{\"is_required\":false,\"default_value\":\"\",\"format\":\"markdown\",\"rows\":\"7\"},\"id\":\"4be97c65ea2fd\"}]',0,1,1,0,0),(3,'expected','custom_expected',1,'Expected Result','The expected result after executing the test case.',3,2,3,'[{\"context\":{\"is_global\":true,\"project_ids\":null},\"options\":{\"is_required\":false,\"default_value\":\"\",\"format\":\"markdown\",\"rows\":\"7\"},\"id\":\"4be1345cafd07\"}]',0,1,1,0,0),(4,'dc330d77','estimate',1,'Estimate',NULL,1,1,1,'[{\"context\":{\"is_global\":true,\"project_ids\":null},\"options\":{\"is_required\":false},\"id\":\"4be97c65ea2fd\"}]',0,1,1,1,1),(5,'ddfe71c8','milestone_id',1,'Milestone',NULL,9,1,2,'[{\"context\":{\"is_global\":true,\"project_ids\":null},\"options\":{\"is_required\":false},\"id\":\"4be97c65ea2fd\"}]',0,0,1,1,1),(6,'c4bd4336','refs',1,'References',NULL,1,1,3,'[{\"context\":{\"is_global\":true,\"project_ids\":null},\"options\":{\"is_required\":false},\"id\":\"4be97c65ea2fd\"}]',0,1,1,1,1),(7,'d4d1e651','version',2,'Version',NULL,1,4,2,'[{\"context\":{\"is_global\":true,\"project_ids\":null},\"options\":{\"is_required\":false},\"id\":\"4be97c65ea2fd\"}]',0,1,1,1,1),(8,'e7c13ac2','elapsed',2,'Elapsed',NULL,1,4,3,'[{\"context\":{\"is_global\":true,\"project_ids\":null},\"options\":{\"is_required\":false},\"id\":\"4be97c65ea2fd\"}]',0,1,1,1,1),(9,'a6637b4f','defects',2,'Defects',NULL,1,4,4,'[{\"context\":{\"is_global\":true,\"project_ids\":null},\"options\":{\"is_required\":false},\"id\":\"4be97c65ea2fd\"}]',0,1,1,1,1),(10,'steps_separated','custom_steps_separated',1,'Steps',NULL,10,2,4,'[{\"context\":{\"is_global\":true,\"project_ids\":null},\"options\":{\"is_required\":false,\"format\":\"markdown\",\"has_expected\":true,\"rows\":\"5\"},\"id\":\"4be97c65ea2fd\"}]',0,1,1,0,0),(11,'step_results','custom_step_results',2,'Steps',NULL,11,3,1,'[{\"context\":{\"is_global\":true,\"project_ids\":null},\"options\":{\"is_required\":false,\"format\":\"markdown\",\"has_expected\":true,\"has_actual\":true,\"rows\":\"5\"},\"id\":\"4be97c65ea2fd\"}]',0,1,1,0,0),(12,'mission','custom_mission',1,'Mission','A high-level overview of what to test and which areas to cover, usually just 1-2 sentences.',3,2,5,'[{\"context\":{\"is_global\":true,\"project_ids\":null},\"options\":{\"is_required\":false,\"default_value\":\"\",\"format\":\"markdown\",\"rows\":\"7\"},\"id\":\"4be1345cafd07\"}]',0,1,1,0,0),(13,'goals','custom_goals',1,'Goals','A detailed list of goals to cover as part of the exploratory sessions.',3,2,6,'[{\"context\":{\"is_global\":true,\"project_ids\":null},\"options\":{\"is_required\":false,\"default_value\":\"\",\"format\":\"markdown\",\"rows\":\"7\"},\"id\":\"4be1345cafd07\"}]',0,1,1,0,0),(14,'automation_type','custom_automation_type',1,'Automation Type',NULL,6,1,5,'[{\"context\":{\"is_global\":true,\"project_ids\":[]},\"options\":{\"is_required\":false,\"default_value\":\"0\",\"items\":\"0, None\\n1, Ranorex\"},\"id\":\"7a34a519-f458-40bb-af43-ed63baf874ee\"}]',0,1,1,0,1);
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_users`
--

DROP TABLE IF EXISTS `group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_users` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`user_id`),
  KEY `ix_group_users_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_users`
--

LOCK TABLES `group_users` WRITE;
/*!40000 ALTER TABLE `group_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `created_on` int(11) NOT NULL,
  `is_locked` tinyint(1) NOT NULL,
  `heartbeat` int(11) NOT NULL,
  `is_done` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_jobs_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'audit',1579744382,0,1579828458,0),(2,'audit_gc',1579744382,0,1579828458,0),(3,'check_for_update',1579744382,0,1579744384,0),(4,'defect_gc',1579744384,0,1579744384,0),(5,'delete_expired_audit_logs',1579744384,0,1579828458,0),(6,'fields',1579744384,0,1579828458,0),(7,'forecasts',1579744384,0,1579819497,0),(8,'migration_160',1579744384,0,1579744384,1),(9,'migration_161',1579744384,0,1579744384,1),(10,'notifications',1579744384,0,1579828458,0),(11,'progress',1579744384,0,1579826763,0),(12,'reference_gc',1579744384,0,1579744384,0),(13,'report_jobs',1579744384,0,1579828458,0),(14,'reports',1579744384,0,0,0),(15,'session_gc',1579744384,0,1579826701,0),(16,'token_gc',1579744384,0,1579826701,0);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_recps`
--

DROP TABLE IF EXISTS `message_recps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_recps` (
  `user_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  PRIMARY KEY (`message_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_recps`
--

LOCK TABLES `message_recps` WRITE;
/*!40000 ALTER TABLE `message_recps` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_recps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_on` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `due_on` int(11) DEFAULT NULL,
  `completed_on` int(11) DEFAULT NULL,
  `is_completed` tinyint(1) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `start_on` int(11) DEFAULT NULL,
  `started_on` int(11) DEFAULT NULL,
  `is_started` tinyint(1) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_milestones_project_id` (`project_id`),
  KEY `ix_milestones_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones`
--

LOCK TABLES `milestones` WRITE;
/*!40000 ALTER TABLE `milestones` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_preferences_name` (`user_id`,`name`),
  KEY `ix_preferences_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priorities`
--

DROP TABLE IF EXISTS `priorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priorities`
--

LOCK TABLES `priorities` WRITE;
/*!40000 ALTER TABLE `priorities` DISABLE KEYS */;
INSERT INTO `priorities` VALUES (1,1,'Low','Low',0,0),(2,2,'Medium','Medium',1,0),(3,3,'High','High',0,0),(4,4,'Critical','Critical',0,0);
/*!40000 ALTER TABLE `priorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_access`
--

DROP TABLE IF EXISTS `project_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_access` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `access` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_access`
--

LOCK TABLES `project_access` WRITE;
/*!40000 ALTER TABLE `project_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_favs`
--

DROP TABLE IF EXISTS `project_favs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_favs` (
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_on` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_favs`
--

LOCK TABLES `project_favs` WRITE;
/*!40000 ALTER TABLE `project_favs` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_favs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_groups`
--

DROP TABLE IF EXISTS `project_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_groups` (
  `project_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `access` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_groups`
--

LOCK TABLES `project_groups` WRITE;
/*!40000 ALTER TABLE `project_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_history`
--

DROP TABLE IF EXISTS `project_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `action` int(11) NOT NULL,
  `created_on` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `suite_id` int(11) DEFAULT NULL,
  `milestone_id` int(11) DEFAULT NULL,
  `run_id` int(11) DEFAULT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `plan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_project_history_project_order` (`project_id`,`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_history`
--

LOCK TABLES `project_history` WRITE;
/*!40000 ALTER TABLE `project_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `announcement` longtext COLLATE utf8_unicode_ci,
  `show_announcement` tinyint(1) NOT NULL,
  `defect_id_url` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defect_add_url` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_access` int(11) NOT NULL,
  `default_role_id` int(11) DEFAULT NULL,
  `reference_id_url` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference_add_url` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defect_plugin` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defect_config` longtext COLLATE utf8_unicode_ci,
  `is_completed` tinyint(1) NOT NULL,
  `completed_on` int(11) DEFAULT NULL,
  `defect_template` longtext COLLATE utf8_unicode_ci,
  `suite_mode` int(11) NOT NULL,
  `master_id` int(11) DEFAULT NULL,
  `reference_plugin` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference_config` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refs`
--

DROP TABLE IF EXISTS `refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_id` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `case_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_refs_reference_id` (`reference_id`),
  KEY `ix_refs_case_id` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refs`
--

LOCK TABLES `refs` WRITE;
/*!40000 ALTER TABLE `refs` DISABLE KEYS */;
/*!40000 ALTER TABLE `refs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_api_templates`
--

DROP TABLE IF EXISTS `report_api_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_api_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `access` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` int(11) NOT NULL,
  `system_options` longtext COLLATE utf8_unicode_ci,
  `custom_options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `ix_report_jobs_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_api_templates`
--

LOCK TABLES `report_api_templates` WRITE;
/*!40000 ALTER TABLE `report_api_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_api_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_jobs`
--

DROP TABLE IF EXISTS `report_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` int(11) NOT NULL,
  `executed_on` int(11) DEFAULT NULL,
  `system_options` longtext COLLATE utf8_unicode_ci,
  `custom_options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `ix_report_jobs_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_jobs`
--

LOCK TABLES `report_jobs` WRITE;
/*!40000 ALTER TABLE `report_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `access` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` int(11) NOT NULL,
  `executed_on` int(11) DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  `dir` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `formats` longtext COLLATE utf8_unicode_ci NOT NULL,
  `system_options` longtext COLLATE utf8_unicode_ci,
  `custom_options` longtext COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL,
  `status_message` longtext COLLATE utf8_unicode_ci,
  `status_trace` longtext COLLATE utf8_unicode_ci,
  `is_locked` tinyint(1) NOT NULL,
  `heartbeat` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_reports_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` int(11) NOT NULL,
  `is_default` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Lead',262143,1,18),(2,'Designer',258636,0,10),(3,'Tester',258624,0,8),(4,'Read-only',0,0,0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `runs`
--

DROP TABLE IF EXISTS `runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `runs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suite_id` int(11) DEFAULT NULL,
  `milestone_id` int(11) DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `is_completed` tinyint(1) NOT NULL,
  `completed_on` int(11) DEFAULT NULL,
  `include_all` tinyint(1) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `passed_count` int(11) NOT NULL DEFAULT '0',
  `retest_count` int(11) NOT NULL DEFAULT '0',
  `failed_count` int(11) NOT NULL DEFAULT '0',
  `untested_count` int(11) NOT NULL DEFAULT '0',
  `assignedto_id` int(11) DEFAULT NULL,
  `is_plan` tinyint(1) NOT NULL DEFAULT '0',
  `plan_id` int(11) DEFAULT NULL,
  `entry_id` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entries` longtext COLLATE utf8_unicode_ci,
  `config` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config_ids` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_index` int(11) DEFAULT NULL,
  `blocked_count` int(11) NOT NULL DEFAULT '0',
  `is_editable` tinyint(1) NOT NULL,
  `content_id` int(11) DEFAULT NULL,
  `custom_status1_count` int(11) NOT NULL DEFAULT '0',
  `custom_status2_count` int(11) NOT NULL DEFAULT '0',
  `custom_status3_count` int(11) NOT NULL DEFAULT '0',
  `custom_status4_count` int(11) NOT NULL DEFAULT '0',
  `custom_status5_count` int(11) NOT NULL DEFAULT '0',
  `custom_status6_count` int(11) NOT NULL DEFAULT '0',
  `custom_status7_count` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL,
  `refs` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_runs_project_id` (`project_id`),
  KEY `ix_runs_plan_id` (`plan_id`),
  KEY `ix_runs_milestone_id` (`milestone_id`),
  KEY `ix_runs_suite_id` (`suite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `runs`
--

LOCK TABLES `runs` WRITE;
/*!40000 ALTER TABLE `runs` DISABLE KEYS */;
/*!40000 ALTER TABLE `runs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `runs_refs`
--

DROP TABLE IF EXISTS `runs_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `runs_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_id` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `run_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `runs_refs`
--

LOCK TABLES `runs_refs` WRITE;
/*!40000 ALTER TABLE `runs_refs` DISABLE KEYS */;
/*!40000 ALTER TABLE `runs_refs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suite_id` int(11) DEFAULT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `display_order` int(11) NOT NULL,
  `is_copy` tinyint(1) NOT NULL,
  `copyof_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `ix_sections_suite_id` (`suite_id`),
  KEY `ix_sections_copyof_id` (`copyof_id`),
  KEY `ix_sections_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) NOT NULL,
  `user_data` longtext COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_sessions_session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('e08e4138-d700-4bc9-8963-e413ddfa2dd0','','',1579744381,NULL,2),('4ee870b2-6da8-4b85-9ee8-d2f5228f381b','','',1579744444,NULL,3),('ea348cc7-b7f1-4a12-9706-6d6b4fbebc78','','',1579744506,NULL,4),('d4d31915-dee1-4c9d-a9e3-5bf5fe1ba41b','','',1579744567,NULL,5),('90e00d95-ea67-410c-8dc7-0bb93f08e440','','',1579749144,NULL,6),('e0b831a6-5f39-468f-b362-d8933b27b040','','',1579749199,'{\"user_id\":1,\"last_login\":1579749183,\"rememberme\":true,\"csrf\":\"2fRd4oqBgb1FBbR6kmzH\"}',7),('85f76fa2-a0b9-4e74-a7a3-8722fa2f46a0','','',1579749205,NULL,8),('752abc04-1998-407a-b2df-4893ec98f59b','','',1579749218,NULL,9),('59b541a8-edac-4034-9c4b-0ddb48bf410d','','',1579749218,NULL,10),('23aa3e29-6993-4dd6-b2aa-850a7926a537','','',1579749266,NULL,11),('0e50f3e9-ed47-40dd-b42d-b0b228848cea','','',1579749327,NULL,12),('b31ccae8-dd2e-4574-8967-cee961984ea6','','',1579749387,NULL,13),('9cb3596f-aa49-42b2-9118-fd482e018703','','',1579749448,NULL,14),('99c2d75b-d625-4d13-8e6b-fd6a049a2c43','','',1579749509,NULL,15),('ce84e6b5-f495-40c2-8ae4-2aa14d88c0ae','','',1579749569,NULL,16),('65e78430-fc78-46b0-b898-23d9c7431963','','',1579749630,NULL,17),('fd5d3fda-187b-4016-b605-de6a7f9d040a','','',1579749690,NULL,18),('158f10ad-e380-4216-a78b-9b8795f2489e','','',1579749751,NULL,19),('639083a6-0989-4f6a-84bf-e197dec0e519','','',1579749811,NULL,20),('29807fab-383f-4fe4-9cf0-0f9fc953bcae','','',1579749872,NULL,21),('cb013576-48fb-4b92-99b9-81eb30d4c460','','',1579750001,NULL,22),('778b9348-7ef7-4375-a1ab-2aaf93d54671','','',1579750062,NULL,23),('b1c7014c-591f-474b-84cf-0784f94a44c4','','',1579750122,NULL,24),('e3e8c8dd-abfe-43de-993e-2109cb19a856','','',1579750183,NULL,25),('dc43b9f7-10c4-4c8c-9235-23c4c010fe7e','','',1579750243,NULL,26),('4e101bb2-b7ef-4c66-8beb-0e93c4216de4','','',1579750304,NULL,27),('ae016b0d-02fa-4d9b-8148-c2351b22b033','','',1579750364,NULL,28),('61a214e7-2455-4dba-b93b-c8c5dc6b1fe8','','',1579750425,NULL,29),('1ba4a994-86c3-4855-a504-9cf36fd43bda','','',1579750485,NULL,30),('a542310b-10d2-4e81-9d55-2683e53d7b73','','',1579750545,NULL,31),('6fc6216c-ea19-4b07-afb9-fb9f3a54e0c6','','',1579750606,NULL,32),('7ffdb2ee-36a8-4a87-ada9-f5decc752bbe','','',1579750666,NULL,33),('7302ba87-84ce-4b71-b4ac-89b79989e745','','',1579750727,NULL,34),('d12b8f80-8665-4d5a-bad0-1b52c9b9bec5','','',1579750787,NULL,35),('66673054-48fc-4b05-913d-3ea38e7541f0','','',1579750848,NULL,36),('ce08d41f-793e-4f30-948a-300ea52f514e','','',1579750908,NULL,37),('95c5e025-0b8d-4db1-b7ab-534d1f1430cc','','',1579750969,NULL,38),('378abd0c-206e-4b97-b390-ddf12af558e0','','',1579751029,NULL,39),('22cf3da9-2715-447c-bc8d-850f45845b44','','',1579751090,NULL,40),('4850d9f8-eeb9-41e2-af61-6d27ba0a5b83','','',1579751150,NULL,41),('86df2994-be27-4d41-8071-ed37011161e0','','',1579751211,NULL,42),('fc16af0a-ebc7-4f5f-a31c-b4c9c204544b','','',1579751271,NULL,43),('698dbd1d-a52b-4e96-9252-487ba23b36c4','','',1579751331,NULL,44),('f63acb3f-b3a8-4127-9bd7-ee326d505dd9','','',1579751392,NULL,45),('0f267542-084a-4f38-9abf-3e00d52f9c4d','','',1579751453,NULL,46),('a3871ede-65ba-4b37-8d57-781673555e8e','','',1579751513,NULL,47),('2d95af93-3013-442c-b130-8354d52cedaf','','',1579751574,NULL,48),('de8441ad-01ca-4881-a6ed-604719208d5b','','',1579751634,NULL,49),('8bc65750-8cc2-442f-9881-731560b77aca','','',1579751695,NULL,50),('f3ee1c50-92ea-4739-acdf-8d370990202a','','',1579751755,NULL,51),('b8143865-260d-4da0-8920-179d911e0773','','',1579751816,NULL,52),('345d5498-ba9f-431f-ba79-9e46126d8805','','',1579751876,NULL,53),('4416d61c-20b4-4cfb-a228-c1e487a37f84','','',1579751937,NULL,54),('de333cc2-5c8e-4e45-a3cb-779cf81ea35e','','',1579751997,NULL,55),('9d4e2c04-204f-4831-bd36-ca5229169dc7','','',1579752058,NULL,56),('3577a891-1937-4c24-a02c-209c12275385','','',1579752118,NULL,57),('9e8fa5a1-6df1-4b1e-9625-feb5466da2e6','','',1579752179,NULL,58),('2a2ec5b8-7fce-4844-b564-fe22db0dbf73','','',1579752239,NULL,59),('c157da2d-4c32-447f-abe5-e69f7d89effe','','',1579752300,NULL,60),('0f51526a-d1d3-4a99-b27b-8ebf31874b98','','',1579752360,NULL,61),('a179ac7f-4808-47c9-9bfd-9cebe0628426','','',1579752421,NULL,62),('7d1e95de-2d01-47f3-9902-3bf0f119aa0c','','',1579752481,NULL,63),('7712ed2d-5b5e-4039-9e6f-70d21f865835','','',1579752542,NULL,64),('7e653b9f-575a-49d3-ad07-34cf6efd9504','','',1579752602,NULL,65),('a4854564-a315-49be-96d0-7bff95d350de','','',1579752663,NULL,66),('c65a1968-a289-413b-850a-3a26c9ec39a6','','',1579752723,NULL,67),('96710b02-499b-4e05-a316-64edfe90939e','','',1579752784,NULL,68),('49dd0b86-6496-4e95-9e72-64d736f2547c','','',1579752844,NULL,69),('3f4a6514-548e-47ff-aedc-b9dcdc8adf3b','','',1579752905,NULL,70),('007015c7-a618-4343-aa5d-ca2229ce2075','','',1579752965,NULL,71),('1d021733-c63a-4ce3-9912-d04c9f979fba','','',1579753026,NULL,72),('4b8aa213-30c4-49db-a382-306432a4bc65','','',1579753086,NULL,73),('1a8bd7c9-7844-472f-8865-d3f0e77d12dd','','',1579753147,NULL,74),('cc2d1858-69f2-49ca-87eb-5f7bb80987f2','','',1579753207,NULL,75),('1f2e0969-c2cd-43b7-9e67-ab0380f97e13','','',1579753267,NULL,76),('70760ef3-664b-4f50-8341-46141807a001','','',1579753328,NULL,77),('ff7495c9-7e5a-44f1-913f-d6ae742904fc','','',1579753389,NULL,78),('15790801-0299-4dd7-bfdb-5f8a7ad2c116','','',1579753449,NULL,79),('9e382510-33fb-4e74-8d4a-046269d4c786','','',1579753509,NULL,80),('48bc9746-876d-4f71-9430-50cc23c129c6','','',1579753570,NULL,81),('7b9ce2b4-9213-4dbe-9e6c-6f9598879abf','','',1579753630,NULL,82),('aacf16cf-2217-4240-ad8d-ec1c25b7e4f6','','',1579753691,NULL,83),('4fffc272-58e8-494b-9eee-78203af3a8b7','','',1579753751,NULL,84),('b72436a4-deac-4727-8bc2-63af010e9136','','',1579753812,NULL,85),('856eb65f-fb03-4c7c-93d1-bd8bdfb11f27','','',1579753872,NULL,86),('c0d0441b-d59a-47a2-80bb-1225c1ed507b','','',1579753933,NULL,87),('4f4f6f8a-286d-4fcd-888c-38ccefcd7021','','',1579753993,NULL,88),('6f6943c0-4287-4d48-8965-51bc71e972e8','','',1579754054,NULL,89),('b13c62df-650e-4dd3-b709-06adc02521af','','',1579754114,NULL,90),('fafbaa50-7740-4e04-b6ec-8924dd143a4c','','',1579754175,NULL,91),('42736482-1a2c-49c6-b6f8-10ad52c5b914','','',1579754235,NULL,92),('9a14f285-67f4-417a-8382-a9fb6b3e76f8','','',1579754295,NULL,93),('404d12b9-1c3d-40c1-b191-d0e8155ce54e','','',1579754356,NULL,94),('b41aa5bb-965b-41f4-8474-0354aa8e763b','','',1579754416,NULL,95),('e54a4493-467b-4785-8807-9ce8e89eb3d6','','',1579754477,NULL,96),('b0f55ccd-31cf-40ef-a01a-6f5c031bbd4e','','',1579754537,NULL,97),('450248c1-ad4b-4d00-a8a0-cfbc9c501a0b','','',1579754598,NULL,98),('a1297b71-35c0-4bd8-bfe4-03f6768b23c0','','',1579754658,NULL,99),('ea516fa6-60e3-40e1-ad04-25af45b1c8ed','','',1579754719,NULL,100),('0666ed95-6d9b-4f69-beca-c96a18f216c9','','',1579754779,NULL,101),('3237f34f-f31d-43d7-a661-e5929598ac54','','',1579754840,NULL,102),('b0d0e0b4-36e8-4cfe-951b-373a0ecfe7ba','','',1579754900,NULL,103),('7bdb0876-da35-4820-95a5-9f8273d1253c','','',1579754961,NULL,104),('5e4669bc-ca42-41f4-b1fe-3ad736376549','','',1579755021,NULL,105),('8944f6f4-cd7c-42cf-ad6c-8ae0f232e658','','',1579755082,NULL,106),('9c8bb68a-5d4c-402a-8b91-d9aa229193f7','','',1579755142,NULL,107),('93bca4e0-47c7-4240-aaef-b500b4696c5f','','',1579755203,NULL,108),('a29d5ce3-1ba2-450c-a632-51e184753ad3','','',1579755263,NULL,109),('0bc9535d-bdc3-474d-b083-10b4810d17e2','','',1579755324,NULL,110),('97212f80-1fb9-47f1-b4b8-2af2bddcc727','','',1579755384,NULL,111),('11c8bc53-ea52-471e-88a6-88b8799e9194','','',1579755445,NULL,112),('29007a92-3798-4e80-946e-ac03f8de0d29','','',1579755505,NULL,113),('cb8cc122-c34b-4084-b616-3ef7aca12816','','',1579755566,NULL,114),('4e7ad7a2-3b69-458b-9c87-026f4766fd81','','',1579755626,NULL,115),('d0a48846-b4f8-4706-a497-f8d1e6e0d407','','',1579755687,NULL,116),('7f6c787e-22be-4486-8cdb-7bddcea1f3fb','','',1579755747,NULL,117),('7e8c7d59-b979-4414-84f2-6c0c374b6a28','','',1579755807,NULL,118),('cf93aa4b-da7c-4b40-845b-7b1f91a67bc5','','',1579755868,NULL,119),('08b6e758-1f93-42dc-9c15-1d20ebb6c478','','',1579755928,NULL,120),('19490d4c-6e4c-4952-859d-0fdef30d967b','','',1579755989,NULL,121),('98c1d2e8-c991-4bfd-bc74-6fd7966f6081','','',1579756049,NULL,122),('ce2fb4ec-0d81-41c4-bd20-9ca5de57bb12','','',1579756109,NULL,123),('c716a366-dea5-424e-a612-82132d609ed7','','',1579756170,NULL,124),('078e3b99-786d-49cd-8e4f-05b58e835089','','',1579756230,NULL,125),('1fedb448-bdda-48aa-ba07-2805de06b50e','','',1579756291,NULL,126),('280cd150-6cc7-4659-bf4d-8c6153e7b985','','',1579756351,NULL,127),('64289b21-f4ca-47f7-a4bd-41eec0c6bf76','','',1579756412,NULL,128),('f87d32d4-b8fa-4e7d-a588-863296b282d7','','',1579756472,NULL,129),('25682c00-2852-401f-a251-4ed5739baa7e','','',1579756533,NULL,130),('e619f3af-4d4c-495a-ade2-5d1c655aafe8','','',1579756593,NULL,131),('f7b36e90-b0a6-4cc3-85a7-4a369c0afa5a','','',1579756654,NULL,132),('ecd569e3-0c48-4d62-a2e8-4f08bbd6731a','','',1579756714,NULL,133),('8f2490ba-f7d2-4693-80dc-eaee151a2027','','',1579756775,NULL,134),('8442aa3f-efa0-406f-9a6f-944077a1b901','','',1579756835,NULL,135),('272634c7-3e6b-4fc3-807f-0e3c722ddd55','','',1579756896,NULL,136),('b5f4bb70-6a6f-48d8-9679-fbc90470681e','','',1579756956,NULL,137),('174595ce-09f3-41cb-a689-4d7e1a9f36b5','','',1579757017,NULL,138),('9ceab79c-42f5-4143-bd06-2f349af12e74','','',1579757077,NULL,139),('5768b01d-25c5-4e1c-9657-ac349e545c8d','','',1579757137,NULL,140),('68fad50b-db42-4424-8377-c9a1346f3859','','',1579757198,NULL,141),('197981a3-04e8-43a6-ace1-4e7681c6014d','','',1579757258,NULL,142),('0afc6761-c2a3-4292-b0f4-179d383a4725','','',1579757319,NULL,143),('191e0883-240b-451e-b00e-7a4124a56b01','','',1579757379,NULL,144),('9df3b19c-6d65-45e4-bd18-bccd8fb05cb4','','',1579757440,NULL,145),('58e4b424-ac39-4ed9-81e0-48201afe4ede','','',1579757500,NULL,146),('b47a8027-fead-442d-854c-613a8e5a359d','','',1579757561,NULL,147),('a5c7d973-80d2-4aef-ac4f-7eba63ce0a0b','','',1579757621,NULL,148),('0bd92435-9008-4798-8c3c-fb27aa7ed7f8','','',1579757682,NULL,149),('0c8a30d4-8f92-4d4b-b5ee-30a11b29166b','','',1579757742,NULL,150),('c99415d5-2d21-4a64-9d52-6e5c4ce22d0e','','',1579757803,NULL,151),('35385310-13d2-4b6b-84a3-c73755f1539a','','',1579757863,NULL,152),('5fe91003-9e05-4803-9b21-1c9b0bcc24d1','','',1579757924,NULL,153),('6aa91f86-8ff4-4fcc-8a4e-87f4f5fd4192','','',1579819497,NULL,154),('ca04fcc2-7c2a-4ff7-9d6f-a067595c65fe','','',1579819558,NULL,155),('c73296fa-7a45-4049-93b6-09a41e382b0d','','',1579819618,NULL,156),('a49823b7-0901-4a09-b2e2-0da773c1ae1a','','',1579819679,NULL,157),('2b2f8dbd-59c4-47b3-9ee6-a28b042b9aa6','','',1579819739,NULL,158),('da7faa7b-6cd6-4b96-bc77-67b1219ad05d','','',1579819800,NULL,159),('b0054718-05a1-45b0-bc93-881f9ec1f821','','',1579819860,NULL,160),('aba11527-1937-4665-aa81-0772c714168a','','',1579819921,NULL,161),('f26f2db1-fe42-4374-927f-5603d6d2e253','','',1579819981,NULL,162),('d956d313-73a0-4a2e-9efa-6b7ade486c15','','',1579820042,NULL,163),('ef657145-cc8c-45ae-b9db-d4b2227f22c8','','',1579820102,NULL,164),('2222023c-45b2-40b0-8edd-c0ae6345f578','','',1579820163,NULL,165),('c4b6b0ad-2c21-40ec-9a62-5c112161504e','','',1579820223,NULL,166),('821f3024-7cc3-4582-b7c8-7bab195503be','','',1579820284,NULL,167),('51593919-8bd0-4f48-9eef-591c630f389e','','',1579820344,NULL,168),('d7799934-c8b7-4ed1-a057-23c527f58363','','',1579820405,NULL,169),('961da1cc-5d63-4a2b-a9f8-2a2c74d5d415','','',1579820465,NULL,170),('0d1437f2-9952-4079-b595-f1211032e0df','','',1579820526,NULL,171),('6cd09685-54b2-47b1-948e-aa0e3da20b1c','','',1579820586,NULL,172),('c8ca52ad-00c2-4698-ae45-b2d0b9c56033','','',1579820646,NULL,173),('3faa8f91-d5f1-4f84-af96-c15121624c26','','',1579820707,NULL,174),('4a4b284f-4567-40c6-9911-c1f5e0010cd7','','',1579820767,NULL,175),('9efcce52-2880-4f53-a4bb-cae8339f1568','','',1579820828,NULL,176),('cab2a696-a650-485c-9c1f-fb77611eb1da','','',1579820888,NULL,177),('ff13a23e-eea2-4fb7-a02f-f19886d1b163','','',1579820949,NULL,178),('26d3532d-8c51-4d8a-a2a3-beac082ded2c','','',1579821009,NULL,179),('7d545dfe-85e1-45a3-ae06-e86a08a1d8c0','','',1579821070,NULL,180),('40916a7e-7149-490e-8fb9-4a1bb53ac553','','',1579821130,NULL,181),('c9a9d872-1e15-4352-87ec-cbdfb15d38bd','','',1579821191,NULL,182),('f014a2c3-197d-4d80-8d87-1ededd04ff44','','',1579821251,NULL,183),('03ca11e2-48e3-4890-a9d8-cefedf03a964','','',1579821312,NULL,184),('8ea7e527-bd42-4443-8e2b-ca3a066bd81d','','',1579821372,NULL,185),('aa4c7559-3b58-43b3-9c71-ba8833322ca8','','',1579821433,NULL,186),('ed6057b0-f1e1-469a-872b-07ae85c4fe51','','',1579821493,NULL,187),('a78096a3-fa1d-487e-a745-2799e986baa1','','',1579821554,NULL,188),('d371ba65-25e8-4ef8-8e66-4c8306b07aa2','','',1579821614,NULL,189),('ca08617e-8bd1-47bb-8635-9aac424e801f','','',1579821674,NULL,190),('0b6c44b2-0049-4df9-8385-dc76be396285','','',1579821735,NULL,191),('bacacd2c-35c4-4ee5-a78b-d205c537005b','','',1579821795,NULL,192),('bd7a99dd-332d-4f36-bac1-678789c871f7','','',1579821856,NULL,193),('065e6850-7d85-45be-ab52-9b4abcf9ddc5','','',1579821916,NULL,194),('576736b8-6e6d-46e1-96e1-6dd7492f3dad','','',1579821977,NULL,195),('c4a65860-2e7a-4187-a08c-e957e4795a67','','',1579822037,NULL,196),('96d7c2d5-b910-42f8-a73b-c18cb77c8d06','','',1579822097,NULL,197),('9993576c-3cc9-4b78-9d56-8808751b92ad','','',1579822158,NULL,198),('78222b0f-5bd5-409e-8d79-606fd0ff831a','','',1579822218,NULL,199),('d039dc10-7453-402a-bc38-8c66f42659fd','','',1579822279,NULL,200),('73eddaf9-e32c-41f4-98b4-c47e0977ca7f','','',1579822339,NULL,201),('68a15ae1-aa41-49c9-a715-b66f2a987409','','',1579822400,NULL,202),('543ec280-8b61-4aaa-b644-3dcc83f04cec','','',1579822461,NULL,203),('e7dcf001-f49f-4fc9-a6da-29982cd810dc','','',1579822521,NULL,204),('3bb0bc06-0ab6-4f8d-8fd2-93a51afb17b1','','',1579822581,NULL,205),('b462ae28-9dd6-454b-9227-0f6831f61928','','',1579822642,NULL,206),('c412a2d7-8c06-4bd3-8efd-104bc27cd4a7','','',1579822702,NULL,207),('523921a2-e502-49ae-9f8b-d0b2b37000c3','','',1579822763,NULL,208),('ec632ffe-7a6a-4835-baca-c48df319ce87','','',1579822823,NULL,209),('3d0a7b5b-d179-43db-84b2-4bae7a99686a','','',1579822884,NULL,210),('192cd1e0-9c51-4829-8a2b-6f1c9d461316','','',1579822944,NULL,211),('9ee00602-f7f4-4477-879e-f9653f0b9cd3','','',1579823004,NULL,212),('bfa275ca-bdac-40a0-86d6-e4edfff18faf','','',1579823065,NULL,213),('5b67adba-1915-45da-ac19-6449d4d4458c','','',1579823125,NULL,214),('a37ef94a-f32b-4d7e-a86e-b606c632d2cf','','',1579823186,NULL,215),('9271d0dd-3e5b-481a-8689-19159766559c','','',1579823247,NULL,216),('70eba6fe-e4fd-48b3-ba17-aab1bad15fc8','','',1579823308,NULL,217),('37c3b256-9d67-4faf-84df-e941c82474c0','','',1579823368,NULL,218),('24cd8588-e5f4-4ba0-92bc-8a3ba110972f','','',1579823428,NULL,219),('251c48d9-cb00-49fb-ad51-0e9e0bc304ea','','',1579823489,NULL,220),('59a25886-5285-48a5-bdcf-918704c7a750','','',1579823549,NULL,221),('27780099-0da7-45ba-af70-bb66fd733b55','','',1579823610,NULL,222),('e43af7ff-f198-4eda-bc99-148166cabbb6','','',1579823670,NULL,223),('d04927f9-8138-47c0-9761-67923d3d9c0d','','',1579823731,NULL,224),('cb70f4fd-2dc3-4480-a222-bbbbf1f6a6ca','','',1579823791,NULL,225),('23135b88-5ac1-460a-9d92-b491bf06fdf7','','',1579823852,NULL,226),('f7e85ec3-6d52-4c08-bb69-616c45ab9b5f','','',1579823912,NULL,227),('ff12e605-5e1c-4e30-ba3a-3ef3e2014f1e','','',1579823973,NULL,228),('f0f2caab-5b4b-469c-aa11-c41bf2c2f5d0','','',1579824034,NULL,229),('bbce6514-a6d2-4160-8d98-294b89894a35','','',1579824095,NULL,230),('e6cf7543-74e9-4f1a-8fd7-b5e2131b0c3f','','',1579824156,NULL,231),('8ce36bd5-622b-421c-9557-9358d409caac','','',1579824217,NULL,232),('0b45f563-205d-4f68-8452-d7a24a491386','','',1579824277,NULL,233),('6ff2ea47-07f1-455b-af92-d07d87630896','','',1579824338,NULL,234),('a2a90caf-1a04-4e61-9ce5-e86f958f01d1','','',1579824398,NULL,235),('0d935013-51ab-4f8d-9e68-c9629859228c','','',1579824459,NULL,236),('14fd4921-37d6-4e01-91c5-6b37cc777f0a','','',1579824519,NULL,237),('301999f2-723b-4084-82e6-f44bd8e80766','','',1579824580,NULL,238),('ebf29b87-abf5-49c2-9981-ac66ee8ac6e4','','',1579824640,NULL,239),('1e24bc2d-8aec-42a1-b373-f446022d9007','','',1579824701,NULL,240),('4bcb3df5-ca40-4c21-9d56-622cb70af760','','',1579824761,NULL,241),('12d3d6cd-e37a-4734-9e11-18f19a294bfa','','',1579824822,NULL,242),('5d98ea48-1685-40e7-b53f-7782899fd9b9','','',1579824882,NULL,243),('1e1e25d6-0fd2-450d-82dc-d95ec0fff030','','',1579824943,NULL,244),('16a3d4df-b52c-4dd4-898c-e93556032023','','',1579825003,NULL,245),('514af229-632a-4a44-8f47-e0c21d5ffdb0','','',1579825064,NULL,246),('24130cd1-18bc-4c4c-b433-237c9155301e','','',1579825124,NULL,247),('e4adfce4-f450-4319-948e-af446ea28573','','',1579825185,NULL,248),('36836164-b9fa-4a56-9ab4-7750e3eb41af','','',1579825245,NULL,249),('c2d79106-83ac-4626-95c4-074f1f2e0279','','',1579825305,NULL,250),('5d36ae5d-6f7d-47f3-9789-85d2bdc0bd11','','',1579825366,NULL,251),('fac371f2-66f3-4a72-8aa6-f5804c49ae39','','',1579825426,NULL,252),('a27d7035-b571-438e-923c-23ca5dde998d','','',1579825487,NULL,253),('3099caec-5d44-4ebe-adb4-06d35d8b2515','','',1579825547,NULL,254),('8f57aab8-b3f0-4581-a1f7-109317e7be61','','',1579825608,NULL,255),('00196b56-99c0-4cd0-bc35-5e9fae75f8cb','','',1579825669,NULL,256),('20ac7e98-44c3-401f-8795-b2908a93856b','','',1579825729,NULL,257),('d282b34d-0c07-4587-8d52-076cfff13908','','',1579825790,NULL,258),('ad82f8d9-fdef-4ea0-a4d6-e3d7a00bff9d','','',1579825850,NULL,259),('715b94d4-daac-41a5-9e67-7fa52f402526','','',1579825911,NULL,260),('3a67076e-eefa-4ff0-bf23-0d657dae9c1e','','',1579825972,NULL,261),('d93d13f4-10a7-4f42-80ae-3a5d104decea','','',1579826033,NULL,262),('6f6fa7af-b880-4b47-b17e-5855d04f70c1','','',1579826094,NULL,263),('38694d67-2e1c-4979-87da-ef26ef6fa61c','','',1579826155,NULL,264),('fbf21c35-f2fe-41b7-a293-165c796dd398','','',1579826215,NULL,265),('f783bfa9-9ce9-43d0-a94b-6edebeef3816','','',1579826276,NULL,266),('ee612151-ea1e-458d-b6b7-a08fd29d3bb7','','',1579826336,NULL,267),('6384f399-cb93-405d-9faa-8b528ad9f387','','',1579826397,NULL,268),('a7981a31-6cc3-4b6b-a5e4-43006c624997','','',1579826457,NULL,269),('87bce5e5-7f16-4dd7-bc89-03b6f1959367','','',1579826518,NULL,270),('7848e968-9b99-4279-8b95-2c55da6c0173','','',1579826579,NULL,271),('5a92d29d-6f8f-4e37-aeba-ba2414532e95','','',1579826640,NULL,272),('abab7abb-ea38-4c4f-9a5f-46f412facedf','','',1579826701,NULL,273),('b54bbb68-6a98-4f43-823e-6b208ca4ec91','','',1579826762,NULL,274),('1eece2e7-a257-49d9-902e-a69d25d86e0f','','',1579826824,NULL,275),('9cff3c1d-0082-4d41-8f01-7f10f98efe1c','','',1579826885,NULL,276),('9e8e44fb-1fb0-45fc-87ce-846f269e68f3','','',1579826945,NULL,277),('b8d08cc6-eaf0-40c1-9293-d8f4a6044d59','','',1579827006,NULL,278),('c261a0e3-fd16-418d-96f4-70e9bbd1e004','','',1579827066,NULL,279),('d1fb2ede-a068-45ce-ba72-fe806e927bf4','','',1579827127,NULL,280),('05a8cda2-79c5-4924-bd16-2bc078b593e5','','',1579827187,NULL,281),('7a472a67-9885-4664-8039-c7cb88c4d2b6','','',1579827248,NULL,282),('d6e7fc43-f75e-4dd9-96fb-be5a27ab1b4d','','',1579827308,NULL,283),('8ad28ef2-a0a2-4f1e-9706-f8b20b3eff6e','','',1579827369,NULL,284),('b51a1ac9-7224-41cc-b492-7e0086092b4c','','',1579827429,NULL,285),('e252f2c9-2fca-4529-a0ea-bfd1215ee0a6','','',1579827490,NULL,286),('b2a1c5f0-cf0e-4101-b478-38a2fa4a5963','','',1579827550,NULL,287),('6942b2b5-36f4-4cdc-bfe4-b034ca5a79bb','','',1579827610,NULL,288),('07a5530a-e01f-4543-9aac-a8149177d885','','',1579827671,NULL,289),('4adfd85b-9d54-43ee-9dd0-16b3ba1cd7b9','','',1579827731,NULL,290),('232c6e9a-4f31-4c72-a9c2-3c3524e0cfcc','','',1579827792,NULL,291),('c4f08f87-45ed-44ac-bdf4-023f4b825b32','','',1579827852,NULL,292),('6620a715-9ade-4c49-859e-e364885d55a9','','',1579827913,NULL,293),('9ca37267-b2d2-4a22-8ee0-dd327d7f42c6','','',1579827974,NULL,294),('8931e9fa-069a-49b8-8f26-203f67df09e2','','',1579828034,NULL,295),('aab93769-efc2-49d5-9ca5-2514e6f60487','','',1579828095,NULL,296),('1495815d-3580-40fd-b57e-0205ffba4470','','',1579828155,NULL,297),('2c453173-e609-4954-ae68-06655f811ae1','','',1579828216,NULL,298),('14805066-0276-429b-9035-6079c429e4be','','',1579828276,NULL,299),('0ab90062-291e-4e9c-a347-a15ec7bab42b','','',1579828337,NULL,300),('b7860630-3fbe-4acf-ab3d-c2a991db6253','','',1579828355,NULL,302),('1f78af54-c314-4e87-b978-697ed6a254bc','','',1579828397,NULL,303),('c1ab78bc-4533-4ffa-8205-bc80172756f3','','',1579828458,NULL,304);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_settings_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'session_policy','0'),(2,'session_absolute_policy','0'),(3,'session_remember_me_disabled','0'),(4,'is_fallback_enabled','0'),(5,'create_account_on_first_login','0'),(6,'login_type','local'),(7,'current_sso_integration','none'),(8,'database_version','194'),(9,'installation_name','TestRail QA'),(10,'installation_url','http://localhost:8000/'),(11,'attachment_dir','/opt/testrail/attachments/'),(12,'report_dir','/opt/testrail/reports/'),(13,'default_language','en'),(14,'default_locale','en-us'),(15,'default_timezone',NULL),(16,'email_server',NULL),(17,'email_ssl',NULL),(18,'email_from',NULL),(19,'email_user',NULL),(20,'email_pass',NULL),(21,'email_notifications',NULL),(22,'license_key','Fitj0QhS1Un9E7FrFIDkncf9GR6fMrR799mb0hsL6pr6ZGAXp6uTBQTOUflN\r\nomXPL1uO6uUZ9SrkMBMZaRhCnf9E9fCSJlxUKVYpXd7QdePwNCH/U+Mabid4\r\nqrt8zEkkayTntcajMTMLaVcQXUuRy0lUAP8Uf11FB5nqMOXYSZ55kg7IAhqr\r\nhgjroBXNzECtA+ys6H5cdpHuQmLI9bjNKjTFJ9lCjzQ3Ti3exEkrzI0Qufd0\r\ngSpvQaQ3lCjlELJnq6m1LuN1qmTWldgadC3WJWi6uOFXENblX8TDFtf4Z28='),(23,'latest_version','6.1.1.1020'),(24,'audit_next_expiration_date_time','2020-01-25 00:00:00');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sso_settings`
--

DROP TABLE IF EXISTS `sso_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sso_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sso_integration_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `testrail_entity_id` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sso_url` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idp_sso_url` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idp_issuer_url` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ssl_certificate` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_sso_integration_name` (`sso_integration_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sso_settings`
--

LOCK TABLES `sso_settings` WRITE;
/*!40000 ALTER TABLE `sso_settings` DISABLE KEYS */;
INSERT INTO `sso_settings` VALUES (1,'saml',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sso_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `system_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `color_dark` int(11) NOT NULL,
  `color_medium` int(11) NOT NULL,
  `color_bright` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  `is_system` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_untested` tinyint(1) NOT NULL,
  `is_final` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_statuses_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'passed','passed','Passed',3377729,3979344,4974179,1,1,1,0,1),(2,'blocked','blocked','Blocked',4671303,5855577,9211020,2,1,1,0,1),(3,'untested','untested','Untested',7566195,9934743,13224393,3,1,1,1,0),(4,'retest','retest','Retest',12161289,16564736,16766281,4,1,1,0,0),(5,'failed','failed','Failed',11077946,14942278,16515150,5,1,1,0,1),(6,'custom_status1','custom_status1','Unnamed 1',0,10526880,13684944,6,0,0,0,0),(7,'custom_status2','custom_status2','Unnamed 2',0,10526880,13684944,7,0,0,0,0),(8,'custom_status3','custom_status3','Unnamed 3',0,10526880,13684944,8,0,0,0,0),(9,'custom_status4','custom_status4','Unnamed 4',0,10526880,13684944,9,0,0,0,0),(10,'custom_status5','custom_status5','Unnamed 5',0,10526880,13684944,10,0,0,0,0),(11,'custom_status6','custom_status6','Unnamed 6',0,10526880,13684944,11,0,0,0,0),(12,'custom_status7','custom_status7','Unnamed 7',0,10526880,13684944,12,0,0,0,0);
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL,
  `test_id` int(11) NOT NULL,
  `run_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_subscriptions_run_test` (`run_id`,`test_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suites`
--

DROP TABLE IF EXISTS `suites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_on` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `is_copy` tinyint(1) NOT NULL,
  `copyof_id` int(11) DEFAULT NULL,
  `is_master` tinyint(1) NOT NULL,
  `is_baseline` tinyint(1) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_completed` tinyint(1) NOT NULL,
  `completed_on` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_suites_project_id` (`project_id`),
  KEY `ix_suites_copyof_id` (`copyof_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suites`
--

LOCK TABLES `suites` WRITE;
/*!40000 ALTER TABLE `suites` DISABLE KEYS */;
/*!40000 ALTER TABLE `suites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `is_locked` tinyint(1) NOT NULL,
  `heartbeat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,0,1579828458);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_projects`
--

DROP TABLE IF EXISTS `template_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_projects` (
  `template_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`template_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_projects`
--

LOCK TABLES `template_projects` WRITE;
/*!40000 ALTER TABLE `template_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `include_all` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` VALUES (1,'Test Case (Text)',1,0,1),(2,'Test Case (Steps)',0,0,1),(3,'Exploratory Session',0,0,1);
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_activities`
--

DROP TABLE IF EXISTS `test_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_activities` (
  `date` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `run_id` int(11) NOT NULL,
  `passed_count` int(11) NOT NULL,
  `retest_count` int(11) NOT NULL,
  `failed_count` int(11) NOT NULL,
  `untested_count` int(11) NOT NULL,
  `blocked_count` int(11) NOT NULL,
  `custom_status1_count` int(11) NOT NULL,
  `custom_status2_count` int(11) NOT NULL,
  `custom_status3_count` int(11) NOT NULL,
  `custom_status4_count` int(11) NOT NULL,
  `custom_status5_count` int(11) NOT NULL,
  `custom_status6_count` int(11) NOT NULL,
  `custom_status7_count` int(11) NOT NULL,
  PRIMARY KEY (`date`,`project_id`,`run_id`),
  KEY `ix_test_activities_run_id` (`run_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_activities`
--

LOCK TABLES `test_activities` WRITE;
/*!40000 ALTER TABLE `test_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_assocs`
--

DROP TABLE IF EXISTS `test_assocs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_assocs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_change_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_test_assocs_test_change_id` (`test_change_id`),
  KEY `ix_test_assocs_test_id` (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_assocs`
--

LOCK TABLES `test_assocs` WRITE;
/*!40000 ALTER TABLE `test_assocs` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_assocs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_changes`
--

DROP TABLE IF EXISTS `test_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `version` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `elapsed` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defects` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `assignedto_id` int(11) DEFAULT NULL,
  `unassigned` tinyint(1) NOT NULL,
  `project_id` int(11) NOT NULL,
  `run_id` int(11) NOT NULL,
  `is_selected` tinyint(1) NOT NULL,
  `caching` int(11) NOT NULL,
  `custom_step_results` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `ix_test_changes_test_id` (`test_id`),
  KEY `ix_test_changes_project_order` (`project_id`,`is_selected`,`created_on`),
  KEY `ix_test_changes_run_order` (`run_id`,`is_selected`,`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_changes`
--

LOCK TABLES `test_changes` WRITE;
/*!40000 ALTER TABLE `test_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_progress`
--

DROP TABLE IF EXISTS `test_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_progress` (
  `date` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `run_id` int(11) NOT NULL,
  `tests` int(11) NOT NULL,
  `forecasts` int(11) NOT NULL,
  PRIMARY KEY (`date`,`project_id`,`run_id`),
  KEY `ix_test_progress_run_id` (`run_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_progress`
--

LOCK TABLES `test_progress` WRITE;
/*!40000 ALTER TABLE `test_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_timers`
--

DROP TABLE IF EXISTS `test_timers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_timers` (
  `test_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `started_on` int(11) NOT NULL,
  `elapsed` int(11) NOT NULL,
  `is_paused` tinyint(1) NOT NULL,
  PRIMARY KEY (`test_id`,`user_id`),
  KEY `ix_test_timers_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_timers`
--

LOCK TABLES `test_timers` WRITE;
/*!40000 ALTER TABLE `test_timers` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_timers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `case_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `assignedto_id` int(11) DEFAULT NULL,
  `is_selected` tinyint(1) NOT NULL,
  `last_status_change_id` int(11) DEFAULT NULL,
  `is_completed` tinyint(1) NOT NULL,
  `in_progress` int(11) NOT NULL,
  `in_progress_by` int(11) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `tested_by` int(11) DEFAULT NULL,
  `tested_on` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_tests_run_id` (`run_id`),
  KEY `ix_tests_case_id` (`case_id`,`is_selected`),
  KEY `ix_tests_content_id` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uiscripts`
--

DROP TABLE IF EXISTS `uiscripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uiscripts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `includes` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excludes` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` longtext COLLATE utf8_unicode_ci,
  `js` longtext COLLATE utf8_unicode_ci,
  `css` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uiscripts`
--

LOCK TABLES `uiscripts` WRITE;
/*!40000 ALTER TABLE `uiscripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `uiscripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_columns`
--

DROP TABLE IF EXISTS `user_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_columns` (
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `columns` longtext COLLATE utf8_unicode_ci NOT NULL,
  `group_by` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `group_order` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`project_id`,`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_columns`
--

LOCK TABLES `user_columns` WRITE;
/*!40000 ALTER TABLE `user_columns` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_exports`
--

DROP TABLE IF EXISTS `user_exports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_exports` (
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `format` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `options` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`project_id`,`area_id`,`format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_exports`
--

LOCK TABLES `user_exports` WRITE;
/*!40000 ALTER TABLE `user_exports` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_exports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_fields`
--

DROP TABLE IF EXISTS `user_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `system_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `type_id` int(11) NOT NULL,
  `fallback` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_user_fields_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_fields`
--

LOCK TABLES `user_fields` WRITE;
/*!40000 ALTER TABLE `user_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_filters`
--

DROP TABLE IF EXISTS `user_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_filters` (
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `filters` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`project_id`,`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_filters`
--

LOCK TABLES `user_filters` WRITE;
/*!40000 ALTER TABLE `user_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_logins`
--

DROP TABLE IF EXISTS `user_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL,
  `attempts` int(11) NOT NULL,
  `current_auth` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'local',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_user_logins_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_logins`
--

LOCK TABLES `user_logins` WRITE;
/*!40000 ALTER TABLE `user_logins` DISABLE KEYS */;
INSERT INTO `user_logins` VALUES (1,'dgopidas@genixventures.com',1579744341,1579749183,0,'local');
/*!40000 ALTER TABLE `user_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_user_settings_name` (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `series` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hash` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `created_on` int(11) NOT NULL,
  `expires_on` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_user_tokens_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tokens`
--

LOCK TABLES `user_tokens` WRITE;
/*!40000 ALTER TABLE `user_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `salt` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `hash` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `rememberme` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notifications` tinyint(1) NOT NULL,
  `csrf` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `login_token` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_token_until` int(11) DEFAULT NULL,
  `last_activity` int(11) DEFAULT NULL,
  `is_reset_password_forced` tinyint(1) NOT NULL DEFAULT '0',
  `data_processing_agreement` longtext COLLATE utf8_unicode_ci,
  `theme` int(11) DEFAULT '0',
  `is_sso_enabled` int(11) DEFAULT '0',
  `is_fallback_password_set` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Divya Gopidas','dgopidas@genixventures.com',1,'','1:$2y$10$gUBh2gTa0Ia9D/32/mWv3OhINSjw.E.xre9wPuf2kXEv6L4868FbW',1,'',NULL,NULL,0,'',1,NULL,NULL,NULL,1579828344,0,NULL,0,0,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-24  1:14:47
