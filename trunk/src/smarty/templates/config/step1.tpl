<html>
<head>
   <title>phpWordTrain Configuration</title>
   <meta http-equiv="content-type" content="text/html; charset=utf-8">
   <link rel="stylesheet" type="text/css" media="screen" href="style.css">
      {literal} 
      <script language="javascript">
      <!--
         function disableIt(obj)
         {
	         obj.disabled = !(obj.disabled);
         }
         function disableBackup(obj)
         {
	         disableIt(obj);
            if ( obj.disabled == true)
            {
               document.configuration.dump_available.value = 0;
               alert("If you disable this, you won't be able to backup your data!!!");
            }
            else
            {
               document.configuration.dump_available.value = 1;
            }
         }
         function disableGzip(obj)
         {
	         disableIt(obj);
            if ( obj.disabled == true)
            {
               document.configuration.gzip_available.value = 0;
            }
            else
            {
               document.configuration.gzip_available.value = 1;
            }
         }
        //-->
      </script>
      {/literal}
<body id="body" >
<table align="center" border="0" width="100%">
<tbody><tr>  
<td id="MenuBar" height="41">
  <div id="Menu" align="center">
    <table align="center" border="0" width="100%">
    <tbody><tr align="center" valign="center">
      <td align="center" valign="center" >
         <h2>phpWordTrain Configuration</h2>
      </td>
      </tr>
    </tbody></table>
  </div></td>
</tr>
<tr>
<td>

<table align="left" border="0" cellspacing="20" width="100%">
<tbody><tr><td>

      <p>It seems your program is not properly installed. Please, fill up next information to configure phpWordTrain and your system.

      <p> You will be asked for your database admin user.    


<form name='configuration' action='config.php' method='post'>
<p align="center"><table id="Normal">
<tr id="Normal_Header"> <td colspan=4> MySQL database information </td> </tr>
<tr>
   <td id="Normal_First"> Server </td>
   <td><input type='text' name='server' size='20' value='{$server}'> </td>
   <td> &nbsp; </td>
   <td bgcolor='{$server_status}'>&nbsp; </td>
   {if ($server_status eq green) } {assign var="ready" value="`$ready+1`"} {/if}
</tr>
<tr>
   <td id="Normal_First"> Database </td>
   <td><input type='text' name='database' size='20' value='{$database}'> </td>
   <td> <p id="Error">{$database_msg}</p></td>
   <td bgcolor='{$database_status}'>&nbsp; </td>
   {if ($database_status eq green) } {assign var="ready" value="`$ready+1`"} {/if}
</tr>
<tr>
   <td id="Normal_First"> Admin user </td>
   <td> <input type='text' name='user' size='20' value='{$user}'> </td>
   <td>&nbsp;</td>
   <td bgcolor='{$user_status}'>&nbsp;</td>
   {if ($user_status eq green) } {assign var="ready" value="`$ready+1`"} {/if}
</tr>
<tr>
   <td id="Normal_First"> Admin password </td>
   <td> <input type='password' name='password' size='20' value='{$password}'> </td>
   <td>&nbsp;</td>
   <td bgcolor='{$password_status}'>&nbsp;</td>
   {if ($password_status eq green) } {assign var="ready" value="`$ready+1`"} {/if}
</tr>
<tr> <td colspan=4> &nbsp;</td> </tr>
<tr id="Normal_Header"> <td colspan=4> External programs</td> </tr>
<tr>
   <td id="Normal_First"> MYSQL_DUMP </td>
   <td> <input {$mysqldump_activation} type='text' name='mysqldump' size='20'value='{$mysqldump}'></td>
   <td>
      <a href="javascript:disableBackup(document.configuration.mysqldump)">
      [ Disable/Enable ]</a>
   </td>
   <td bgcolor='{$mysqldump_status}'>&nbsp;</td>
   {if ($mysqldump_status eq green) } {assign var="ready" value="`$ready+1`"} {/if}
</tr>
<tr>
   <td id="Normal_First"> Compressor </td>
   <td> <input {$gzip_activation} type='text' name='gzip' size='20' value='{$gzip}'></td>
   <td>
      <a href="javascript:disableGzip(document.configuration.gzip)">
      [ Disable/Enable ]</a>
   </td>
   <td bgcolor='{$gzip_status}'>&nbsp;</td>
   {if ($gzip_status eq green) } {assign var="ready" value="`$ready+1`"} {/if}
</tr>
<tr> <td colspan=4> &nbsp;</td> </tr>
<tr id="Normal_Header"> <td colspan=4> Instalation information</td> </tr>
<tr>
   <td id="Normal_First"> Homesite URL </td>
   <td colspan=2> <input type='text' name='url' size='50' value='{$homesite}'> </td>
   <td bgcolor='{$homesite_status}'>&nbsp;</td>
   {if ($homesite_status eq green) } {assign var="ready" value="`$ready+1`"} {/if}
</tr>
<tr>
   <td id="Normal_First"> Local directory </td>
   <td colspan=2> <input type='text' name='localdir' size='50' value='{$localdir}'> </td>
   <td bgcolor='{$localdir_status}'>&nbsp;</td>
   {if ($localdir_status eq green) } {assign var="ready" value="`$ready+1`"} {/if}
</tr>
<tr> <td colspan=4> &nbsp;</td> </tr>
<tr id="Normal_Buttons">
   <td colspan=4 > 
      <input type='submit' name='action' value='Check'> 
      <input type='hidden' name='dump_available' value='{$dump_available_default}' > 
      <input type='hidden' name='gzip_available' value='{$gzip_available_default}' > 
      <input type='hidden' name='ready_values' value='{$ready}' > 
   </td>
</tr>
</table></p>
</form>
</td></tr></tbody></table>
</td></tr></tbody></table>
</body></html>
