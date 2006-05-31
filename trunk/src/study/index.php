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
//  File:         /study/index.php                                           //
//  Language:     PHP 4.3                                                    //
//                                                                           //
//  Description:  Main page for Study section                                //
//                                                                           //
//  Author:       Francisco Garcia Rodriguez <kalahan@users.berlios.de>      //
//                                                                           //
//  $Id$
//  ------------------------------------------------------------------------ //


include "../common.php";

// Just basic information
$smarty= Template();
$smarty->assign("section", "Study");

// Global info
define("TODAY",      date("Ymd"));
define("THIS_MONTH", date("Ym"));
define("THIS_WEEK",  date("Ym").Floor(date("d")/7) ); 

// Grab number of words for each level
$stats= array();
$average = 0;
$total_words = 0;
$levels = 9;

// Count number of words at each level
for ($i = 0; $i <= $levels; $i++) {
    $sql= "select level from lang_german where level=".$i;
    $result= mysql_query($sql) or die(mysql_error());
    $total_words += $n_this = mysql_num_rows($result);
    $average += $n_this*$i;
    
    // Store last sesssion count
    if ( TODAY != $_COOKIE['stats_session1_day'] )
    {
        setcookie("stats_session1_$i", $n_this, 2147483647);
    }
    if ( THIS_WEEK != $_COOKIE['stats_session2_week'] )
    {
        setcookie("stats_session2_$i", $n_this, 2147483647);
    }
    if ( THIS_MONTH != $_COOKIE['stats_session3_month'] )
    {
        setcookie("stats_session3_$i", $n_this, 2147483647);
    }

    // Set color for stats
    if      ($_COOKIE["stats_session1_$i"] > $n_this)
        $session1_color = "green";
    elseif  ($_COOKIE["stats_session1_$i"] < $n_this)
        $session1_color = "red";
    else
        $session1_color = "black";

    if      ($_COOKIE["stats_session2_$i"] > $n_this)
        $session2_color = "green";
    elseif  ($_COOKIE["stats_session2_$i"] < $n_this)
        $session2_color = "red";
    else
        $session2_color = "black";

    if      ($_COOKIE["stats_session3_$i"] > $n_this)
        $session3_color = "green";
    elseif  ($_COOKIE["stats_session3_$i"] < $n_this)
        $session3_color = "red";
    else
        $session3_color = "black";

    array_push($stats,array($i,$n_this,
        $_COOKIE["stats_session1_$i"],$session1_color,
        $_COOKIE["stats_session2_$i"],$session2_color,
        $_COOKIE["stats_session3_$i"],$session3_color
     ));
}
$average/= $total_words;
$smarty->assign("stats",$stats);

// Now calculate total level for dictionary
$smarty->assign("total",$total_words);
$smarty->assign("average",$average);

//
// COOKIES for historic stats
//

// Update last session stats
if ( TODAY != $_COOKIE['stats_session1_day'] )
{
    setcookie("stats_session1_total",   $total_words, 2147483647);
    setcookie("stats_session1_average", $average, 2147483647);
    setcookie("stats_session1_day",     TODAY, 2147483647);
}
$smarty->assign("stats_session1_total",   $_COOKIE['stats_session1_total']);
$smarty->assign("stats_session1_average", $_COOKIE['stats_session1_average']);

if ($_COOKIE['stats_session1_average'] > $average)
    $smarty->assign("stats_session1_average_color","green");
else
    $smarty->assign("stats_session1_average_color","red");

    
// Update last week stats
if ( THIS_WEEK != $_COOKIE['stats_session2_week'] )
{
    setcookie("stats_session2_total",   $total_words, 2147483647);
    setcookie("stats_session2_average", $average, 2147483647);
    setcookie("stats_session2_week",    THIS_WEEK, 2147483647);
}
$smarty->assign("stats_session2_total",   $_COOKIE['stats_session2_total']);
$smarty->assign("stats_session2_average", $_COOKIE['stats_session2_average']);
if ($_COOKIE['stats_session2_average'] == $average)
    $smarty->assign("stats_session2_average_color","black");
elseif ($_COOKIE['stats_session2_average'] < $average)
    $smarty->assign("stats_session2_average_color","red");
else
    $smarty->assign("stats_session2_average_color","green");

// Update last month stats
if ( THIS_WEEK != $_COOKIE['stats_session2_week'] )
{
    setcookie("stats_session3_total",   $total_words, 2147483647);
    setcookie("stats_session3_average", $average, 2147483647);
    setcookie("stats_session3_month",   THIS_MONTH, 2147483647);
}
$smarty->assign("stats_session3_total",   $_COOKIE['stats_session3_total']);
$smarty->assign("stats_session3_average", $_COOKIE['stats_session3_average']);
if ($_COOKIE['stats_session3_average'] == $average)
    $smarty->assign("stats_session3_average_color","black");
elseif ($_COOKIE['stats_session3_average'] < $average)
    $smarty->assign("stats_session3_average_color","red");
else
    $smarty->assign("stats_session3_average_color","green");


// Display
$smarty->display('study/index.tpl');

?>
