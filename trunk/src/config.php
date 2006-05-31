<?php
//  ------------------------------------------------------------------------ //
//                               phpWordTrain                                //
//                           Copyright (c) 2005                              //
//                   <http://phpwordtrain.berlios.de>                        //
//  ------------------------------------------------------------------------ //
//  This program is free software; you can redistribute it and/or modify     //
//  it under the terms of the GNU General Public License as published by     //
//  the Free Software Foundation; either version 2 of the License, or        //
//  (at your option) any later version.                                      //
//                                                                           //
//  You may not change or alter any portion of this comment or credits       //
//  of supporting developers from this source code or any supporting         //
//  source code which is considered copyrighted (c) material of the          //
//  original comment or credit authors.                                      //
//                                                                           //
//  This program is distributed in the hope that it will be useful,          //
//  but WITHOUT ANY WARRANTY; without even the implied warranty of           //
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            //
//  GNU General Public License for more details.                             //
//                                                                           //
//  You should have received a copy of the GNU General Public License        //
//  along with this program; if not, write to the Free Software              //
//  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA //
//  ------------------------------------------------------------------------ //
//                                                                           //
//  File:         /config.php                                                //
//  Language:     PHP 4.3                                                    //
//                                                                           //
//  Description:  This will be automatically called when basic configuration //
//                information is missing. This is an installation assistant  //
//                to retrieve configuration parameters and build the         //
//                program's database
//                                                                           //
//  Author:       Francisco Garcia Rodriguez <kalahan@users.berlios.de>      //
//                                                                           //
//  $Id$
//  ------------------------------------------------------------------------ //

            
// Only in this case, we don't use 'common.php' because we don't have reliable
// information about configuration. That's why we cannot use global
// page initialization
require 'lib/Smarty/Smarty.class.php';
$smarty = new Smarty();
$smarty->template_dir = "smarty/templates";
$smarty->compile_dir  = "smarty/templates_c";
$smarty->cache_dir    = "smarty/cache";
$smarty->config_dir   = "smarty/configs";


if ( $_POST['action'] == 'Finish' )
{
   $smarty->display('config/step3.tpl');
   mysql_connect($_POST['server'],$_POST['user'],$_POST['password']) ;
   mysql_query("create database $_POST[database]");
   mysql_query("GRANT ALL ON $_POST[database].* TO phpwordtrain@localhost IDENTIFIED BY 'phpwordtrain_pass'");

   $out_file = fopen("tmp/config.inc", "w");
   fwrite($out_file,"<?php\n".
    "\t// Days asigned to each level\n" .
    "\tdefine('LEVEL0',   0);\n" .
    "\tdefine('LEVEL1',   1);\n" .
    "\tdefine('LEVEL2',   3);\n" .
    "\tdefine('LEVEL3',   7);\n" .
    "\tdefine('LEVEL4',  14);\n" .
    "\tdefine('LEVEL5',  30);\n" .
    "\tdefine('LEVEL6',  60);\n" .
    "\tdefine('LEVEL7', 120);\n" .
    "\tdefine('LEVEL8', 240);\n" .
    "\tdefine('LEVEL9', 480);\n" .
    "\t\n" .
    "\t// Database configuration\n" .
    "\tdefine('DB_HOST','$_POST[server]');\n" .
    "\tdefine('DB_USER','phpwordtrain');\n" .
    "\tdefine('DB_PASS','phpwordtrain_pass');\n" .
    "\tdefine('DB_NAME','$_POST[database]');\n" .
    "\t\n" .
    "\t// Program routes\n" .
    "\tdefine('HOMESITE', '$_POST[homesite]');\n" .
    "\tdefine('LOCALDIR', '$_POST[localdir]');\n" .
    "\t\n" .
    "\t// External programs\n");    

    if (isset ($_POST['mysqldump']))
      fwrite($out_file,"\tdefine('MYSQLDUMP','$_POST[mysqldump]');\n");
    else
      fwrite($out_file,"\t\\\\define('MYSQLDUMP','$_POST[mysqldump]');\n");

    if (isset ($_POST['gzip']))
      fwrite($out_file,"\tdefine('GZIP','$_POST[gzip]');\n");
    else
      fwrite($out_file,"\t\\\\define('GZIP','$_POST[gzip]');\n");
    
    fwrite($out_file,"?>"); 

    die;
}

