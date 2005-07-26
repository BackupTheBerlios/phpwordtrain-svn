<html>
    <title>phpWordTrain</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <link rel="stylesheet" type="text/css" media="screen" href="{$site}style.css">
<body id="body">
<table width="100%" border="0" align="center">
<tr>  
<td id="MenuBar" height="41">
  <div align="center" id="Menu">
    <table border="0" width="100%" align="center">
    <tr>
      <td width="20%" align="center">
        <a href="{$site}index.php" 
            id={if $section!="Home"}"MenuHover"{else}"Normal"{/if}> 
            [Home]</a>
      </td>
      <td width="20%" align="center">
        <a href="{$site}study/index.php" 
            id={if $section!="Study"}"MenuHover"{else}"Normal"{/if}> 
            [Study]</a>
      </td>
      <td width="20%" align="center">
        <a href="{$site}dictionary/index.php?page=1&sort=word&way=asc" 
            id={if $section!="Dictionary"}"MenuHover"{else}"Normal"{/if}> 
            [Dictionary]</a>
      </td>      
      <td width="20%" align="center">
        <a href="{$site}admin/index.php" 
            id={if $section!="Admin"}"MenuHover"{else}"Normal"{/if}> 
            [Admin]</a>
      </td>
      </tr>
    </table>
  </div></td>
</tr>
<tr>
<td>
  <TABLE BORDER="0" CELLSPACING="20" ALIGN="left" WIDTH="100%">
  <tr><td>
    
