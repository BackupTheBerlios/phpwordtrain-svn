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
//  File:         /index.php                                                 //
//  Language:     PHP 4.3                                                    //
//                                                                           //
//  Description:  Main page. Wellcome screen for user and starting point     //
//                                                                           //
//  Author:       Francisco Garcia Rodriguez <kalahan@users.berlios.de>      //
//                                                                           //
//  $Id$
//  ------------------------------------------------------------------------ //


if ( ! file_exists("config.inc") )
{
   header("Location: config.php");
   die;
} 

include "common.php";
$smarty= Template();
$smarty->assign("section", "Home");
$smarty->display('index.tpl');

?>
