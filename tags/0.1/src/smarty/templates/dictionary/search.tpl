{* 
 *
 * Source: /dictionary/search.php
 * $Id$
 *}
 
{include file="header.tpl"}

<p>Your search returned next words:</p><br/>

<table border=1 id="WordsListing">
<tr id="Options">
    {if $way == "word"}
        <TD WIDTH="30%">Word</td>
        <TD WIDTH="30%">Translation</td>
    {else}
        <TD WIDTH="30%">Translation</td>
        <TD WIDTH="30%">Word</td>
    {/if}
    <TD WIDTH="30%">Type</td>
    <TD WIDTH="10%">Level</td>
</tr>
{foreach item=contact from=$line}
<TR ALIGN="left">
  {foreach item=item from=$contact}
    <td>{$item}</td>
  {/foreach}
</tr>
{/foreach}
</table>

{include file="footer.tpl"}
