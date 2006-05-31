{include file="header.tpl"}

<p><a href='learn.php'>START</a> studying</p>
<p><a href='hardest.php'>LEARN</a> most dificult words</p>
<p><a href='makelist.php'>MAKE</a> new list of questions</p>

<br><p align="center">
<table id="Normal" width="60%" align="center">
<tr id="Normal_Header"><td align=center colspan=5>Statistics</td></tr>
<tr>
    <td align=center width="30%"></td>
    <td align=center width="17%">Today</td>
    <td align=center width="17%">Last day</td>
    <td align=center width="17%">Last week</td>
    <td align=center width="17%">Last month</td>
</tr>
{foreach item=item from=$stats}
<tr>
    <td id="Normal_First">Level {$item[0]}</td>
    <td align="right">{$item[1]}</td>
    <td align="right"><font color="{$item[3]}">{$item[2]}</font></td>
    <td align="right"><font color="{$item[5]}">{$item[4]}</font></td>
    <td align="right"><font color="{$item[7]}">{$item[6]}</font></td>
</tr>
{/foreach}
<tr><td colspan=5><br></td></tr>
<tr>
    <td id="Normal_First">Total words:</td>
    <td align="right">{$total}</td>
    <td align="right">{$stats_session1_total}</td>
    <td align="right">{$stats_session2_total}</td>
    <td align="right">{$stats_session3_total}</td>
</tr>
<tr>
    <td id="Normal_First">Average Level:</td>
    <td align="right">{$average|string_format:"%.4f"}</td>
    <td align="right">
      <font color="{$stats_session1_average_color}">
         {$stats_session1_average|string_format:"%.4f"}
      </font>
    </td>
    <td align="right">
      <font color="{$stats_session2_average_color}">
         {$stats_session2_average|string_format:"%.4f"}
      </font>
    </td>
    <td align="right">
      <font color="{$stats_session3_average_color}">
         {$stats_session3_average|string_format:"%.4f"}
      </font>
    </td>
</tr>
</table>
{include file="footer.tpl"}
