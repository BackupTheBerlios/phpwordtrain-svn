{* Local dictionary listing and search fields
 *
 * Source: /dictionary/index.php
 * $Id$
 *}
 
{include file="header.tpl"}

{* Search forms *}

<table width="70%"  border="0" align="center" cellpadding="5">
  <tr>
    <form name="search1">
    {if $internet == 'yes' }
        <td>Search on Internet</td>
    {else}
        <td><FONT COLOR="#999999">Search on Internet</FONT></td>
    {/if}
    <td><input type="text" name="textfield1" 
        {if $internet == 'no' }DISABLED{/if} /></td>
    <td><SELECT NAME="select1" 
        {if $internet == 'no' }DISABLED{/if} />
      <option value="http://dict.leo.org/?lang=en&search=">
            Translate to English</option>
      <option value="http://dict.leo.org/?lang=en&search=">
            Translate to German</option>
      <option value="http://www.canoo.net/services/Controller?dispatch=inflection&lookup=caseInSensitive&input=">Grammar</option>
      <option value="http://www.dwds.de/cgi-bin/portalL.pl?search=">
            Definition</option>
    </select></td>
     <td><INPUT TYPE="button" VALUE="Search" {if $internet == 'no' }DISABLED{/if}
       ONCLICK="self.location =
            document.forms['search1'].select1.value+
            document.forms['search1'].textfield1.value" />
            
         </td> 
      </form>
  </tr>
  <tr>
    <form name="search2">

    <td>Search localy </td>
    <td><INPUT TYPE="text" NAME="localsearch" /></td>
    <td><select name="direction">
      <OPTION VALUE="word">Translate to English</option>
      <OPTION VALUE="trans">Translate to German</option>
    </select></td>
     <td><INPUT TYPE="button" VALUE="Search" 
       ONCLICK="self.location = 'search.php?'+
            document.forms['search2'].direction.value+
            '='+
            document.forms['search2'].localsearch.value">
       </td>

  </tr>
</table></form>


{* Page navigation links *}

<br/><P ALIGN="center">
{if $p_last > 0}
    <A HREF="index.php?page={$p_last}&total={$no_pages}&sort={$sorting}&way={$smarty.get.way}">&lt;</A>
{else}
    &lt;
{/if}
{foreach item=item from=$page_numbers}
    {if $item == $p_current}
        <font id="Highlight">{$item}</font>
    {else}
        <A HREF="index.php?page={$item}&total={$no_pages}&sort={$sorting}&way={$smarty.get.way}">{$item}</A>
    {/if}
{/foreach}
{if $p_next <= $no_pages}
    <A HREF="index.php?page={$p_next}&total={$no_pages}&sort={$sorting}&way={$smarty.get.way}">&gt;</A>
{else}
    &gt;
{/if}
</p>


{* Table with words and translations *}
<p>
<table border=1 id="WordsListing">
<tr id="Options">
    <TD WIDTH="38%">
        {if $smarty.get.sort == word}
            <A id="Normal" HREF="index.php?page={$p_current}&total={$no_pages}&sort=word&way={if $smarty.get.way == "desc"}asc{else}desc{/if}">Word</A>
        {else}
            <A HREF="index.php?page={$p_current}&total={$no_pages}&sort=word&way=asc">Word</A>
        {/if}</td>
    <TD WIDTH="38%">
        {if $smarty.get.sort == translation}
            <A id="Normal" HREF="index.php?page={$p_current}&total={$no_pages}&sort=translation&way={if $smarty.get.way == "desc"}asc{else}desc{/if}">Translation</A>
        {else}
            <A HREF="index.php?page={$p_current}&total={$no_pages}&sort=translation&way=asc">Translation</A>
        {/if}</td>
    <TD WIDTH="17%">
        {if $smarty.get.sort == type}
            <A id="Normal" HREF="index.php?page={$p_current}&total={$no_pages}&sort=type&way={if $smarty.get.way == "desc"}asc{else}desc{/if}">Type</A>
        {else}
            <A HREF="index.php?page={$p_current}&total={$no_pages}&sort=type&way=asc">Type</A>
        {/if}</td>
    <TD WIDTH="7%">
        {if $smarty.get.sort == level}
            <A id="Normal" HREF="index.php?page={$p_current}&total={$no_pages}&sort=level&way={if $smarty.get.way == "desc"}asc{else}desc{/if}">Level</A>
        {else}
            <A HREF="index.php?page={$p_current}&total={$no_pages}&sort=level&way=asc">Level</A>
        {/if}</td>
</tr>
{foreach name=outer item=contact from=$linea}
<tr ALIGN="left">
  {foreach item=item from=$contact}
    <td>{$item}</td>
  {/foreach}
</tr>
{/foreach}
</table>
</p>

{include file="footer.tpl"}
