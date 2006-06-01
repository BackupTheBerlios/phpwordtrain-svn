{include file="header.tpl"}

<form action="edit.php" method="post">
<input type="hidden" name="date" value="{$date}">
<input type="hidden" name="datein" value="{$datein}">

<table id="InsertWords">
<tr>
    <td>Word</td>
    <td><input type="text"   name="new_word" value="{$word}">
        <input type="hidden" name="old_word" value="{$word}"></td>
<tr>
</tr>
    <td>Translation</td>
    <td><input type="text" name="translation" value="{$translation}"></td>
</tr>
<tr>
    <td>Tip to solve word</td>
    <td><input type="text" name="tip_word" value="{$tip_word}"></td>
</tr>
<tr>
    <td><br/></td>
</tr>
<tr>
    <TD COLSPAN="2">
    <TABLE BORDER="0" ALIGN="center">
    <tr>
        <td><input type="submit" name="action" value="Update"></td>
        <td><input type="submit" name="action" value="Remove"></td>
    </tr>
    </table>
    </td>
</tr>
</table>

</form>


{include file="footer.tpl"}
