<?php//  ------------------------------------------------------------------------ ////                               phpWordTrain                                ////                           Copyright (c) 2005                              ////                     <http://phpwordtrain.berlios.de>                      ////  ------------------------------------------------------------------------ ////  This program is free software; you can redistribute it and/or modify     ////  it under the terms of the GNU General Public License as published by     ////  the Free Software Foundation; either version 2 of the License, or        ////  (at your option) any later version.                                      ////                                                                           ////  You may not change or alter any portion of this comment or credits       ////  of supporting developers from this source code or any supporting         ////  source code which is considered copyrighted (c) material of the          ////  original comment or credit authors.                                      ////                                                                           ////  This program is distributed in the hope that it will be useful,          ////  but WITHOUT ANY WARRANTY; without even the implied warranty of           ////  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            ////  GNU General Public License for more details.                             ////                                                                           ////  You should have received a copy of the GNU General Public License        ////  along with this program; if not, write to the Free Software              ////  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA ////  ------------------------------------------------------------------------ ////                                                                           ////  File:         /dictionary/index.php                                      ////  Language:     PHP 4.3                                                    ////                                                                           ////  Description:  Main page for Dictionary section                           ////                                                                           ////  Author:       Francisco Garcia Rodriguez <kalahan@users.berlios.de>      ////                                                                           ////  $Id$//  ------------------------------------------------------------------------ //include "../common.php";include "../lib/format.php";include "inc/index.inc";define ('ENTRIES_PAGE',50);     // No. of entries per page$no_pages= $_GET['total'];      // No. of pages$smarty= Template();$smarty->assign("section", "Dictionary");$sql = "select * from lang_german";// Sort methodif ( isset($_GET['sort']) ){    $sql_sort= " order by $_GET[sort] $_GET[way] ";    $smarty->assign("sorting", $_GET['sort']);}else{    $sql_sort= ' order by word asc';    $smarty->assign("sorting", 'word');}// Viability of outside conections for search forms$smarty->assign("internet", NetAvailable() );// Set the range of pages for the query and set default values if (!isset($_GET['page'])){    $_GET['page']= 1;    $no_pages=  mysql_num_rows(mysql_query($sql));    $no_pages= ceil($no_pages / ENTRIES_PAGE);}$sql_limit = ' limit '. ($_GET['page']-1)*ENTRIES_PAGE . ','. ENTRIES_PAGE;$smarty->assign("no_pages", $no_pages );$smarty->assign("p_last", $_GET['page']-1);$smarty->assign("p_next", $_GET['page']+1);$smarty->assign("p_current", $_GET['page']);// Array with the numbers$smarty->assign("page_numbers", PageNumbers($no_pages) );// Words for listing$smarty->assign("linea", WordsListing($sql, $sql_sort, $sql_limit) );$smarty->display('dictionary/index.tpl');?>