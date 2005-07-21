{include file="header.tpl"}

{$msg}

<form action="insert.php" method="post">

<table id="InsertWords">
<tr>
    <td>Word</td>
    <td><input type="text" name="word" value={$word}></td>
<tr>
</tr>
    <td>Translation</td>
    <td><input type="text" name="translation" value={$translation}></td>
</tr>
</tr>
    <td>Type</td>
    <td>
        <select name="type">
            {foreach item=op from=$types_list}
                <option value="{$op}"
                    {if $last_type == $op} SELECTED {/if}
                >{$op}
            {/foreach}
        </select>
    </td>
</tr>
<tr>
    <td>Tips to word</td>
    <td><input type="text" name="tip_word" value={$tip_word}></td>
</tr>
<tr>
    <td>Tips to translation</td>
    <td><input type="text" name="tip_trans" value={$tip_trans}></td>
</tr>
<tr><td><br/></td></tr>
<tr>
    <TD COLSPAN="2" ALIGN="center" VALIGN="middle"><input type="submit" value="Insert"></td>
</tr>
</table><br>

</form>
{include file="footer.tpl"}
