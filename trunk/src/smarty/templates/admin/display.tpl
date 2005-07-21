{include file="header.tpl"}

{$msg}

<p>This is the list of the words in your learning dictionary. To edit just press over the word.</p><br>
<table border=1 id="WordsListing">
<tr id="Options">
    <td>Word</td>
    <td>Translation</td>
    <td>Level</td>
    <td>Type</td>
    <td>Date in</td>
</tr>

{foreach name=outer item=contact from=$linea}
<tr ALIGN="left">
  {foreach item=item from=$contact}
    <td>{$item}</td>
  {/foreach}
</tr>
{/foreach}

</table>
{include file="footer.tpl"}
