{include file="header.tpl"}

<table id="DisplayBox">
<tr>
    <td id="DisplayBox">Word</td>
    <td>{$word}</td>
</tr>
<tr>
    <td id="DisplayBox">Translation</td>
    <td>{$translation}</td>
</tr>
<tr>
    <td id="DisplayBox">Tip to solve word</td>
    <td>{$tip_word}</td>
</tr>
<tr>
    <td id="DisplayBox">Date input</td>
    <td>{$datein}</td>
</tr>
<tr>
    <td id="DisplayBox">Last asked</td>
    <td>{$lasthit}</td>
</tr>
<tr>
    <td id="DisplayBox">Scheduled for question</td>
    <td>{$scheduled}</td>
</tr>
<tr>
    <td id="DisplayBox">Misses</td>
    <td>{$misses}</td>
</tr><tr>
    <td id="DisplayBox">Level</td>
    <td>{$level}</td>
</tr>
<tr>
    <td><br/></td>
</tr>
<tr>
    <TD COLSPAN="2">
    <TABLE BORDER="0" ALIGN="center">
    <tr>
        <td><INPUT TYPE="button" VALUE="Edit" 
            ONCLICK="self.location = '../admin/edit.php?editingword={$link_word}'">
          </td>
    </tr>
    </table>
    </td>
</tr>
</table>


{include file="footer.tpl"}
