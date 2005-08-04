{include file="header.tpl"}

<p>This is the list with the most troublesome words. Study them hard.</p>

<FORM ACTION="hardest.php" METHOD="post">
<DIV ALIGN="center">
<TABLE BORDER="0" ALIGN="center" WIDTH="80%">
	<TR ALIGN="center">
	    <TD WIDTH="25%">Max level:
		  <INPUT NAME="level" TYPE="text" VALUE="{$max_level}" MAXLENGTH="3" SIZE="3">
		</TD> 
		<TD WIDTH="25%">Max length:
		  <INPUT NAME="max" TYPE="text" VALUE="{$max_list}" MAXLENGTH="3" SIZE="3">
		</TD> 
		<TD WIDTH="25%">Misses:
		  <INPUT NAME="misses" TYPE="text" VALUE="{$min_misses}" MAXLENGTH="3" SIZE="3">
		</TD>
		<TD WIDTH="25%"><INPUT TYPE="submit" VALUE="Update list">
		</TD>
	</TR>
</TABLE>
</DIV>
 
</FORM>

<P ALIGN="center">
<table border=1 id="WordsListing">
<tr id="Options">
    <TD WIDTH="5%">Misses</td>
    <td WIDTH="45%">Word</td>
    <td WIDTH="45%">Translation</td>
</tr>

{foreach name=outer item=contact from=$linea}

<tr ALIGN="left">
  {foreach item=item from=$contact}
    <td>{$item}</td>
  {/foreach}
</tr>
{/foreach}

</table></p>
{include file="footer.tpl"}
