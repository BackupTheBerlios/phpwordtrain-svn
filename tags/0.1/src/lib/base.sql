-- MySQL dump 8.23
---------------------------------------------------------
-- Server version	3.23.58

--
-- Table structure for table `lang_german`
--

CREATE TABLE lang_german (
  datein datetime NOT NULL default '2001-01-01 00:00:00',
  word char(100) NOT NULL default '',
  translation char(100) NOT NULL default '',
  tip_trans char(100) default NULL,
  tip_word char(100) default NULL,
  genre set('masculin','femenin','neutrum') default NULL,
  type char(20) default NULL,
  level smallint(6) NOT NULL default '0',
  lasthit date NOT NULL default '0000-00-00',
  misses int(8) NOT NULL default '0',
  hot tinyint(1) default '0',
  PRIMARY KEY  (word)
) TYPE=MyISAM;

--
-- Table structure for table `types_german`
--

CREATE TABLE types_german (
  name char(20) NOT NULL default '',
  PRIMARY KEY  (name)
) TYPE=MyISAM;

