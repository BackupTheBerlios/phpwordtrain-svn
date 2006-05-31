<html>
<head>
   <title>phpWordTrain Configuration</title>
   <meta http-equiv="content-type" content="text/html; charset=utf-8">
   <link rel="stylesheet" type="text/css" media="screen" href="style.css">
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

<p> Your information seems right. 

<p> Next changes will take effect on next step:
<ul>
   <li>Creating database <b>{$database}</b></li>
   <li>Inserting MySQL user <b>phpwordtrain</b> with password <b>phpwordtrain_pass</b></li>
</ul> 

<p> Also, a new configuration file will be generated and downloaded. You must copy this to your <b>phpWordTrain</b> directory. After that, you won't see again this configuration menu.

<form name='configuration' action='config.php' method='post'>
   <input type='hidden' name='server' value='{$server}'> 
   <input type='hidden' name='database' value='{$database}'>
   <input type='hidden' name='user' value='{$user}'>
   <input type='hidden' name='password' value='{$password}'>
   <input type='hidden' name='homesite' value='{$homesite}'>
   <input type='hidden' name='localdir' value='{$localdir}'>
   <input type='hidden' name='mysqldump' value='{$mysqldump}'>
   <input type='hidden' name='gzip' value='{$gzip}'>
   
   <p align='center'><input type='submit' name='action' value='Finish'> </p>
</form>
</td></tr></tbody></table>
</td></tr></tbody></table>
</body></html>
