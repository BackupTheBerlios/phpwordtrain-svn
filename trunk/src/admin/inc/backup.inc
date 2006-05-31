<?php
//  ------------------------------------------------------------------------ //
//                               phpWordTrain                                //
//                           Copyright (c) 2005                              //
//                     <http://phpwordtrain.berlios.de>                      //
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
//  File:         /admin/inc/backup.inc                                      //
//  Language:     PHP 4.3                                                    //
//                                                                           //
//  Description:  Backups functions                                          //
//                                                                           //
//  Author:       Francisco Garcia Rodriguez <kalahan@users.berlios.de>      //
//                                                                           //
//  $Id: index.php 10 2005-07-20 16:21:39Z Kalahan $
//  ------------------------------------------------------------------------ //

include "../common.php";

// Clean previous backup
function CleanPrevious()
{
    $cmd = "rm ".LOCALDIR."/tmp/wordtrain*.sql*";
    exec($cmd);
}   


// Backup file
function BuildBackupFile()
{
    $bakfile    = "/tmp/wordtrain".date("Ymd").".sql";
    $local      = LOCALDIR;
    $user       = DB_USER;
    $pass       = DB_PASS;
    $db         = DB_NAME;
    $prog       = MYSQLDUMP;
    $cmd        = "$prog --opt -u $user --password=$pass $db > $local/$bakfile";
    
    exec($cmd);
    return $bakfile;
}    
    
    
// Compress backup file
function ZipBackupFile($bakfile)
{
    $zip        = GZIP;
    $local      = LOCALDIR;

    $cmd  = "$zip $local/$bakfile";
    exec($cmd);
}
 
?>