////////////////////////////////////////////////////////////////////////
// Set default values
////////////////////////////////////////////////////////////////////////

// Mysql server 
if ( isset($_POST['server']) )
   $data = $_POST['server'];
else
   $data = "localhost";

if ( mysql_connect($data,x) ) 
   $smarty->assign("server_status", "green");
else
   $smarty->assign("server_status", "red");

$smarty->assign("server", $data);


// Admin user and password check
mysql_close();
if ( isset($_POST['user'] ) )
{
   if ( mysql_connect($data,$_POST['user'],$_POST['password']) ) 
   {
      $smarty->assign("user_status", "green");
      $smarty->assign("password_status", "green");
   }
   else
   {
      $smarty->assign("user_status", "red");
      $smarty->assign("password_status", "red");
   }

   // If any value is set, we must remember it
   $smarty->assign("user", $_POST['user']);
   $smarty->assign("password", $_POST['password']);
}
else
{
   $smarty->assign("user", "root");
   $smarty->assign("password", "root");
}


// Mysql database
if ( isset($_POST['database']) )
   $data = $_POST['database'];
else
   $data = "db_phpwordtrain";

if ( mysql_select_db($data) )
{
   $smarty->assign("database_status", "red");
   $smarty->assign("database_msg", "Database exists");
}
else
   $smarty->assign("database_status", "green");

$smarty->assign("database", "$data");


// Mysqldump
if ( $_POST['dump_available'] == false )
{
   $smarty->assign("mysqldump_activation", "disabled");
   $smarty->assign("dump_available_default", "0");
   $smarty->assign("mysqldump", '/usr/bin/mysqldump');
   $smarty->assign("mysqldump_status", "green");
}
else
{
   $smarty->assign("dump_available_default", "1");
   if ( isset($_POST['mysqldump']) )
   {
      $smarty->assign("mysqldump", $_POST['mysqldump']);
      if ( file_exists($_POST['mysqldump']) )
         $smarty->assign("mysqldump_status", "green");
      else
         $smarty->assign("mysqldump_status", "red");

   }
   else
   {
      $smarty->assign("mysqldump", "/usr/bin/mysqldump");
      $smarty->assign("mysqldump_status", "red");
   }
}


// gzip
if ( $_POST['gzip_available'] == false )
{
   $smarty->assign("gzip_activation", "disabled");
   $smarty->assign("gzip_available_default", "0");
   $smarty->assign("gzip", '/usr/bin/gzip');
   $smarty->assign("gzip_status", "green");
}
else
{
   $smarty->assign("gzip_available_default", "1");
   if ( isset($_POST['gzip']) )
   {
      $smarty->assign("gzip", $_POST['gzip']);
      if ( file_exists($_POST['gzip']) )
         $smarty->assign("gzip_status", "green");
      else
         $smarty->assign("gzip_status", "red");

   }
   else
   {
      $smarty->assign("gzip", "/usr/bin/gzip");
      $smarty->assign("gzip_status", "red");
   }
}



// LocalDIR
if ( isset($_POST['localdir']) )
   $data = $_POST['localdir'];
else
   $data = "/var/www/apps/phpWordTrain/";

if ( is_dir($data) and is_dir($data."/smarty") and is_dir($data."/study") ) 
   $smarty->assign("localdir_status", "green");
else
   $smarty->assign("localdir_status", "red");

$smarty->assign("localdir", $data);

// URL, so far, we don't check if it's the right one
$smarty->assign("homesite", "http://localhost/apps/phpWordTrain/");
$smarty->assign("homesite_status", "yellow");



//
// If all lights are green, then we can proceed to next step
//
if (
      $smarty->get_template_vars('server_status') == "green" and
      $smarty->get_template_vars('database_status') == "green" and
      $smarty->get_template_vars('user_status') == "green" and
      $smarty->get_template_vars('password_status') == "green" and
      $smarty->get_template_vars('mysqldump_status') == "green" and
      $smarty->get_template_vars('gzip_status') == "green" and
      $smarty->get_template_vars('localdir_status') == "green"
   )
   $smarty->display('config/step2.tpl');
else
   $smarty->display('config/step1.tpl');

?>
