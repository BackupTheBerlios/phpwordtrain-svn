{include file="header.tpl"}

<p>Here you can backup and restore your data. That is, your vocabulary and learning progress.</p>

<p>Remember this is alpha software, so you should keep backups of your work.</p>

<p>Your file format will be SQL instructions. Restore is not yet available, but you can do it manually with your MySQL client</p>

<br/>
<TABLE BORDER="0" WIDTH="40%" ALIGN="center">
<TR ALIGN="center">
    <td><INPUT TYPE="button" VALUE="Backup" 
       ONCLICK="self.location = 'backup.php?Action=backup'">
    </td>
    <td><INPUT TYPE="button" VALUE="Restore" DISABLED
       ONCLICK="self.location = 'backup.php?Action=restore'">
    </td>
</tr>
</TABLE>

<br/>
<hr/><br/>
<p><b>Last backup on:</b> {$lastbackup}</p>

{include file="footer.tpl"}
