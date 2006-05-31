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
//  File:         /admin/backup.php                                          //
//  Language:     PHP 4.3                                                    //
//                                                                           //
//  Description:  Backups and restores user's database with gzip compressed  //
//                SQL files                                                  //
//                                                                           //
//  Author:       Francisco Garcia Rodriguez <kalahan@users.berlios.de>      //
//                                                                           //
//  $Id$
//  ------------------------------------------------------------------------ //

include "../common.php";
include "inc/backup.inc";

switch ($_GET['Action'])
{

//
// Making a backup
// 
case "backup":
    
    // Remove previous backups
    CleanPrevious();
    
    // Backup file
    $bakfile= BuildBackupFile();
    
    // Compresion
    ZipBackupFile($bakfile);
    
    // Remember
    setcookie("lastbackup", time(), 2147483647);

    // Give it to user
    $local = HOMESITE;
    header("Location: $local/$bakfile.gz"); 
    break;


//
// Restoring some file
//     
case "restore":
    break;



//
// Showing main Backup window
// 
default:
    $smarty= Template();
    $smarty->assign("section", "Admin");
    $smarty->assign("lastbackup", date("F dS, Y",$_COOKIE['lastbackup']) );

    $smarty->display('admin/backup.tpl');
}


?>
